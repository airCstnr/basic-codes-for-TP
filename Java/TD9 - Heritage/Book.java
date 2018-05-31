
public class Book extends Item {

	private String auteur;
	
	/**
	 * @param tag
	 * @param titre
	 * @param dateAchat
	 * @param prixAchat
	 * @param etat
	 * @param auteur
	 */
	public Book(String tag, String titre, String dateAchat, double prixAchat, Status etat, String auteur) {
		super(tag, titre, dateAchat, prixAchat, etat);
		this.auteur = auteur;
	}
	
	
	/** Crée un nouveau livre
	 * @param tag
	 * @param titre
	 * @param dateAchat
	 * @param prixAchat
	 * @param etat
	 * @param auteur
	 */
	public Book(String tag, String auteur, String titre, String dateAchat, double prixAchat) {
		super(tag, titre, dateAchat, prixAchat, Status.DISPONIBLE);
		this.auteur = auteur;
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
	 * Affiche les informations du livre
	 */
	public void printInfo() {
		System.out.println(this.toString());
	}

	@Override
	public String toString() {
		return super.toString() + ", auteur = " + auteur ;
	}
	
	

}
