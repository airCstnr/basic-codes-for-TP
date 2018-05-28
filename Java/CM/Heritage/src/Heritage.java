
public class Heritage {

	public static void main(String[] args) {
		Carte c = new Carte();
		c.addProduit( new BoissonA("Chartreuse", 29.99, 100));
		System.out.println(c.toString());
	}

}
