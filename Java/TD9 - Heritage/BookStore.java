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
		books.add(new Book(tag, auteur, titre, dateAchat, prixAchat));
	}
	
	/**
	 * Ajoute un livre à la liste
	 * @param b
	 */
	public void addBook(Book b) {
		books.add(b);
	}
	
	/**
	 * Affiche tous les livres de la liste
	 */
	public void displayAllBook() {
		System.out.println("Books list :");
		for (Book book : books) {
			book.printInfo();
		}
	}
	

}
