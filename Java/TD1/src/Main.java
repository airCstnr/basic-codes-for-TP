import java.util.Scanner;

public class Main {

	/**
	 * Point d'entrée du programme.
	 * Appelle les méthodes de chque exercice.
	 * @param args
	 */
	public static void main(String[] args) {
		
		System.out.println("### Main ###");
		
		//exercice5();
		exercice6();
		
		System.out.println("### Fin Main ###");

	}
	
	/**
	 * Exercice 5 : Affiche un triangle isocèle formé d'étoiles.
	 */
	public static void exercice5() {
		System.out.println("--- Exercice 5 ---");
		
		// demande le nombre de lignes du triangle
		System.out.println("Nombre de lignes : ");
		Scanner sc = new Scanner(System.in);
		int nb_lignes = sc.nextInt();
		
		// affiche le triangle avec le nombre de lignes demandées
		afficherTriangle(nb_lignes);

		sc.close();
	}
	
	/**
	 * Affiche un triangle de nb lignes
	 * @param nb nombre de lignes
	 */
	public static void afficherTriangle(int nb) {
		// initialisation des variables
		int nb_etoiles = 1;
		int nb_espaces = nb -1;
		
		// début de la boucle : on va faire nb lignes
		for(int i=0; i<nb; i++) {
			// on affiche les espaces
			for(int spaces = 0; spaces<nb_espaces; spaces++) {
				System.out.print(" ");
			}
			// on affiche les étoiles
			for(int stars = 0; stars<nb_etoiles; stars++) {
				System.out.print("*");
			}
			// on termine la ligne par un retour à la ligne
			System.out.println();
			// on met à jour les variables pour la prochaine ligne
			nb_espaces--;
			nb_etoiles+=2;
		}	
	}
	
	/**
	 * Exercice 6 : Affiche toutes les combinaisons possibles de pièces de 2, 5 et 10 centimes pour faire 1€
	 */
	public static void exercice6() {
		System.out.println("--- Exercice 6 ---");
		afficherCombinaisons();
	}
	
	/**
	 * Affiche les combinaisons possibles de pièces de 2, 5 et 10 centimes pour faire 1€
	 */
	public static void afficherCombinaisons() {
		System.out.println("Combinaisons...");
	}

}
