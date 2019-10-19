
public final class ScieCirculaire extends AppareilElectrique {
	
	
	private int diametre;

	public ScieCirculaire() {
	}

	/**
	 * @param numSerie
	 * @param libelle
	 * @param prix
	 * @param puissance
	 * @param diametre
	 */
	public ScieCirculaire(String numSerie, String libelle, int prix, int puissance, int diametre) {
		super(numSerie, libelle, prix, puissance);
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
