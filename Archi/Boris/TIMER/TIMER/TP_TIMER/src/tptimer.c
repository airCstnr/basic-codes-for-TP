#include "stm32f1xx_hal.h"
#include "tptimer.h"



TIM_HandleTypeDef timHandleStruct;



void TPTIMER_ErrorHandler(void){
	while(1){
		TPTIMER_LedToggle();
		HAL_Delay(50);
	}
}


void TPTIMER_LedInit(void){
	GPIO_InitTypeDef gpioInitStruct;
	
	gpioInitStruct.Pin = TPTIMER_LED_PIN;
	gpioInitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	gpioInitStruct.Pull = GPIO_NOPULL;
	gpioInitStruct.Speed = GPIO_SPEED_FREQ_MEDIUM;
	
	__HAL_RCC_GPIOA_CLK_ENABLE();
	HAL_GPIO_Init(TPTIMER_LED_PORT, &gpioInitStruct);
}



void TPTIMER_LedToggle(void){
	HAL_GPIO_TogglePin(TPTIMER_LED_PORT, TPTIMER_LED_PIN);
}


TPTIMER_Status TPTIMER_Init(void){
	TPTIMER_InitHandler(&timHandleStruct);
	TPTIMER_InitPeriph();
	
	if(HAL_TIM_Base_Init(&timHandleStruct) != HAL_OK){
		return TPTIMER_ERR;
	}
	else{
		return TPTIMER_OK;
	}
}


void TPTIMER_InitPeriph(void){
	// Activer clock TIM3
	__HAL_RCC_TIM3_CLK_ENABLE();
	
	// Configurer les Interruptions
	HAL_NVIC_SetPriority(TIM3_IRQn, 3, 0);
	HAL_NVIC_EnableIRQ(TIM3_IRQn);
}



void TPTIMER_InitHandler(TIM_HandleTypeDef *timHandleStruct){
	timHandleStruct->Instance = TIM3;
	timHandleStruct->Init.Prescaler = 32000; // Ticks de 1ms (avec SYSCLK=64MHz, AHB=1, APB1=2)
	timHandleStruct->Init.Period = 100;   // TIM3_ARR
	timHandleStruct->Init.CounterMode = TIM_COUNTERMODE_UP;
	timHandleStruct->Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
	timHandleStruct->Init.RepetitionCounter = 0;
	timHandleStruct->Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
	//timHandleStruct->Channel = TIM_CHANNEL_ALL;
}



void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *timHandleStruct){
	TPTIMER_Callback();
}


TPTIMER_Status TPTIMER_Start(void){
	if(HAL_TIM_Base_Start_IT(&timHandleStruct) != HAL_OK){
		return TPTIMER_ERR;
	}
	else{
		return TPTIMER_OK;
	}
}


TPTIMER_Status TPTIMER_Stop(void){
	if(HAL_TIM_Base_Stop_IT(&timHandleStruct) != HAL_OK){
		return TPTIMER_ERR;
	}
	else{
		return TPTIMER_OK;
	}
}


__weak void TPTIMER_Callback(void){
	
}

