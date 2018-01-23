
// Utilisation des LED et Potards

// LED1
__HAL_RCC_GPIOB_CLK_ENABLE();
GPIO_InitStruct.Mode  = GPIO_MODE_OUTPUT_PP;
GPIO_InitStruct.Pull  = GPIO_PULLUP;
GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
GPIO_InitStruct.Pin   = GPIO_PIN_15;
HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

// LED2
GPIO_InitStruct.Mode  = GPIO_MODE_OUTPUT_PP;
GPIO_InitStruct.Pull  = GPIO_PULLUP;
GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
GPIO_InitStruct.Pin   = GPIO_PIN_14;
HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

// POT1
__HAL_RCC_GPIOA_CLK_ENABLE();
GPIO_InitStruct.Mode  = GPIO_MODE_ANALOG;
GPIO_InitStruct.Pull  = GPIO_NOPULL;
GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
GPIO_InitStruct.Pin   = GPIO_PIN_0;
HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

// POT2
GPIO_InitStruct.Mode  = GPIO_MODE_ANALOG;
GPIO_InitStruct.Pull  = GPIO_NOPULL;
GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
GPIO_InitStruct.Pin   = GPIO_PIN_1;
HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
