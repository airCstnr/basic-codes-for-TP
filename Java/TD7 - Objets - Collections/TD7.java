/**
 * TD7 - Objets et Colections
 */
public class TD7 {

	public static void main(String[] args) {
		System.out.println("\t--- TD7 ---\n");
		testIndvidu();
		testAnnuaire();
		System.out.println("\t--- Fin TD7 ---");
	}
	
	public static void testIndvidu() {
		System.out.println("\tTest Individu");
		Individu individu = new Individu("Dupont","Jean","0688888888");
		System.out.println("Cet individu est "+individu);
		System.out.println();
	}
	
	public static void testAnnuaire() {
		System.out.println("\tTest Annuaire");
		Annuaire annuaire = new Annuaire();
		Individu individu1 = new Individu("Dupont","Jean","0688888888");
		Individu individu2 = new Individu("Mouchet","Alexandre", "Valence","06543217");
		Individu individu3 = new Individu("Zidane","Zinédine", "Marseille", "0612457896");
		annuaire.addIndividu(individu1);
		annuaire.addIndividu(individu2);
		annuaire.addIndividu(individu3);
		annuaire.displayAllIndividus();
		annuaire.addIndividu("Roger", "Ivan", "30 rue Hubert Robert", "0612345678");
		annuaire.addIndividu("Castanier", "Raphaël", "7 rue de la scierie", "06987654321");
		annuaire.displayAllIndividus();
		System.out.println("Nombre d'individus : " + annuaire.getNbIndividus());
		
		annuaire.sortByName();
		annuaire.displayAllIndividus();
		
		annuaire.sortByTelNumber();
		annuaire.displayAllIndividus();
	}

}
