
public class Individu {
	
	private static final String DEF_NUMERO = "06 12 12 12 12"; 
	
	private String nom, prenom, adresse, numero;

	/**
	 * @param nom
	 * @param prenom
	 * @param adresse
	 * @param numero
	 */
	public Individu(String nom, String prenom, String adresse, String numero) {
		this(nom, prenom, numero);
		this.adresse = adresse;
	}
	
	/**
	 * @param nom
	 * @param prenom
	 * @param numero
	 */
	public Individu(String nom, String prenom, String numero) {
		this(nom, prenom);
		this.numero = numero;
	}

	/**
	 * @param nom
	 * @param prenom
	 */
	public Individu(String nom, String prenom) {
		this.nom = nom;
		this.prenom = prenom;
		this.adresse = "";
		this.numero = DEF_NUMERO;
	}

	/**
	 * @return the nom
	 */
	public String getNom() {
		return nom;
	}

	/**
	 * @param nom the nom to set
	 */
	public void setNom(String nom) {
		this.nom = nom;
	}

	/**
	 * @return the prenom
	 */
	public String getPrenom() {
		return prenom;
	}

	/**
	 * @param prenom the prenom to set
	 */
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	/**
	 * @return the adresse
	 */
	public String getAdresse() {
		return adresse;
	}

	/**
	 * @param adresse the adresse to set
	 */
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	/**
	 * @return the numero
	 */
	public String getNumero() {
		return numero;
	}

	/**
	 * @param numero the numero to set
	 */
	public void setNumero(String numero) {
		this.numero = numero;
	}

	@Override
	public String toString() {
		return prenom + " " + nom + " (" + numero + ") [ "+ adresse + " ]";
	}
	
	
	
	
	
	
	
	
}
