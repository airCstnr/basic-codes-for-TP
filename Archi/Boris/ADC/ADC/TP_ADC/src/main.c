#include "stm32f1xx_hal.h"

#include "main.h"
#include "tpadc.h"
#include <stdlib.h>



extern ADC_HandleTypeDef adcHandleStruct;
UART_HandleTypeDef uartHandleStruct;

char buffer[20];



int main(void){	
	HAL_Init();
	SystemClock_Config();
	TPADC_LedInit();
		
	uartHandleStruct.Instance = USART2;
	uartHandleStruct.Init.BaudRate = 9600;
	uartHandleStruct.Init.WordLength = UART_WORDLENGTH_8B;
	uartHandleStruct.Init.StopBits = UART_STOPBITS_1;
	uartHandleStruct.Init.Parity = UART_PARITY_NONE;
	uartHandleStruct.Init.Mode = UART_MODE_TX_RX;
	uartHandleStruct.Init.HwFlowCtl = UART_HWCONTROL_NONE;
	uartHandleStruct.Init.OverSampling = UART_OVERSAMPLING_16;	
	
	
	if(HAL_UART_Init(&uartHandleStruct) != HAL_OK){
		TPADC_ErrorHandler();
	}
	
	if(TPADC_Init() != TPADC_OK){
		TPADC_ErrorHandler();
	}
	
	if(HAL_ADCEx_Calibration_Start(&adcHandleStruct)){
		TPADC_ErrorHandler();
	}
	
	
	while(1){
		HAL_ADC_Start_IT(&adcHandleStruct);
		//HAL_ADC_Stop_IT(&adcHandleStruct);
		
		HAL_Delay(250);
	}
	
	return 0;
}


void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef *pAdcHandleStruct){
	uint32_t adc_value;
	uint32_t adc_value_length;
	
	adc_value = HAL_ADC_GetValue(pAdcHandleStruct);
	adc_value_length = number_length(adc_value);
	itoa(adc_value, buffer, 10);
	buffer[adc_value_length] = '\r';
	buffer[adc_value_length + 1] = '\n';
	
	//HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_SET);
	HAL_UART_Transmit_IT(&uartHandleStruct, (uint8_t*)buffer, adc_value_length+2);
}


void HAL_ADC_ErrorCallback(ADC_HandleTypeDef *adcHandleStruct){
	buffer[0] = 'E';
	buffer[1] = 'R';
	buffer[2] = 'R';
	buffer[3] = '\r';
	buffer[4] = '\n';
	
	//HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_SET);
	HAL_UART_Transmit_IT(&uartHandleStruct, (uint8_t*)buffer, 5);
}



void HAL_UART_TxCpltCallback(UART_HandleTypeDef *uartHandleStruct){
	//HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_RESET);
}


void HAL_UART_RxCpltCallback(UART_HandleTypeDef *uartHandleStruct){
	
}


void HAL_ADC_LevelOutOfWindowCallback(ADC_HandleTypeDef *adcHandleStruct){
	//uint8_t buff[] = "WATCHDOG : OUT OF WINDOW !! \r\n";
	
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_SET);
	//HAL_UART_Transmit_IT(&uartHandleStruct, buff, 30);
}




uint32_t number_length(uint32_t x){
	if(x>=1000000000) return 10;
    if(x>=100000000) return 9;
    if(x>=10000000) return 8;
    if(x>=1000000) return 7;
    if(x>=100000) return 6;
    if(x>=10000) return 5;
    if(x>=1000) return 4;
    if(x>=100) return 3;
    if(x>=10) return 2;
    return 1;
}




/**
  * @brief  System Clock Configuration
  *         The system Clock is configured as follow : 
  *            System Clock source            = PLL (HSI)
  *            SYSCLK(Hz)                     = 64000000
  *            HCLK(Hz)                       = 64000000
  *            AHB Prescaler                  = 1
  *            APB1 Prescaler                 = 2
  *            APB2 Prescaler                 = 1
  *            PLLMUL                         = 16
  *            Flash Latency(WS)              = 2
  * @param  None
  * @retval None
  */
void SystemClock_Config(void)
{
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
  
  if (HAL_RCC_OscConfig(&oscinitstruct)!= HAL_OK)
  {
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
  
  if (HAL_RCC_ClockConfig(&clkinitstruct, FLASH_LATENCY_2)!= HAL_OK)
  {
    /* Initialization Error */
    while(1); 
  }
}

