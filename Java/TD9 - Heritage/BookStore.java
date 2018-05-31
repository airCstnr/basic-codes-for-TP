import java.util.ArrayList;

public class BookStore {

	private ArrayList<Book> books;
	
	/**
	 * Cr�e un nouveau book store
	 */
	public BookStore() {
		books = new ArrayList<>();
	}
	
	/**
	 * Ajoute un livre � la liste
	 * @param tag
	 * @param auteur
	 * @param titre
	 * @param dateAchat
	 * @param prixAchat
	 */
	public void addBook(String tag, String auteur, String titre, String dateAchat, double prixAchat) {
		books.add(new Book(tag, auteur, titre, dateAchat, prixAchat));
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
		for (Book book : books) {
			if(book.getTag().equals(tag)) {
				books.remove(book);
			}
		}
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
	
	public Status getBookStatus() {
		// todo
		return Status.NON_TROUVE;
	}

}
