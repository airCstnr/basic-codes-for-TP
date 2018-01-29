#include "stm32f1xx_hal.h"
#include "tpuart.h"
#include <ctype.h>


uint8_t *globalReceiveBuffer = NULL;
uint16_t globalReceiveBufferSize = 0;
uint16_t globalReceiveCount = 0;
uint32_t globalReceiveLockStatus = TPUART_UNLOCKED;
uint8_t globalReceiveTmpBuffer[1];

UART_HandleTypeDef uartHandleStruct;




void TPUART_ErrorHandler(void){
	while(1){
		TPUART_ErrorLedToggle();
		HAL_Delay(50);
	}
}


void TPUART_ErrorLedInit(void){
	GPIO_InitTypeDef gpioInitStruct;
	
	gpioInitStruct.Pin = TPUART_ERRORLED_PIN;
	gpioInitStruct.Mode = GPIO_MODE_OUTPUT_PP;
	gpioInitStruct.Pull = GPIO_NOPULL;
	gpioInitStruct.Speed = GPIO_SPEED_FREQ_MEDIUM;
	
	HAL_GPIO_Init(TPUART_ERRORLED_PORT, &gpioInitStruct);
	__HAL_RCC_GPIOA_CLK_ENABLE();
}



void TPUART_ErrorLedToggle(void){
	HAL_GPIO_TogglePin(TPUART_ERRORLED_PORT, TPUART_ERRORLED_PIN);
}



TPUART_Status TPUART_Init(void){
	TPUART_ErrorLedInit();
	TPUART_InitPeriph();
	TPUART_InitUartHandle(&uartHandleStruct);
	
	if(HAL_UART_Init(&uartHandleStruct) != HAL_OK){
		return TPUART_ERR;
	}
	else{
		return TPUART_OK;
	}
}


void TPUART_InitUartHandle(UART_HandleTypeDef *uartHandleStruct){
	uartHandleStruct->Instance = USART1;
	uartHandleStruct->Init.BaudRate = 9600;
	uartHandleStruct->Init.Mode = UART_MODE_TX_RX;
	uartHandleStruct->Init.OverSampling = UART_OVERSAMPLING_16;
	uartHandleStruct->Init.Parity = UART_PARITY_NONE;
	uartHandleStruct->Init.StopBits = UART_STOPBITS_1;
	uartHandleStruct->Init.WordLength = UART_WORDLENGTH_8B;
	uartHandleStruct->Init.HwFlowCtl = UART_HWCONTROL_NONE;
}


TPUART_Status TPUART_Send(uint8_t *sendBuffer, uint16_t sendSize){
	if(HAL_UART_Transmit_IT(&uartHandleStruct, sendBuffer, sendSize) != HAL_OK){
		return TPUART_ERR;
	}
	else{
		return TPUART_OK;
	}
}



TPUART_Status TPUART_ReceiveStringInit(uint8_t *receiveBuffer, uint16_t receiveBufferSize){
	globalReceiveBuffer = receiveBuffer;
	globalReceiveBufferSize = receiveBufferSize;
	globalReceiveCount = 0;
	globalReceiveLockStatus = TPUART_UNLOCKED;
	
	if(HAL_UART_Receive_IT(&uartHandleStruct, globalReceiveTmpBuffer, 1) != HAL_OK){
		return TPUART_ERR;
	}
	else{
		return TPUART_OK;
	}
}


void HAL_UART_RxCpltCallback(UART_HandleTypeDef *uartHandleStruct){	
	uint8_t data;
	
	//data = globalReceiveTmpBuffer[0];
	data = *((uartHandleStruct->pRxBuffPtr) - 1);
		
	
	if(globalReceiveLockStatus == TPUART_LOCKED){
		HAL_UART_Receive_IT(uartHandleStruct, globalReceiveTmpBuffer, 1);
		return;
	}
	
	if(globalReceiveCount >= globalReceiveBufferSize){
		HAL_UART_Receive_IT(uartHandleStruct, globalReceiveTmpBuffer, 1);
		return;
	}
	
	globalReceiveBuffer[globalReceiveCount] = data;
	globalReceiveCount++;
	
	if((data == '\0') || (data == '\n')){
		globalReceiveLockStatus = TPUART_LOCKED;
		TPUART_ReceiveStringCallback(globalReceiveBuffer, globalReceiveCount);
		globalReceiveCount = 0;
		globalReceiveLockStatus = TPUART_UNLOCKED;
	}
	
	HAL_UART_Receive_IT(uartHandleStruct, globalReceiveTmpBuffer, 1);
}



void HAL_UART_TxCpltCallback(UART_HandleTypeDef *uartHandleStruct){
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_5, GPIO_PIN_RESET);
}


__weak void TPUART_ReceiveStringCallback(uint8_t *receiveBuffer, uint16_t receiveCount){
	
}



void TPUART_InitPeriph(void){
	GPIO_InitTypeDef gpioInitStruct;
	
	/* Initialisation pin TX */
	gpioInitStruct.Pin = TPUART_TXPIN;
	gpioInitStruct.Mode = GPIO_MODE_AF_PP;
	gpioInitStruct.Pull = GPIO_PULLUP;
	gpioInitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	//gpioInitStruct.Alternate = GPIO_AF7_USART1;
	
	__HAL_RCC_GPIOA_CLK_ENABLE();
	HAL_GPIO_Init(TPUART_TXPORT, &gpioInitStruct);
	
	
	/* Initialisation pin RX */
	gpioInitStruct.Pin = TPUART_RXPIN;
	gpioInitStruct.Mode = GPIO_MODE_AF_INPUT;
	gpioInitStruct.Pull = GPIO_PULLUP;
	gpioInitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
	//gpioInitStruct.Alternate = GPIO_AF7_USART1;
	
	__HAL_RCC_GPIOA_CLK_ENABLE();
	HAL_GPIO_Init(TPUART_RXPORT, &gpioInitStruct);
	
	/* Activation clock bloc UART */
	__HAL_RCC_USART1_CLK_ENABLE();
	
	
	/* Configuration des Interruptions */
	HAL_NVIC_SetPriority(USART1_IRQn, 0, 1);
	HAL_NVIC_EnableIRQ(USART1_IRQn);
}




uint8_t TPUART_CaesarChar(uint8_t character, uint8_t caesarKey){
	if(isupper((int)character)){
		return (((character - 0x41) + caesarKey) % 26) + 0x41;
	}
	else if(islower((int)character)){
		return (((character - 0x61) + caesarKey) % 26) + 0x61;
	}
	else {
		return character;
	}
}



void TPUART_CaesarString(uint8_t *inString, uint8_t *outString, uint16_t size, uint8_t caesarKey){
	uint32_t i;
	
	for(i=0; i<size; i++){
		outString[i] = TPUART_CaesarChar(inString[i], caesarKey);
	}
}
