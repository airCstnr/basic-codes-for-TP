
/**
 * Point dans le plan
 */
public class Point {
	
	private String nom;
	private double abscisse, ordonnee;
	
	/**
	 * Initialise le point
	 * @param nom
	 * @param abscisse
	 * @param ordonnee
	 */
	public void initialise(String nom, double abscisse, double ordonnee) {
		this.nom = nom;
		this.abscisse = abscisse;
		this.ordonnee = ordonnee;
	}
	
	/**
	 * Affiche les informations du point
	 */
	public void affiche() {
		System.out.println(this.toString());
	}
	
	/**
	 * Effectue une translation du point d'une certaine valeur
	 * @param dx
	 * @param dy
	 */
	public void translate(double dx, double dy) {
		abscisse += dx;
		ordonnee += dy;
	}
	
	/**
	 * Effectue une rotation du point d'une certaine valeur
	 * @param theta
	 */
	public void roatate(double theta) {
		double x = abscisse;
		double y = ordonnee;
		abscisse = x*Math.cos(theta) + y*Math.sin(theta);
		ordonnee = -x*Math.sin(theta) + y*Math.cos(theta);
	}
	
	/**
	 * @return the abscisse
	 */
	public double getX() {
		return abscisse;
	}

	/**
	 * @return the ordonnee
	 */
	public double getY() {
		return ordonnee;
	}

	@Override
	public String toString() {
		return nom + " = (" + this.getX() + ", " + this.getY() + ")";
	}
}
