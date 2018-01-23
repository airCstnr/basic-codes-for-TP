/* Fichier: Utilisation des GPIO
 * Le 23/01/2018
 * @author Raphaël CASTANIER <raphael.castanier@etu.esisar.grenoble-inp.fr>
 * @author Ivan ROGER <contact@ivan-roger.fr>
 */

// Utilisation des LEDs, Boutons et Potentiomètres
// Attention: penser à renommer les structures (GPIO_InitStruct)

// LED1 Carte (Verte)
LED2_GPIO_CLK_ENABLE();
GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
GPIO_InitStruct.Pull = GPIO_PULLUP;
GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
GPIO_InitStruct.Pin = GPIO_PIN_5;
HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

// BTN1 Bouton carte (Bleu)
__HAL_RCC_GPIOC_CLK_ENABLE();
GPIO_InitStruct.Mode = GPIO_MODE_IT_FALLING;
GPIO_InitStruct.Pull = GPIO_PULLUP;
GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
GPIO_InitStruct.Pin = GPIO_PIN_13;
HAL_GPIO_Init(GPIOC, &GPIO_InitStruct);

// LED1 Shield (Rouge)
__HAL_RCC_GPIOB_CLK_ENABLE();
GPIO_InitStruct.Mode  = GPIO_MODE_OUTPUT_PP;
GPIO_InitStruct.Pull  = GPIO_PULLUP;
GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
GPIO_InitStruct.Pin   = GPIO_PIN_8;
HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

// LED2 Shield (Orange)
GPIO_InitStruct.Mode  = GPIO_MODE_OUTPUT_PP;
GPIO_InitStruct.Pull  = GPIO_PULLUP;
GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
GPIO_InitStruct.Pin   = GPIO_PIN_9;
HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

// POT1 Shield
__HAL_RCC_GPIOA_CLK_ENABLE();
GPIO_InitStruct.Mode  = GPIO_MODE_ANALOG;
GPIO_InitStruct.Pull  = GPIO_NOPULL;
GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
GPIO_InitStruct.Pin   = GPIO_PIN_0;
HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

// POT2 Shield
GPIO_InitStruct.Mode  = GPIO_MODE_ANALOG;
GPIO_InitStruct.Pull  = GPIO_NOPULL;
GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
GPIO_InitStruct.Pin   = GPIO_PIN_1;
HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
