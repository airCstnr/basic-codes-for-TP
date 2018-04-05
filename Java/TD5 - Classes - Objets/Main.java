
public class Main {

	public static void main(String[] args) {
		System.out.println("--- TD5 - Point ---");
		testPoint();
	}
	
	/**
	 * Effectue des tests de la classe Point
	 */
	public static void testPoint() {
		Point p = new Point();
		p.affiche();
		p.initialise("Blabla", 3);
		p.affiche();
		p.translate(-2);
		p.affiche();
		p.translate(6);
		p.affiche();
		p.initialise("La minute de JP", -5.2);
		p.affiche();
	}

}
