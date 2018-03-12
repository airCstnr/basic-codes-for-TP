/**
  ******************************************************************************
  * @file    stm32f1xx_it.c
  * @author  Ac6
  * @version V1.0
  * @date    02-Feb-2015
  * @brief   Default Interrupt Service Routines.
  ******************************************************************************
*/

/* Includes ------------------------------------------------------------------*/
#include "stm32f1xx_hal.h"
#include "stm32f1xx.h"
#ifdef USE_RTOS_SYSTICK
#include <cmsis_os.h>
#endif
#include "stm32f1xx_it.h"
#include "main.h"

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/

/******************************************************************************/
/*            	  	    Processor Exceptions Handlers                         */
/******************************************************************************/

/**
  * @brief  This function handles SysTick Handler, but only if no RTOS defines it.
  * @param  None
  * @retval None
  */
void SysTick_Handler(void)
{
	HAL_IncTick();
	HAL_SYSTICK_IRQHandler();
#ifdef USE_RTOS_SYSTICK
	osSystickHandler();
#endif
}

// Configuration du handler timer
void TIM2_IRQHandler() {
	// On à besoin d'accèder à la variable globale d'instance (timer)
	// Il faut donc inclure le .h
	HAL_TIM_IRQHandler(&timer2);
}
void TIM3_IRQHandler() {
	// On à besoin d'accèder à la variable globale d'instance (timer)
	// Il faut donc inclure le .h
	HAL_TIM_IRQHandler(&timer3);
}

// Chargement du handler interruption
void EXTI9_5_IRQHandler() {
	HAL_GPIO_EXTI_IRQHandler(GPIO_PIN_6);
	HAL_GPIO_EXTI_IRQHandler(GPIO_PIN_7);
}
