
/**
 * Classe main de test
 *
 */
public class Test {

	public static void main(String[] args) {
		System.out.println("Exam TP Raphael Castanier");
		
		Ponceuse p1 = new Ponceuse("abcdefghij", "Bosch Pro", 40, 123, 456, 789);
		Ponceuse p2 = new Ponceuse("1234567890", "Amateur", 20, 123, 456, 789);
		Marteau m1  = new Marteau ("azertyuiop", "Super Marteau", 3, 12, 45);
		Echafaudage e1 = new Echafaudage("qsdfghjklp", "Glissant", 30, 45, 7989);
		Echafaudage e2 = new Echafaudage("wxcvbnertg", "Pro", 50, 45, 7989);
		
		LocationManager lm = new LocationManager();
		lm.addAppareil(p1);
		lm.addAppareil(p2);
		lm.addAppareil(m1);
		lm.addAppareil(e1);
		lm.addAppareil(e2);
		
		System.out.println(lm.getNbPrixDifferents());
		lm.displayAppareils();
		
		System.out.println(lm.getPlusCherParCategorie());
	}

}
