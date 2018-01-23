/* Fichier: Contenu du main
 * Le 23/01/2018
 * @author Raphaël CASTANIER <raphael.castanier@etu.eisar.grenoble-inp.fr>
 * @author Ivan ROGER <contact@ivan-roger.fr>
 */

int main(void) {
	// Définition des variables

	// Initialisation générale
	HAL_Init();
	SystemClock_Config();

	// Boucle du programme
	for(;;) {
		// Logique ...
		HAL_Delay(100);
	}
}
