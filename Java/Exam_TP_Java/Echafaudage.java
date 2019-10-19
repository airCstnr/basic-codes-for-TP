
public final class Echafaudage extends AppareilManuel {
	
	private int hauteur;
	
	/**
	 * 
	 */
	public Echafaudage() {
	}

	/**
	 * @param numSerie
	 * @param libelle
	 * @param prix
	 * @param poids
	 * @param hauteur
	 */
	public Echafaudage(String numSerie, String libelle, int prix, int poids, int hauteur) {
		super(numSerie, libelle, prix, poids);
		this.hauteur = hauteur;
	}

	/**
	 * @return the hauteur
	 */
	public int getHauteur() {
		return hauteur;
	}

	/**
	 * @param hauteur the hauteur to set
	 */
	public void setHauteur(int hauteur) {
		this.hauteur = hauteur;
	}
	
	@Override
	public String toString() {
		return super.toString() + "H=" + hauteur + " m";
	}

}
