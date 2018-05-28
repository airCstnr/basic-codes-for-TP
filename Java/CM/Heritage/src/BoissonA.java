
/**
 * Boisson alcoolisée
 */
public class BoissonA extends Produit {

	private double tauxAlcool;

	public BoissonA(String nom, double prixHT, double tauxAlcool) {
		super(nom, prixHT);
		this.tauxAlcool = tauxAlcool;
	}

}
