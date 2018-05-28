
public class TD9 {

	public static void main(String[] args) {
		System.out.println("\t--- TD9 ---\n");
		testBook();
		
		System.out.println("\t--- Fin TD9 ---");
	}
	
	public static void testBook() {
		System.out.println("\tTest Book");
		Book b = new Book("0123", "ObiWan", "Hello There", "01/02/03", 3.5);
		b.printInfo();
		System.out.println();
	}

}
