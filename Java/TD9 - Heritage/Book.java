
public class Book {

	private String tag;
	private String auteur;
	private String titre;
	private String dateAchat;
	private double prixAchat;
	
	/**
	 * @param tag
	 * @param auteur
	 * @param titre
	 * @param dateAchat
	 * @param prixAchat
	 */
	public Book(String tag, String auteur, String titre, String dateAchat, double prixAchat) {
		this.tag = tag;
		this.auteur = auteur;
		this.titre = titre;
		this.dateAchat = dateAchat;
		this.prixAchat = prixAchat;
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
	 * @return the auteur
	 */
	public String getAuteur() {
		return auteur;
	}

	/**
	 * @param auteur the auteur to set
	 */
	public void setAuteur(String auteur) {
		this.auteur = auteur;
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

	/** Modifie la date d'achat du livre
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
	
	public void printInfo() {
		System.out.println(this.toString());
	}

	@Override
	public String toString() {
		return titre + ", " + auteur + " (" + tag + ", " + dateAchat + ", " + prixAchat + "€)"; 
//		return "Book ["
//				+ (tag != null ? "tag=" + tag + ", " : "")
//				+ (auteur != null ? "auteur=" + auteur + ", " : "")
//				+ (titre != null ? "titre=" + titre + ", " : "")
//				+ (dateAchat != null ? "dateAchat=" + dateAchat + ", " : "")
//				+ "prixAchat=" + prixAchat + "€)"
//				+ "]";
	}
	
	

}
