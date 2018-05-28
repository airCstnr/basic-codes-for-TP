
public class Snack extends Produit {

	private double poids;
	
	public Snack(String nom, double prixHT, double poids) {
		super(nom, prixHT);
		this.poids = poids;
	}

}
