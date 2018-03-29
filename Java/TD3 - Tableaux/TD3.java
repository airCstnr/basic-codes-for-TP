import java.util.Scanner;

/**
 * TD 3 et 4 sur les tableaux et arraylist
 * @author rapha
 *
 */
public class TD3 {

	/**
	 * Fonction principale
	 */
	public static void main(String[] args) {
		
		System.out.println("### Main ###");
		
		exercice1();
		
		System.out.println("### Fin Main ###");

	}
	
	/**
	 * Ecrivez un programme qui commence par demander le nombre N de notes, et ensuite
		demande chacune des notes. Les notes seront stockées dans un tableau de taille N
		Ensuite, le programme demande le coefficient de chaque note et stocke aussi ces coefficients
		dans un tableau.
		Votre programme calcule ensuite la moyenne des notes en tenant compte des coefficients et
		affiche le résultat.
	 */
	public static void exercice1() {
		
		Scanner sc = new Scanner(System.in);
		
		// demande un nombre de notes
		System.out.print("Nombre de notes : ");
		int nb_notes = sc.nextInt(); 
		System.out.println();
				
		// tableau de taille N (notes)
		double notes[];
		
		// tableau de taille N (coefficients)
		double coefs[];
		
		double esperance = 0;
		
		if (nb_notes!=0) {
			
			// demande chacune des notes
			System.out.println("Saisir les " + nb_notes + " notes :");
			notes = demanderDoubles(nb_notes);
			
			// demande le coefficient de chaque note
			System.out.println("Saisir les " + nb_notes + " coefficients :");
			coefs = demanderDoubles(nb_notes);
			
			// calcule l'espérance
			esperance = esperance(notes, coefs, nb_notes);			

			// ajoute un espace pour faire joli
			System.out.println();
		}
		
		// affiche le résultat
		System.out.println("Esperance = " + esperance);
	}
	
	/**
	 * Demande à l'utilisateur n doubles
	 * @param n nombre de valeurs à saisir
	 * @return tableau de doubles
	 */
	public static double[] demanderDoubles(int n) {
		Scanner sc = new Scanner(System.in);
		double values[] = new double[n];
		for(int i=0; i<n; i++) {
			System.out.print("Valeur " + (i+1) + " : ");
			values[i] = sc.nextDouble();
		}
		return values;
	}
	
	/**
	 * Calcule l'esperance de x pondéré par p
	 * @param x valeurs
	 * @param p coefficients
	 * @param n nombre de valeurs
	 * @return espérance
	 */
	public static double esperance(double x[], double p[], int n) {
		double e=0;
		int nb=0;
		for (int i = 0; i < n; i++) {
			e += x[i]*p[i];
			nb+=p[i];
		}
		return e/nb;
	}

}
