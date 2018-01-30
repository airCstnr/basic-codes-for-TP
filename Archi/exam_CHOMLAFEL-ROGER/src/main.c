/**
  ******************************************************************************
  * @file    main.c
  * @author  Ac6
  * @version V1.0
  * @date    01-December-2013
  * @brief   Default main function.
  ******************************************************************************
*/

#include "main.h"

void SystemClock_Config(void) {
  RCC_ClkInitTypeDef clkinitstruct = {0};
  RCC_OscInitTypeDef oscinitstruct = {0};

  /* Configure PLL ------------------------------------------------------*/
  /* PLL configuration: PLLCLK = (HSI / 2) * PLLMUL = (8 / 2) * 16 = 64 MHz */
  /* PREDIV1 configuration: PREDIV1CLK = PLLCLK / HSEPredivValue = 64 / 1 = 64 MHz */
  /* Enable HSI and activate PLL with HSi_DIV2 as source */
  oscinitstruct.OscillatorType  = RCC_OSCILLATORTYPE_HSI;
  oscinitstruct.HSEState        = RCC_HSE_OFF;
  oscinitstruct.LSEState        = RCC_LSE_OFF;
  oscinitstruct.HSIState        = RCC_HSI_ON;
  oscinitstruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  oscinitstruct.HSEPredivValue    = RCC_HSE_PREDIV_DIV1;
  oscinitstruct.PLL.PLLState    = RCC_PLL_ON;
  oscinitstruct.PLL.PLLSource   = RCC_PLLSOURCE_HSI_DIV2;
  oscinitstruct.PLL.PLLMUL      = RCC_PLL_MUL16;
  if (HAL_RCC_OscConfig(&oscinitstruct)!= HAL_OK) {
    /* Initialization Error */
    while(1);
  }

  /* Select PLL as system clock source and configure the HCLK, PCLK1 and PCLK2
     clocks dividers */
  clkinitstruct.ClockType = (RCC_CLOCKTYPE_SYSCLK | RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2);
  clkinitstruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  clkinitstruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  clkinitstruct.APB2CLKDivider = RCC_HCLK_DIV1;
  clkinitstruct.APB1CLKDivider = RCC_HCLK_DIV2;
  if (HAL_RCC_ClockConfig(&clkinitstruct, FLASH_LATENCY_2)!= HAL_OK) {
    /* Initialization Error */
    while(1);
  }
}


//uint16_t segPins[8] = {GPIO_PIN_5, GPIO_PIN_6, GPIO_PIN_1, GPIO_PIN_0, GPIO_PIN_5, GPIO_PIN_8, GPIO_PIN_10, GPIO_PIN_4};
//GPIO_TypeDef *segPorts[8] = {GPIOA, GPIOA, GPIOC, GPIOC, GPIOB, GPIOA, GPIOA, GPIOA};
uint16_t segPins[7] = {GPIO_PIN_5, GPIO_PIN_6, GPIO_PIN_1, GPIO_PIN_0, GPIO_PIN_5, GPIO_PIN_8, GPIO_PIN_10};
GPIO_TypeDef *segPorts[7] = {GPIOA, GPIOA, GPIOC, GPIOC, GPIOB, GPIOA, GPIOA};
GPIO_InitTypeDef io_seg[7];
GPIO_InitTypeDef io_segTest;
GPIO_InitTypeDef io_anode[2];
GPIO_InitTypeDef io_clk_sw;
GPIO_InitTypeDef io_btn_1;
GPIO_InitTypeDef io_btn_2;

char statutAnodes;

// Instance du timer (à mettre en global et dans le .h)
TIM_HandleTypeDef timer2;
TIM_HandleTypeDef timer3;
unsigned int nombreAffiche;
char clk_sw;

