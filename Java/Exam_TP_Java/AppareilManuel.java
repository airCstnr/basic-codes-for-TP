
public abstract class AppareilManuel extends Appareil {
	
	private int poids;

	/**
	 * 
	 */
	public AppareilManuel() {
	}

	/**
	 * @param numSerie
	 * @param libelle
	 * @param prix
	 * @param poids
	 */
	public AppareilManuel(String numSerie, String libelle, int prix, int poids) {
		super(numSerie, libelle, prix);
		this.poids = poids;
	}

	/**
	 * @return the poids
	 */
	public int getPoids() {
		return poids;
	}

	/**
	 * @param poids the poids to set
	 */
	public void setPoids(int poids) {
		this.poids = poids;
	}
	
	@Override
	public String toString() {
		return super.toString() + "Poids=" + poids + " kg\t";
	}

}
