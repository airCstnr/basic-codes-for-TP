
public abstract class Produit {
	
	private String nom;
	private double prixHT;

	/**
	 * @param nom
	 * @param prixHT
	 */
	public Produit(String nom, double prixHT) {
		this.nom = nom;
		this.prixHT = prixHT;
	}

	@Override
	public String toString() {
		return nom;
	}
}
