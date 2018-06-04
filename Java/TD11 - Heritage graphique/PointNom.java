
public class PointNom extends Point {

	private String nom;
	
	public PointNom(int x, int y, String nom) {
		super(x, y);
		this.nom = nom;
	}
	
	public void affiche() {
		super.affiche();
		System.out.println(" nom=" + nom);
	}

}
