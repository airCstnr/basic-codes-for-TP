/* Fichier: Utilisation de l'UART
 * Le 23/01/2018
 * @author Ivan ROGER <contact@ivan-roger.fr>
 */

// Reference vers l'instance UART
UART_HandleTypeDef uart;

// Configuration initiale
UART_InitTypeDef uart_init;
uart_init.BaudRate = 9600;
uart_init.Parity = UART_PARITY_NONE;
uart_init.WordLength = UART_WORDLENGTH_8B;
uart_init.StopBits = UART_STOPBITS_1;
uart_init.HwFlowCtl = UART_HWCONTROL_NONE;
uart_init.Mode = UART_MODE_TX_RX;
uart.Instance = USART2;
uart.Init = uart_init;
HAL_UART_Init(&uart);

// Envoi d'une chaîne de caractères
char str[] = "HELLO!\r\n";
HAL_UART_Transmit(&uart, str, sizeof(char)*strlen(str), 1000);

// Récéption d'un caractère
char data[1];
HAL_UART_Receive(&uart, data, sizeof(char), 1000);
