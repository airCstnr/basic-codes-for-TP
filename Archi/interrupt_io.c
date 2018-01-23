/* Fichier: Utilisation des interruption sur les GPIO
 * Le 23/01/2018
 * @author Ivan ROGER <contact@ivan-roger.fr>
 */

// Activation des interruptions
HAL_NVIC_SetPriority(EXTI15_10_IRQn, 1, 0);
HAL_NVIC_EnableIRQ(EXTI15_10_IRQn);

// Chargement du handler
void EXTI15_10_IRQHandler() {
	// GPIO_PIN_13: Pin sur lequel l'interruption à lieu
	HAL_GPIO_EXTI_IRQHandler(GPIO_PIN_13);
}

// Callback (là où on execute le code)
void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin) {
	// Logique
}
