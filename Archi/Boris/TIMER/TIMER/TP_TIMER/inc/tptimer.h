#ifndef _TPTIMER_H_
#define _TPTIMER_H_


#include "stm32f1xx_hal.h"


#define TPTIMER_LED_PIN GPIO_PIN_5
#define TPTIMER_LED_PORT GPIOA



typedef enum
{
  TPTIMER_OK = (uint32_t)(0x00000000),
  TPTIMER_ERR = (uint32_t)(0x00000001)
}TPTIMER_Status;




void TPTIMER_LedInit(void);
void TPTIMER_LedToggle(void);
void TPTIMER_ErrorHandler(void);

TPTIMER_Status TPTIMER_Init(void);
void TPTIMER_InitPeriph(void);
void TPTIMER_InitHandler(TIM_HandleTypeDef *timHandleStruct);
TPTIMER_Status TPTIMER_Start(void);
TPTIMER_Status TPTIMER_Stop(void);
__weak void TPTIMER_Callback(void);



#endif
