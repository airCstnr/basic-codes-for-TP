#ifndef _TPADC_H_
#define _TPADC_H_


#include "stm32f1xx_hal.h"


#define TPADC_LED_PIN GPIO_PIN_5
#define TPADC_LED_PORT GPIOA



typedef enum
{
  TPADC_OK = (uint32_t)(0x00000000),
  TPADC_ERR = (uint32_t)(0x00000001)
}TPADC_Status;



void TPADC_LedInit(void);
void TPADC_LedToggle(void);
void TPADC_ErrorHandler(void);

TPADC_Status TPADC_Init(void);
void TPADC_InitPeriph(void);




#endif
