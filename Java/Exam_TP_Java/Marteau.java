
public final class Marteau extends AppareilManuel {
	
	private int diametre;
	
	/**
	 * 
	 */
	public Marteau() {
	}

	
	/**
	 * @param numSerie
	 * @param libelle
	 * @param prix
	 * @param poids
	 * @param diametre
	 */
	public Marteau(String numSerie, String libelle, int prix, int poids, int diametre) {
		super(numSerie, libelle, prix, poids);
		this.diametre = diametre;
	}

	/**
	 * @return the diametre
	 */
	public int getDiametre() {
		return diametre;
	}

	/**
	 * @param diametre the diametre to set
	 */
	public void setDiametre(int diametre) {
		this.diametre = diametre;
	}
	
	@Override
	public String toString() {
		return super.toString() + "D=" + diametre + " mm";
	}

}
