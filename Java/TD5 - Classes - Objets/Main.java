
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
	}

}
