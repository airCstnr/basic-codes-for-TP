
public abstract class Appareil {
	
	private String numSerie;
	private String libelle;
	private int prix;
	
	/**
	 * Appareil vide
	 */
	public Appareil() {
	}

	/**
	 * @param numSerie
	 * @param libelle
	 * @param prix
	 */
	public Appareil(String numSerie, String libelle, int prix) {
		setNumSerie(numSerie);
		setLibelle(libelle);
		setPrix(prix);
	}

	/**
	 * @return the numSerie
	 */
	public String getNumSerie() {
		return numSerie;
	}

	/**
	 * @param numSerie the numSerie to set
	 */
	public void setNumSerie(String numSerie) {
		if (numSerie.length()!=10) {
			throw new RuntimeException();
		}
		this.numSerie = numSerie;
	}

	/**
	 * @return the libelle
	 */
	public String getLibelle() {
		return libelle;
	}

	/**
	 * @param libelle the libelle to set
	 */
	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}

	/**
	 * @return the prix
	 */
	public int getPrix() {
		return prix;
	}

	/**
	 * @param prix the prix to set
	 */
	public void setPrix(int prix) {
		if (prix<0) {
			throw new RuntimeException();
		}
		this.prix = prix;
	}

	@Override
	public String toString() {
		return "[" + numSerie + "] : " + libelle + " (" + prix + " €)\t";
	}
	
}
