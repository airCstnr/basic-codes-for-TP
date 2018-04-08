
/**
 * Point dans le plan
 */
public class Point {
	
	private String nom;
	//private double abscisse, ordonnee;
	private double rayon, theta;
	
	/**
	 * Initialise le point
	 * @param nom
	 * @param abscisse
	 * @param ordonnee
	 */
//	public void initialise(String nom, double abscisse, double ordonnee) {
//		this.nom = nom;
//		this.abscisse = abscisse;
//		this.ordonnee = ordonnee;
//	}
	public void initialise(String nom, double rayon, double theta) {
		this.nom = nom;
		this.rayon = rayon;
		this.theta = theta;
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
//		abscisse += dx;
//		ordonnee += dy;
		double new_x = this.getX() + dx;
		double new_y = this.getY() + dy;
		this.rayon = Math.sqrt(new_x*new_x+new_y*new_y);
		this.theta = Math.tan(new_y / new_x);
	}
	
	/**
	 * Effectue une rotation du point d'une certaine valeur
	 * @param theta
	 */
	public void roatate(double theta) {
		this.theta += theta;
//		double x = abscisse;
//		double y = ordonnee;
//		abscisse = x*Math.cos(theta) + y*Math.sin(theta);
//		ordonnee = -x*Math.sin(theta) + y*Math.cos(theta);
	}
	
	/**
	 * @return the abscisse
	 */
	public double getX() {
//		return abscisse;
		return this.rayon * Math.cos(this.theta);
	}

	/**
	 * @return the ordonnee
	 */
	public double getY() {
//		return ordonnee;
		return this.rayon * Math.sin(this.theta);
	}

	@Override
	public String toString() {
		return nom + " = (" + this.getX() + ", " + this.getY() + ")";
	}
}
