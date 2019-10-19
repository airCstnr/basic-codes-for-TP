
public final class Ponceuse extends AppareilElectrique {
	
	/**
	 * 
	 */
	public Ponceuse() {
	}

	private int largeur;
	private int longueur;
	
	/**
	 * @param numSerie
	 * @param libelle
	 * @param prix
	 * @param puissance
	 * @param largeur
	 * @param longueur
	 */
	public Ponceuse(String numSerie, String libelle, int prix, int puissance, int largeur, int longueur) {
		super(numSerie, libelle, prix, puissance);
		this.largeur = largeur;
		this.longueur = longueur;
	}

	/**
	 * @return the largeur
	 */
	public int getLargeur() {
		return largeur;
	}

	/**
	 * @param largeur the largeur to set
	 */
	public void setLargeur(int largeur) {
		this.largeur = largeur;
	}

	/**
	 * @return the longueur
	 */
	public int getLongueur() {
		return longueur;
	}

	/**
	 * @param longueur the longueur to set
	 */
	public void setLongueur(int longueur) {
		this.longueur = longueur;
	}
	
	@Override
	public String toString() {
		return super.toString() + "L=" + longueur + " mm, l=" + largeur + " mm";
	}

}
