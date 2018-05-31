import java.util.ArrayList;

public class TD9 {

	public static void main(String[] args) {
		System.out.println("\t--- TD9 ---\n");
		testBook();
		testBookStore();
		System.out.println("\t--- Fin TD9 ---");
	}
	
	public static void testBook() {
		System.out.println("\tTest Book");
		Book b = new Book("0123", "ObiWan", "Hello There", "01/02/03", 3.5);
		b.printInfo();
		System.out.println();
	}
	
	public static void testBookStore() {
		System.out.println("\tTest Book");
		BookStore s = new BookStore();
		s.displayAllBook();
		
		Book b = new Book("0123", "Obi-Wan", "Hello There", "01/02/03", 3.5);
		s.addBook(b);
		s.addBook("12345", "General Kenobi", "You're a bold one!", "30/11/1996", 150.66);
		s.displayAllBook();
		
		s.removeBook("0123");
		s.displayAllBook();
		
		ArrayList<Book> foundByAuthor = s.findBookByAuthor("General Kenobi");
		if(foundByAuthor.size() == 0) {
			assert(false);
		}
		System.out.println("Liste des livres trouv�s :\n" + foundByAuthor.toString());
		
		
		
		ArrayList<Book> foundByTitle = s.findBookByTitle("You're a bold one!");
		if(foundByTitle.size() == 0) {
			assert(false);
		}
		System.out.println("Liste des livres trouv�s :\n" + foundByTitle.toString());
		
		System.out.println();
	}

}
