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
		
		// book store vide
		BookStore s = new BookStore();
		s.displayAllBook();
		
		// livres
		Book b0 = new Book("1", "Obi-Wan", "Hello There", "01/02/03", 3.5);
		Book b1 = new Book("156", "Yoda", "There is no try", "Super date", 0.99);
		Book b2 = new Book("157", "Anakin", "I want to protect Amidala", "33/22/1111", 10000);
		Book b3 = new Book("158", "Luke", "Nooooooo", "Le jour ou tout a commence", 10.52);
		
		// ajout de livres existants  
		s.addBook(b0);
		s.addBook(b1);
		s.addBook(b2);
		s.addBook(b3);
		s.displayAllBook();
		
		// ajout de livres à la volée
		s.addBook("12345", "General Grievous", "You're a bold one!", "30/11/1996", 150.66);
		s.addBook("159", "Luke", "Oncle Ben!", "Star Wars IV for ever", 1998);
		s.displayAllBook();
		
		// suppression de livre
		s.removeBook("1");
		s.displayAllBook();
		
		// recherche de livres
		ArrayList<Book> foundByAuthor = s.findBookByAuthor("Luke");
		if(foundByAuthor.size() == 0) {
			assert(false);
		}
		System.out.println("Liste des livres trouvés :\n" + foundByAuthor.toString());
		
		ArrayList<Book> foundByTitle = s.findBookByTitle("You're a bold one!");
		if(foundByTitle.size() == 0) {
			assert(false);
		}
		System.out.println("Liste des livres trouvés :\n" + foundByTitle.toString());
		
		// obtention d'un livre
		if(s.getBook("12345")!=null)
		{
			System.out.println(s.getBook("12345").getEtat());
		}
		
		// modification du statut
		s.getBook("12345").setEtat(Status.EMPRUNTE);
		System.out.println(s.getBook("12345").getEtat());
		s.setBookStatus("12345", Status.DISPONIBLE );
		System.out.println(s.getBook("12345").getEtat());

		
		System.out.println();
	}

}
