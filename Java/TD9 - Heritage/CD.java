
public class CD extends Item {

	private String chanteur;
	private String compositeur;
	private int nbChansons;
	
	/**
	 * @param tag
	 * @param titre
	 * @param dateAchat
	 * @param prixAchat
	 * @param etat
	 * @param chanteur
	 * @param compositeur
	 * @param nbChansons
	 */
	public CD(String tag, String titre, String dateAchat, double prixAchat, Status etat, String chanteur,
			String compositeur, int nbChansons) {
		super(tag, titre, dateAchat, prixAchat, etat);
		this.chanteur = chanteur;
		this.compositeur = compositeur;
		this.nbChansons = nbChansons;
	}

	/**
	 * @return the chanteur
	 */
	public String getChanteur() {
		return chanteur;
	}

	/**
	 * @param chanteur the chanteur to set
	 */
	public void setChanteur(String chanteur) {
		this.chanteur = chanteur;
	}

	/**
	 * @return the compositeur
	 */
	public String getCompositeur() {
		return compositeur;
	}

	/**
	 * @param compositeur the compositeur to set
	 */
	public void setCompositeur(String compositeur) {
		this.compositeur = compositeur;
	}

	/**
	 * @return the nbChansons
	 */
	public int getNbChansons() {
		return nbChansons;
	}

	/**
	 * @param nbChansons the nbChansons to set
	 */
	public void setNbChansons(int nbChansons) {
		this.nbChansons = nbChansons;
	}

	@Override
	public String toString() {
		return super.toString() + " [chanteur=" + chanteur + ", compositeur=" + compositeur + ", nbChansons=" + nbChansons + "]";
	}
	
	
	

}
