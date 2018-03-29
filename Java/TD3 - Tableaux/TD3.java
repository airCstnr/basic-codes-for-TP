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
		//exercice2(); // exercice 1 modifié
		
		System.out.println("### Fin Main ###");

	}

	/**
	 * Exercice 1
	 */
	public static void exercice1() {
		
		Scanner sc = new Scanner(System.in);
		
		// demande un nombre de notes
		System.out.print("Nombre de notes : ");
		int nb_notes = sc.nextInt(); 
		System.out.println();
				
		// tableau de taille N (notes et coefficients)
		double notes[] = new double[nb_notes];
		double coefs[] = new double[nb_notes];

		if (nb_notes!=0) {
			
			// demande chacune des notes
			System.out.println("Saisir les " + nb_notes + " notes :");
			for(int i=0; i<nb_notes; i++) {
				double d = -1;
				while(d>20 || d<0) {
					System.out.print("Valeur " + (i+1) + " : ");
					d = sc.nextDouble();
				}
				notes[i] = d;
			}
			
			// demande le coefficient de chaque note
			System.out.println("Saisir les " + nb_notes + " coefficients :");
			for(int i=0; i<nb_notes; i++) {
				double d = -1;
				while(d<0) {
					System.out.print("Valeur " + (i+1) + " : ");
					d = sc.nextDouble();
				}
				coefs[i] = d;
			}
			
			// statistiques(espérance, min, max)
			statistiques(notes, coefs, nb_notes);

			
			// afficher la liste des notes non triée
			System.out.println("Liste avant le tri :");
			for (double d : notes) {
				System.out.println(d);
			}
			
			// tri des notes
			triBulle(notes);
			
			// afficher la liste des notes
			System.out.println("Liste triée :");
			for (double d : notes) {
				System.out.println(d);
			}
		}
	}

	/**
	 * Trie les valeurs à l'aide d'un tri à bulle
	 * @param val valeurs à trier
	 * @return valeurs triées par ordre croissant 
	 */
	public static double[] triBulle(double[] val) {
		boolean trie=false;
		while(!trie) {
			// on considère la liste triée
			trie=true;
			for (int i = 0; i < val.length-1; i++) {
				// si l'élément à gauche est plus grand que l'élément à droite, les échanger
				if(val[i]>val[i+1]) {
					trie=false; // la liste n'est pas triée
					double tmp=val[i];
					val[i] = val[i+1];
					val[i+1] = tmp;
				}
			}
		}
		return val;
	}

	/**
	 * Statiques concernant la plage de valeurs et les coefficients, pour n valeurs
	 * @param x valeurs
	 * @param p coefficients
	 * @param n nombre de valeurs
	 */
	public static void statistiques(double x[], double p[], int n) {

		// calcule l'espérance
		System.out.println("Esperance = " + esperance(x, p, n));
		
		// note max et min
		double max=0, min=20;
		for (int i = 0; i < n; i++) {
			if(x[i]>max) {max=x[i];}
			if(x[i]<min) {min=x[i];}
		}
		System.out.println("Max = " + max);
		System.out.println("Min = " + min);
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
