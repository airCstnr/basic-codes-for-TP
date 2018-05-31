import java.util.ArrayList;
import java.util.Iterator;

public class BookStore {

	private ArrayList<Book> books;
	
	/**
	 * Cr�e un nouveau book store
	 */
	public BookStore() {
		books = new ArrayList<>();
	}
	
//	void addCD(String tag, String titre, String dateAchat, double prixAchat, Status etat, qmlskfqsmdfkljqmsf)
//	{
//		
//	}
	
	/**
	 * Ajoute un livre � la liste
	 * @param tag
	 * @param auteur
	 * @param titre
	 * @param dateAchat
	 * @param prixAchat
	 */
	public void addBook(String tag, String auteur, String titre, String dateAchat, double prixAchat) {
		if(this.getBook(tag)==null)
		{
			books.add(new Book(tag, auteur, titre, dateAchat, prixAchat));
		}
	}
	
	/**
	 * Ajoute un livre � la liste
	 * @param b
	 */
	public void addBook(Book b) {
		books.add(b);
	}
	
	/**
	 * Supprimer un livre � partir de son num�ro RFID
	 * @param tag
	 */
	public void removeBook(String tag) {
		if(exists(tag)) {books.remove(this.getBook(tag)); }
	}
	
	/**
	 * Affiche tous les livres de la liste
	 */
	public void displayAllBook() {
		System.out.println("Books list :");
		for (Book book : books) {
			book.printInfo();
		}
		System.out.println("Books count : " + books.size());
	}
	
	private boolean exists(String tag) {
		for (Book book : books) {
			if(book.getTag().equalsIgnoreCase(tag)) {
				return true;
			}
		}
		return false;
	}
	/**
	 * Renvoie le livre correspndant � un tag
	 * @param tag
	 * @return livre
	 */
	public Book getBook(String tag) {
		if(exists(tag))
		{
			for (Book book : books) {
				if(book.getTag().equalsIgnoreCase(tag)) {
					return book;
				}
			}
		}
		return null;
	}
	
	/**
	 * Recherche un ou des livres � partir du nom d'un auteur
	 * @param auteur
	 * @return liste de livres (�ventuellement vide)
	 */
	public ArrayList<Book> findBookByAuthor(String auteur) {
		ArrayList<Book> list = new ArrayList<>();
		for (Book book : books) {
			if(book.getAuteur().equalsIgnoreCase(auteur)) {
				list.add(book);
			}
		}
		return list;
	}
	
	/**
	 * Recherche un ou des livres � partir d'un titre
	 * @param titre
	 * @return liste de livres (�ventuellement vide)
	 */
	public ArrayList<Book> findBookByTitle(String titre) {
		ArrayList<Book> list = new ArrayList<>();
		for (Book book : books) {
			if(book.getTitre().equalsIgnoreCase(titre)) {
				list.add(book);
			}
		}
		return list;
	}
	
	/**
	 * Met � jour un livre � partir de son num�ro RFID
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
