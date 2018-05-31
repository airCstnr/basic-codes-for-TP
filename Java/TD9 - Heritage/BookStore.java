import java.util.ArrayList;

public class BookStore {

	private ArrayList<Book> books;
	
	/**
	 * Crée un nouveau book store
	 */
	public BookStore() {
		books = new ArrayList<>();
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
			books.add(new Book(tag, auteur, titre, dateAchat, prixAchat));
		}
	}
	
	/**
	 * Ajoute un livre à la liste
	 * @param b
	 */
	public void addBook(Book b) {
		books.add(b);
	}
	
	/**
	 * Supprimer un livre à partir de son numéro RFID
	 * @param tag
	 */
	public void removeBook(String tag) {
		books.remove(this.getBook(tag)!=null?this.getBook(tag):null);
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
	 * Renvoie le livre correspndant à un tag
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
	 * Recherche un ou des livres à partir du nom d'un auteur
	 * @param auteur
	 * @return liste de livres (éventuellement vide)
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
	 * Recherche un ou des livres à partir d'un titre
	 * @param titre
	 * @return liste de livres (éventuellement vide)
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
		return exists(tag) ? this.getBook(tag).getStatus() : Status.NON_TROUVE;
	}
	
	

}
