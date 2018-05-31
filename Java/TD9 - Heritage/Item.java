
public class Item {
	
	private String tag;
	private String titre;
	private String dateAchat;
	private double prixAchat;
	private Status etat;
	
	/** Crée un item
	 * @param tag
	 * @param titre
	 * @param dateAchat
	 * @param prixAchat
	 * @param etat
	 */
	public Item(String tag, String titre, String dateAchat, double prixAchat, Status etat) {
		this.tag = tag;
		this.titre = titre;
		this.dateAchat = dateAchat;
		this.prixAchat = prixAchat;
		this.etat = etat;
	}

	/**
	 * @return the tag
	 */
	public String getTag() {
		return tag;
	}

	/**
	 * @param tag the tag to set
	 */
	public void setTag(String tag) {
		this.tag = tag;
	}

	/**
	 * @return the titre
	 */
	public String getTitre() {
		return titre;
	}

	/**
	 * @param titre the titre to set
	 */
	public void setTitre(String titre) {
		this.titre = titre;
	}

	/**
	 * @return the dateAchat
	 */
	public String getDateAchat() {
		return dateAchat;
	}

	/**
	 * @param dateAchat the dateAchat to set
	 */
	public void setDateAchat(String dateAchat) {
		this.dateAchat = dateAchat;
	}

	/**
	 * @return the prixAchat
	 */
	public double getPrixAchat() {
		return prixAchat;
	}

	/**
	 * @param prixAchat the prixAchat to set
	 */
	public void setPrixAchat(double prixAchat) {
		this.prixAchat = prixAchat;
	}

	/**
	 * @return the etat
	 */
	public Status getEtat() {
		return etat;
	}

	/**
	 * @param etat the etat to set
	 */
	public void setEtat(Status etat) {
		this.etat = etat;
	}
	
	@Override
	public String toString() {
		return titre + " (" + tag + ", " + dateAchat + ", " + prixAchat + "€) [" + etat + "]";
	}

}
