
public class Point {
	
	private String nom;
	private double abscisse;
	
	public void initialise(String nom, double abscisse) {
		this.nom = nom;
		this.abscisse = abscisse;
	}
	
	public void affiche() {
		System.out.println(nom + " = " + abscisse);
	}
	
	public void translate(double valeur) {
		abscisse += valeur;
	}
}
