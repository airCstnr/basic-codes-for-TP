/* Fichier: Utilisation des timers
 * Le 23/01/2018
 * @author Ivan ROGER <contact@ivan-roger.fr>
 */
// Attention: On à besoin du main.h

// Instance du timer (à mettre en global et dans le .h)
TIM_HandleTypeDef timer;

// Configuration de l'instance
timer.Instance = TIM2;
timer.Init.Prescaler = 6400;
timer.Init.Period = 10000;
timer.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
timer.Init.CounterMode = TIM_COUNTERMODE_UP;
timer.Init.RepetitionCounter = 0;

// Activation du timer
HAL_TIM_Base_Init(&timer);
HAL_TIM_Base_Start_IT(&timer);

// Callback du timer (là où on mets notre code)
void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim) {
	// Logique
}

// Configuration du handler (à rajouter dans stm32f1xx_it.c)
void TIM2_IRQHandler() {
	// On à besoin d'accèder à la variable globale d'instance (timer)
	// Il faut donc inclure le .h
	HAL_TIM_IRQHandler(&timer);
}
