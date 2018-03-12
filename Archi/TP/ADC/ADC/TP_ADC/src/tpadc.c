#include "stm32f1xx_hal.h"
#include "tpadc.h"



ADC_HandleTypeDef adcHandleStruct;



void TPADC_ErrorHandler(void){
	while(1){
		TPADC_LedToggle();
		HAL_Delay(25);
	}
}


void TPADC_LedInit(void){
	GPIO_InitTypeDef gpioInitStruct;
	
	gpioInitStruct.Pin = TPADC_LED_PIN;
	gpioInitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	gpioInitStruct.Pull = GPIO_NOPULL;
	gpioInitStruct.Speed = GPIO_SPEED_FREQ_MEDIUM;
	
	__HAL_RCC_GPIOA_CLK_ENABLE();
	HAL_GPIO_Init(TPADC_LED_PORT, &gpioInitStruct);
}



void TPADC_LedToggle(void){
	HAL_GPIO_TogglePin(TPADC_LED_PORT, TPADC_LED_PIN);
}


TPADC_Status TPADC_Init(void){
	ADC_ChannelConfTypeDef channelConfStruct;	
	ADC_AnalogWDGConfTypeDef watchdogConfStruct;

	
	/* ADC HANDLE & INIT */
	adcHandleStruct.Instance = ADC1;
	adcHandleStruct.Init.DataAlign = ADC_DATAALIGN_RIGHT;
	adcHandleStruct.Init.ScanConvMode = ADC_SCAN_DISABLE;
	adcHandleStruct.Init.ContinuousConvMode = DISABLE;
	adcHandleStruct.Init.DiscontinuousConvMode = DISABLE;
	adcHandleStruct.Init.NbrOfConversion = 1;
	adcHandleStruct.Init.NbrOfDiscConversion = 1;
	adcHandleStruct.Init.ExternalTrigConv = ADC_SOFTWARE_START;
	
	if(HAL_ADC_Init(&adcHandleStruct) != HAL_OK) return TPADC_ERR;
	
	
	/* ADC CONFIG CHANNEL */
	channelConfStruct.Channel = ADC_CHANNEL_0;
	channelConfStruct.Rank = ADC_REGULAR_RANK_1;
	channelConfStruct.SamplingTime = ADC_SAMPLETIME_41CYCLES_5;
	
	if(HAL_ADC_ConfigChannel(&adcHandleStruct, &channelConfStruct) != HAL_OK) return TPADC_ERR;
	
	
	/* CONFIG WATCHDOG */
	watchdogConfStruct.WatchdogMode = ADC_ANALOGWATCHDOG_ALL_REG;
	watchdogConfStruct.HighThreshold = 3500;
	watchdogConfStruct.LowThreshold = 1000;
	watchdogConfStruct.Channel = ADC_CHANNEL_0;
	watchdogConfStruct.ITMode = ENABLE;
	watchdogConfStruct.WatchdogNumber = 0;
	
	if(HAL_ADC_AnalogWDGConfig(&adcHandleStruct, &watchdogConfStruct) != HAL_OK) return TPADC_ERR;
	
	
	return TPADC_OK;
}


void TPADC_InitPeriph(void){
	
}
