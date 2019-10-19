
public abstract class AppareilElectrique extends Appareil {
	
	private int puissance;

	
	/**
	 * 
	 */
	public AppareilElectrique() {
	}

	/**
	 * @param numSerie
	 * @param libelle
	 * @param prix
	 * @param puissance
	 */
	public AppareilElectrique(String numSerie, String libelle, int prix, int puissance) {
		super(numSerie, libelle, prix);
		this.puissance = puissance;
	}

	/**
	 * @return the puissance
	 */
	public int getPuissance() {
		return puissance;
	}

	/**
	 * @param puissance the puissance to set
	 */
	public void setPuissance(int puissance) {
		this.puissance = puissance;
	}

	@Override
	public String toString() {
		return super.toString() + "P=" + puissance + " W\t";
	}
}