int main(void)
{
	HAL_Init();
	SystemClock_Config();

	__HAL_RCC_GPIOA_CLK_ENABLE();
	__HAL_RCC_GPIOB_CLK_ENABLE();
	__HAL_RCC_GPIOC_CLK_ENABLE();
	__HAL_RCC_AFIO_CLK_ENABLE();
	__HAL_AFIO_REMAP_SWJ_NONJTRST();
	__HAL_RCC_TIM2_CLK_ENABLE();
	__HAL_RCC_TIM3_CLK_ENABLE();

	for (int i=0; i<7; i++) {
		io_seg[i].Mode  = GPIO_MODE_OUTPUT_PP;
		io_seg[i].Pull  = GPIO_PULLUP;
		io_seg[i].Speed = GPIO_SPEED_FREQ_LOW;
		io_seg[i].Pin   = segPins[i];
		HAL_GPIO_Init(segPorts[i], &io_seg[i]);
	}

	// Anode A - Dizaines
	io_anode[0].Mode  = GPIO_MODE_OUTPUT_PP;
	io_anode[0].Pull  = GPIO_PULLUP;
	io_anode[0].Speed = GPIO_SPEED_FREQ_LOW;
	io_anode[0].Pin   = GPIO_PIN_4;
	HAL_GPIO_Init(GPIOB, &io_anode[0]);

	// Anode B - Unitées
	io_anode[1].Mode  = GPIO_MODE_OUTPUT_PP;
	io_anode[1].Pull  = GPIO_PULLUP;
	io_anode[1].Speed = GPIO_SPEED_FREQ_LOW;
	io_anode[1].Pin   = GPIO_PIN_10;
	HAL_GPIO_Init(GPIOB, &io_anode[1]);

	// GPIO Clock Switch
	io_clk_sw.Mode  = GPIO_MODE_OUTPUT_PP;
	io_clk_sw.Pull  = GPIO_PULLUP;
	io_clk_sw.Speed = GPIO_SPEED_FREQ_LOW;
	io_clk_sw.Pin   = GPIO_PIN_9;
	HAL_GPIO_Init(GPIOA, &io_clk_sw);

	// Buttons
	io_btn_1.Mode  = GPIO_MODE_IT_RISING;
	io_btn_1.Pull  = GPIO_PULLUP;
	io_btn_1.Speed = GPIO_SPEED_FREQ_LOW;
	io_btn_1.Pin   = GPIO_PIN_6;
	HAL_GPIO_Init(GPIOB, &io_btn_1);

	io_btn_2.Mode  = GPIO_MODE_IT_RISING;
	io_btn_2.Pull  = GPIO_PULLUP;
	io_btn_2.Speed = GPIO_SPEED_FREQ_LOW;
	io_btn_2.Pin   = GPIO_PIN_7;
	HAL_GPIO_Init(GPIOA, &io_btn_2);

	// Timer
	HAL_NVIC_SetPriority(TIM2_IRQn, 3, 0);
	HAL_NVIC_EnableIRQ(TIM2_IRQn);
	HAL_NVIC_SetPriority(TIM3_IRQn, 2, 0);
	HAL_NVIC_EnableIRQ(TIM3_IRQn);

	// Configuration de l'instance timer
	timer2.Instance = TIM2;
	timer2.Init.Prescaler = 32000;
	timer2.Init.Period = 100;
	timer2.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
	timer2.Init.CounterMode = TIM_COUNTERMODE_UP;
	timer2.Init.RepetitionCounter = 0;

	timer3.Instance = TIM3;
	timer3.Init.Prescaler = 32000;
	timer3.Init.Period = 10;
	timer3.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
	timer3.Init.CounterMode = TIM_COUNTERMODE_UP;
	timer3.Init.RepetitionCounter = 0;

	// Activation du timer
	HAL_TIM_Base_Init(&timer2);
	HAL_TIM_Base_Start_IT(&timer2);
	HAL_TIM_Base_Init(&timer3);
	HAL_TIM_Base_Start_IT(&timer3);

	// Activation des interruptions sur btn 1 et 2
	HAL_NVIC_SetPriority(EXTI9_5_IRQn, 0, 0);
	HAL_NVIC_EnableIRQ(EXTI9_5_IRQn);

	// LOGIC
	nombreAffiche = 0;
	for(;;) {
		//HAL_GPIO_ReadPin(GPIOC, GPIO_PIN_13)
		//HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, 1);
		HAL_Delay(100);
	}
}

char segments[16] = {
		0b1111110, // 0
		0b0110000, // 1
		0b1101101, // 2
		0b1111001, // 3
		0b0110011, // 4
		0b1011011, // 5
		0b1011111, // 6
		0b1110000, // 7
		0b1111111, // 8
		0b1111011, // 9
		0b1110111, // A
		0b0011111, // B
		0b1001110, // C
		0b0111101, // D
		0b1001111, // E
		0b1000111  // F
};

char decodeQuartet(char quartet) {
	return segments[quartet];
}

void afficheNombre(char nombre) {
	char val = decodeQuartet(nombre);
	for (int i=0; i<7; i++) {
		char mask = 1<<i;
		char res = val & mask;
		char state = (res == mask);
		HAL_GPIO_WritePin(segPorts[6-i], segPins[6-i], !state);
	}
}

// Callback du timer (là où on mets notre code)
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim) {
	if (htim->Instance == TIM3) {
		statutAnodes = !statutAnodes;
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_4, statutAnodes);
		HAL_GPIO_WritePin(GPIOB, GPIO_PIN_10, !statutAnodes);
		if (!statutAnodes) afficheNombre(nombreAffiche & 0xF);
		else afficheNombre(nombreAffiche >> 4);
	} else if (htim->Instance == TIM2) {
		HAL_GPIO_WritePin(GPIOA, GPIO_PIN_9, clk_sw);
		clk_sw=!clk_sw;
	}
}

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin) {
	if (GPIO_Pin==GPIO_PIN_6) {
		nombreAffiche++;
	} else {
		nombreAffiche--;
	}
}
