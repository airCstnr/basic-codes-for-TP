/* Fichier: Utilisation des GPIO
 * Le 23/01/2018
 * @author Raphaël CASTANIER <raphael.castanier@etu.esisar.grenoble-inp.fr>
 */
// TP CAN

// Déclaration du handler, à faire AVANT le main
ADC_HandleTypeDef global_ADC_handler;

// Initialisation du handler, à faire DANS le main
global_ADC_handler.Instance = ADC1;
global_ADC_handler.Init.DataAlign = ADC_DATAALIGN_RIGHT;
global_ADC_handler.Init.ScanConvMode = ADC_SCAN_DISABLE;
global_ADC_handler.Init.ContinuousConvMode = ENABLE;
global_ADC_handler.Init.ExternalTrigConv = ADC_SOFTWARE_START;
global_ADC_handler.Init.DiscontinuousConvMode = DISABLE;

// Initialisation de l'ADC, avec le handler
HAL_ADC_Init( &global_ADC_handler );

// Déclaration et initialisation du channel
ADC_ChannelConfTypeDef notre_ADC_channel;
notre_ADC_channel.Channel = ADC_CHANNEL_0 ;
notre_ADC_channel.Rank = ADC_REGULAR_RANK_1;
notre_ADC_channel.SamplingTime = ADC_SAMPLETIME_41CYCLES_5;

// Configuration du channel avec le handler
HAL_ADC_ConfigChannel( &global_ADC_handler, &notre_ADC_channel);

// Démarrage du CAN
HAL_ADC_Start(&global_ADC_handler);


while(1)
{
    HAL_ADC_PollForConversion( &global_ADC_handler, 1000 );
    uint32_t valeur_convertie = HAL_ADC_GetValue( &global_ADC_handler );
    HAL_Delay(100);
  
    #define POTARD_2V 2481
    #define POTARD_1_5V 1861
		#define POTARD_1V 1240

		// Niveaux sur la LED Orange
		if (valeur_convertie >= POTARD_1V && valeur_convertie <= POTARD_2V)
		{
			HAL_GPIO_WritePin(GPIOB, GPIO_PIN_9, GPIO_PIN_SET );
		}
		else
		{
			HAL_GPIO_WritePin(GPIOB, GPIO_PIN_9, GPIO_PIN_RESET );
		}

		// Hystérésis sur la LED Rouge
		if( valeur_convertie > POTARD_2V)
		{
			HAL_GPIO_WritePin(GPIOB, GPIO_PIN_8, GPIO_PIN_SET );
		}
		if ( valeur_convertie < POTARD_1_5V)
		{
			HAL_GPIO_WritePin(GPIOB, GPIO_PIN_8, GPIO_PIN_RESET );
		}
}
    
// Valeurs constatées
// max 4095 3.3
// tout a gauche 4034 3.3
// 2v 2481
// 1v 1240
// tout a droite 0

    
