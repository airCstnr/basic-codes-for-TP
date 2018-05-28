/**
 * Boisson Non Alcoolisée
 */
public class BoissonNA extends Produit {

	private boolean petillant;
	
	public BoissonNA(String nom, double prixHT, boolean petillant) {
		super(nom, prixHT);
		this.petillant = petillant;
	}
	
	

}
