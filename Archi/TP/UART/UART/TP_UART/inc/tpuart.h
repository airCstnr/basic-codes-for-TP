#ifndef _TPUART_H_
#define _TPUART_H_


#include "stm32f1xx_hal.h"


#define TPUART_ERRORLED_PIN GPIO_PIN_5
#define TPUART_ERRORLED_PORT GPIOA

#define TPUART_TXPIN GPIO_PIN_9
#define TPUART_TXPORT GPIOA
#define TPUART_RXPIN GPIO_PIN_10
#define TPUART_RXPORT GPIOA

#define TPUART_CAESAR_KEY 1



typedef enum
{
  TPUART_OK = (uint32_t)(0x00000000),
  TPUART_ERR = (uint32_t)(0x00000001)
}TPUART_Status;


typedef enum
{
  TPUART_LOCKED = (uint32_t)(0x00000000),
  TPUART_UNLOCKED = (uint32_t)(0x00000001)
}TPUART_LockStatus;




void TPUART_ErrorLedInit(void);
void TPUART_ErrorLedToggle(void);
void TPUART_ErrorHandler(void);

TPUART_Status TPUART_Init(void);
void TPUART_InitUartHandle(UART_HandleTypeDef *uartHandleStruct);
void TPUART_InitPeriph(void);
TPUART_Status TPUART_Send(uint8_t *sendBuffer, uint16_t sendSize);
TPUART_Status TPUART_ReceiveStringInit(uint8_t *receiveBuffer, uint16_t receiveBufferSize);
void TPUART_ReceiveStringCallback(uint8_t *receiveBuffer, uint16_t receiveCount);

uint8_t TPUART_CaesarChar(uint8_t character, uint8_t caesarKey);
void TPUART_CaesarString(uint8_t *inString, uint8_t *outString, uint16_t size, uint8_t caesarKey);
void TPUART_CopyString(uint8_t *str1, uint8_t *str2, uint16_t size);

#endif
