import java.util.ArrayList;
import java.util.Comparator;

/**
 *  Annuaire gérant des Individus
 *  
 *  Méthodes à implémenter :
 *  	addIndividu(nom,adresse,numéro de téléphone)
 *  	displayAllIndividus : affichage de tous les individus
 *  	getNbIndividus() : retourne le nombre d'individus contenus dans l'annuaire
 *  Votre implémentation utilisera la classe ArrayList pour stocker la liste des individus.
 */
public class Annuaire {
	
	private ArrayList<Individu> liste;
	
	
	
	/**
	 * Crée un annuaire vide
	 */
	public Annuaire() {
		liste = new ArrayList<>();
	}

	/**
	 * Ajoute un nouvel individu à l'annuaire
	 * @param nom
	 * @param prenom
	 * @param adresse
	 * @param numero
	 * 
	 * Note : cette méthode n'a que peu d'intéret, c'est l'appelant qui devrait faire ces opérations...
	 */
	public void addIndividu(String nom, String prenom, String adresse, String numero) {
		addIndividu(new Individu(nom, prenom, adresse, numero));
	}
	
	/**
	 * Ajoute un nouvel individu à l'annuaire
	 * @param individu
	 */
	public void addIndividu(Individu individu) {
		liste.add(individu);
	}
	
	/**
	 * Affiche la liste de tous les individus
	 */
	public void displayAllIndividus() {
		System.out.println("Liste des individus :");
		for (Individu individu : liste) {
			System.out.println("\t" + individu.toString());
		}
		System.out.println();
	}
	
	/**
	 * Retourne le nombre d'individus contenus dans l'annuaire
	 * @return nombre d'individus
	 */
	public int getNbIndividus() {
		return liste.size();
	}
	
	/**
	 * Trie l'annuaire par prénom
	 */
	public void sortByName() {
		liste.sort(new Comparator<Individu>() {
			public int compare(Individu a, Individu b) {
				return a.getPrenom().compareTo(b.getPrenom());
			}
		});
	}
	
	/**
	 * Trie l'annuaire par numéro de téléphone
	 */
	public void sortByTelNumber() {
		liste.sort(new Comparator<Individu>() {
			public int compare(Individu a, Individu b) {
				return a.getNumero().compareTo(b.getNumero());
			}
		});
	}
}
