
/**
 * Segment du plan
 */
public class Segment2 {
	
	private Point p1, p2;
	
	public Segment2() {
		this.initialise(0,0,0,0);
	}
	
	public void initialise(Point p1, Point p2) {
		this.p1 = p1;
		this.p2 = p2;
	}
	
	public void initialise(double x1, double x2, double y1, double y2) {
		this.p1 = new Point();
		this.p2 = new Point();
		p1.initialise("p1", x1, y1);
		p2.initialise("p2", x2, y2);
	}

	/**
	 * Longueur du segement
	 * Note : le carré de l'hypoténuse est égale à la somme des carrés des 2 autres cotés
	 * @return longueur
	 */
	public double longueur() {
		return Math.sqrt(Math.pow((p2.getX()-p1.getX()), 2) + Math.pow((p2.getY()-p1.getY()), 2));
		/* Note : ici on préfère utiliser les appels aux fonctions, quitte à faire getX et getY */
	}
	
	/**
	 * Translate l'origine du segment
	 * @param dx
	 * @param dy
	 */
	public void translateOrigine(double dx, double dy) {
		this.p1.translate(dx, dy);
	}
	
	/**
	 * Translate l'extrémité du segment
	 * @param dx
	 * @param dy
	 */
	public void translateExtremite(double dx, double dy) {
		this.p2.translate(dx, dy);
	}
	
	/**
	 * Affiche les informations du segment
	 */
	public void affiche() {
		System.out.println(this.toString());
	}

	@Override
	public String toString() {
		return "Segment : " + p1.toString() + ", " + p2.toString() + ", l=" + longueur();
	}
	
	
}
