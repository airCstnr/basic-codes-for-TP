
public class Main {

	public static void main(String[] args) {
		System.out.println("\t--- TD5 ---\n");
		testPoint();
		testSegment();
		System.out.println("\t--- Fin TD5 ---");
	}
	
	/**
	 * Effectue des tests de la classe Point
	 */
	public static void testPoint() {
		System.out.println("\ttestPoint");
		Point p = new Point();
		p.affiche();
		p.initialise("Blabla", 3, 5);
		p.affiche();
		p.translate(-2, 3);
		p.affiche();
		p.translate(6, 1);
		p.affiche();
		p.initialise("La minute de JP", -5.2, -3);
		p.affiche();
		p.roatate(Math.PI / 4); // rotation de 45 degrés
		p.affiche();
		p.initialise("Roatation", 1, 1);
		p.affiche();
		p.roatate(Math.PI / 4); // rotation de 45 degrés
		p.affiche();
		System.out.println();
	}
	
	/**
	 * Effectue des tests de la classe Segment
	 */
	public static void testSegment() {
		System.out.println("\ttestSegment");
		Segment s = new Segment();
		s.affiche();
		s.initialise(0, 0, 0, 1);
		s.affiche();
		s.initialise(3, 5, 2, 1);
		s.affiche();
		System.out.println("Longueur = " + s.longueur());
		s.translateOrigine(-3, -5);
		s.affiche();
		s.translateExtremite(5, 9);
		s.affiche();
		System.out.println();
	}

}
