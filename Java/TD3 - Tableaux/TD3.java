// TODO : modifier la saisie
// 1. notes comprises entre 0 et 20
// 2. saisie propre à une fonction
// 3. coefficients strictement positifs


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
			
			// statistiques(espérance, min, max)
			statistiques(notes, coefs, nb_notes);

			
			// afficher la liste des notes non triée
			System.out.println("Liste avant le tri :");
			afficherListe(notes);
			
			// tri des notes
			triBulle(notes);
			
			// afficher la liste des notes
			System.out.println("Liste triée :");
			afficherListe(notes);
		}
	}
	
	
	/**
	 * Affiche une liste de valeurs
	 * @param liste
	 */
	public static void afficherListe(double[] liste) {
		for (double d : liste) {
			System.out.println(d);
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
