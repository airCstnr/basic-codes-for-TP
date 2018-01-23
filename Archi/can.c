/* Fichier: Utilisation des interruption sur les GPIO
 * Le 23/01/2018
 * @author Ivan ROGER <contact@ivan-roger.fr>
 */

// Variable globale d'instance
ADC_HandleTypeDef ADC;

// Configuration
ADC.Instance = ADC1;
ADC.Init.DataAlign = ADC_DATAALIGN_RIGHT;
ADC.Init.ScanConvMode = ADC_SCAN_DISABLE;
ADC.Init.ContinuousConvMode = ENABLE;
ADC.Init.DiscontinuousConvMode = DISABLE;
ADC.Init.ExternalTrigConv = ADC_SOFTWARE_START;
ADC.Init.NbrOfConversion = 1;
ADC.Init.NbrOfDiscConversion = 1;

// Initialisation
HAL_ADC_Init(&ADC);

// Configuration du channel
ADC_ChannelConfTypeDef ADC_ChannelConf;
ADC_ChannelConf.Channel = ADC_CHANNEL_0;
ADC_ChannelConf.Rank = ADC_REGULAR_RANK_1;
ADC_ChannelConf.SamplingTime = ADC_SAMPLETIME_41CYCLES_5;
HAL_ADC_ConfigChannel(&ADC, &ADC_ChannelConf);
HAL_ADC_Start(&ADC);

// Lecture d'une valeur
HAL_ADC_PollForConversion(&ADC, 1000);
uint32_t POT1 = HAL_ADC_GetValue(&ADC);
