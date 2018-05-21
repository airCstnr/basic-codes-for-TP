
public class Main {

	public static void main(String[] args) {
		System.out.println("\t--- TD5 ---\n");
//		testPoint();
//		testSegment();
//		testSegment2();
//		testChrono1();
		testChronoGUI();
		System.out.println("\t--- Fin TD5 ---");
	}
	
	/**
	 * Effectue des tests de la classe Point
	 */
	public static void testPoint() {
		System.out.println("\ttestPoint");
		Point p = new Point();
		p.affiche();
		p.initialise("P", 3, 5);
		p.affiche();
		p.translate(-2, 3);
		p.affiche();
		p.translate(6, 1);
		p.affiche();
		p.initialise("P2", -5.2, -3);
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
	
	/**
	 * Effectue des tests de la classe Segment
	 */
	public static void testSegment2() {
		System.out.println("\ttestSegment2");
		Segment2 s = new Segment2();
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
		
		Point point1 = new Point();
		Point point2 = new Point();
		point1.initialise("Hello", 1, 2);
		point2.initialise("There", 3, 4);
		s.initialise(point1, point2);
		s.affiche();
		System.out.println();
	}

	
	public static void testChrono1() {
		System.out.println("\ttestChrono1");
		Chrono1 c = new Chrono1();
		System.out.println("C1 = " + c.toString());
		
		// exception
		try {
			Chrono1 ex = new Chrono1(0, 0, -1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		c.init(0, 0, 10);
		while(c.rebours()) {
			System.out.println(c.toString());
			try
			{
				Thread.sleep(1000);
			}
			catch (InterruptedException e)
			{
				e.printStackTrace();
			}
		}
		System.out.println("BONNE ANNEE!!");
		System.out.println();
	}
	
	public static void testChronoGUI() {
		System.out.println("\ttestChronoGUI");
		ChronoGUI gui = new ChronoGUI();
		System.out.println();
	}
}
