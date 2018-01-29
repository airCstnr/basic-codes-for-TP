// J'ai pas tout fait, si vous avez des problèmes, allez sur internet sur des sites genre
// timer : https://visualgdb.com/tutorials/arm/stm32/timers/hal/
// adc : https://visualgdb.com/tutorials/arm/stm32/adc/hal/
// Il explique pas mal comment faire fonctionner ces périphériques, vous devriez pouvoir y trouver
// 																						le reste


// Test de l'affichage

GPIO_InitTypeDef GPIO_Config;

int main(void)
{
	__HAL_RCC_AFIO_CLK_ENABLE();	//cas part PB4 (JTRST a la mise sous tension)
	__HAL_AFIO_REMAP_SWJ_NONJTRST();

	Init_GPIO(&GPIO_Config);
	
	for(;;);
}

void Init_GPIO(GPIO_InitTypeDef *GPIO)
{
	__HAL_RCC_GPIOA_CLK_ENABLE();
	__HAL_RCC_GPIOB_CLK_ENABLE();
	__HAL_RCC_GPIOC_CLK_ENABLE();

	// Leds Shield (Pins 8 et 9) & segments de l'afficheur sur PORTB
	GPIO->Mode = GPIO_MODE_OUTPUT_PP;
	GPIO->Pin = GPIO_PIN_8 | GPIO_PIN_9 | GPIO_PIN_5 | GPIO_PIN_4 | GPIO_PIN_10;
	GPIO->Pull = GPIO_PULLUP;
	GPIO->Speed = GPIO_SPEED_FREQ_LOW;
	HAL_GPIO_Init(GPIOB,&GPIO);

	// Segments de l'afficheur sur PORTA
	GPIO->Pin = GPIO_PIN_5 | GPIO_PIN_6 | GPIO_PIN_4 | GPIO_PIN_8 | GPIO_PIN_10;
	HAL_GPIO_Init(GPIOA,&GPIO);

	// Segments de l'afficheur sur PORTC
	GPIO->Pin = GPIO_PIN_1 | GPIO_PIN_0;
	HAL_GPIO_Init(GPIOC,&GPIO);
}

void Allumage_des_segments(int count, GPIO_InitTypeDef *GPIO)
{
	switch (count)
	{
		case 0:
		GPIO->Pin = GPIO_PIN_10 | GPIO_PIN_4;
		HAL_GPIO_Init(GPIOA,GPIO);
		break;

		case 1:
		GPIO->Pin = GPIO_PIN_5 | GPIO_PIN_8 | GPIO_PIN_10;
		HAL_GPIO_Init(GPIOA,GPIO);				// Il faut se baser sur le schéma des segments
		GPIO->Pin = GPIO_PIN_5;
		HAL_GPIO_Init(GPIOB,GPIO);									//			_ a
		GPIO->Pin = GPIO_PIN_0;										//		 f |_| b (g au milieu)
		HAL_GPIO_Init(GPIOC,GPIO);									//		e  |_| c
		break;														//			d		.

		// A priori d'après le sujet les segments s'allument à l'état bas, c'est-à-dire qu'il faut
		// mettre à 1 ceux qui doivent être éteints.
		// Je vous laisse la liste, à vous de vous amuser (Attention, il y en a sur différents ports GPIO)
		// a | D13 | PA5
		// b | D12 | PA6
		// c | A4 | PC1
		// d | A5 | PC0
		// le petit point | A2 | PA4
		// e | D4 | PB5
		// f | D7 | PA8
		// g | D2 | PA10
		// c_aff_u | D6 | PB10		A priori ces deux derniers définissent sur quel afficheur
		// c_aff_d | D5 | PB4		on envoie les données mais je suis pas sûr
		case 2:						// Je vous laisse compléter le reste car je suis un flemmard
									// et que j'avance à la vitesse d'un escargot	
		//PORT_7_SEGMENT=0b00011001;
		break;

		case 3:
		//PORT_7_SEGMENT=0b00011100;
		break;

		case 4:
		//PORT_7_SEGMENT=0b00101110;
		break;

		case 5:
		//PORT_7_SEGMENT=0b01001100;
		break;

		case 6:
		//PORT_7_SEGMENT=0b01001000;
		break;

		case 7:
		//PORT_7_SEGMENT=0b10111100;
		break;

		case 8:
		//PORT_7_SEGMENT=0b00001000;
		break;

		case 9:
		//PORT_7_SEGMENT=0b00001100;
		break;

		case 10:
		//PORT_7_SEGMENT=0b00101000;  //A
		break;

		case 11:
		//PORT_7_SEGMENT=0b01001010;  //b
		break;

		case 12:
		//PORT_7_SEGMENT=0b11001001;  //C
		break;

		case 13:
		//PORT_7_SEGMENT=0b00011010;  //d
		break;

		case 14:
		//PORT_7_SEGMENT=0b01001001;  //E
		break;

		case 15:
		//PORT_7_SEGMENT=0b01101001;  //F
		break;
	}
	/*if(dp)
	{
		//if decimal point should be displayed make DP bit Low
		//PORT_7_SEGMENT&=0b11110111;
	}*/
}


int Decode_quartet(char input)
{
	int resul=-1;
	switch(input)
	{
	case "0000":
		resul=0;
		break;
	case "0001":
		resul=1;
		break;
	case "0010":
		resul=2;
		break;
	case "0011":
		resul=3;
		break;
	case "0100":
		resul=4;
		break;
	case "0101":
		resul=5;
		break;
	case "0110":
		resul=6;
		break;
	case "0111":
		resul=7;
		break;
	case "1000":
		resul=8;
		break;
	case "1001":
		resul=9;
		break;
	case "1010":
		resul=10;
		break;
	case "1011":
		resul=11;
		break;
	case "1100":
		resul=12;
		break;
	case "1101":
		resul=13;
		break;
	case "1110":
		resul=14;
		break;
	case "1111":
		resul=15;
		break;
	}
	return resul;
}

