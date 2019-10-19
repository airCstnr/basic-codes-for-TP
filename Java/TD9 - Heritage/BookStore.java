import java.util.ArrayList;
import java.util.Iterator;

public class BookStore {

	private ArrayList<Item> items;
	
	/**
	 * Crée un nouveau book store
	 */
	public BookStore() {
		items = new ArrayList<>();
	}
	
	/**
	 * Ajoute un nouveau CD au BookStore
	 * @param tag
	 * @param titre
	 * @param dateAchat
	 * @param prixAchat
	 * @param etat
	 * @param chanteur
	 * @param compositeur
	 * @param nbChansons
	 */
	void addCD(String tag, String titre, String dateAchat, double prixAchat, Status etat, String chanteur,
			String compositeur, int nbChansons)
	{
		if(!exists(tag)) {
			items.add(new CD(tag, titre, dateAchat, prixAchat, etat, chanteur,
			compositeur, nbChansons));
		}
	}
	
	/**
	 * Ajoute un livre à la liste
	 * @param tag
	 * @param auteur
	 * @param titre
	 * @param dateAchat
	 * @param prixAchat
	 */
	public void addBook(String tag, String auteur, String titre, String dateAchat, double prixAchat) {
		if(this.getBook(tag)==null)
		{
			items.add(new Book(tag, auteur, titre, dateAchat, prixAchat));
		}
	}
	
	/**
	 * Ajoute un livre à la liste
	 * @param b
	 */
	public void addCD(CD c) {
		items.add(c);
	}
	
	/**
	 * Ajoute un livre à la liste
	 * @param b
	 */
	public void addBook(Book b) {
		items.add(b);
	}
	
	public Item getItem(String tag) {
		for (Item item : items) {
			if(item.getTag().equals(tag)) {
				return item;
			}
		}
		return null;
	}
	
	/**
	 * Supprimer un item à partir de son numéro RFID
	 * @param tag
	 */
	public void removeItem(String tag) {
		if(exists(tag)) {items.remove(this.getItem(tag)); }
	}
	
	/**
	 * Supprimer un livre à partir de son numéro RFID
	 * @param tag
	 */
	public void removeBook(String tag) {
		if(exists(tag)) {items.remove(this.getBook(tag)); }
	}
	
	/**
	 * Affiche tous les livres de la liste
	 */
	public void displayAllBook() {
		System.out.println("Books list :");
		for (Item item : items) {
			item.toString();
		}
		System.out.println("Books count : " + items.size());
	}
	
	private boolean exists(String tag) {
		for (Item item : items) {
			if(item.getTag().equalsIgnoreCase(tag)) {
				return true;
			}
		}
		return false;
	}
	/**
	 * Renvoie le livre correspndant à un tag
	 * @param tag
	 * @return livre
	 */
	public Book getBook(String tag) {
		if(exists(tag))
		{
			for (Item item : items) {
				if(item.getTag().equalsIgnoreCase(tag)) {
					return item;
				}
			}
		}
		return null;
	}
	
	/**
	 * Recherche un ou des livres à partir du nom d'un auteur
	 * @param auteur
	 * @return liste de livres (éventuellement vide)
	 */
	public ArrayList<Book> findBookByAuthor(String auteur) {
		ArrayList<Book> list = new ArrayList<>();
		for (Item item : items) {
			if(item.getAuteur().equalsIgnoreCase(auteur)) {
				list.add(item);
			}
		}
		return list;
	}
	
	/**
	 * Recherche un ou des livres à partir d'un titre
	 * @param titre
	 * @return liste de livres (éventuellement vide)
	 */
	public ArrayList<Book> findBookByTitle(String titre) {
		ArrayList<Book> list = new ArrayList<>();
		for (Item item : items) {
			if(item.getTitre().equalsIgnoreCase(titre)) {
				list.add(item);
			}
		}
		return list;
	}
	
	/**
	 * Met à jour un livre à partir de son numéro RFID
	 * @param tag
	 * @param auteur
	 * @param titre
	 * @param dateAchat
	 * @param prixAchat
	 */
	public void updateBook(String tag, String auteur, String titre, String dateAchat, double prixAchat) {
		this.removeBook(tag);
		this.addBook(tag, auteur, titre, dateAchat, prixAchat);
	}
	
	/**
	 * Renvoie l'etat du livre
	 * @param tag
	 * @return status
	 */
	public Status getBookStatus(String tag) {
		return exists(tag) ? this.getBook(tag).getEtat() : Status.NON_TROUVE;
	}
	
	/**
	 * Modifie l'etat du livre
	 * @param tag
	 */
	public void setBookStatus(String tag, Status status) {
		if(exists(tag)) this.getBook(tag).setEtat(status);
	}

}
