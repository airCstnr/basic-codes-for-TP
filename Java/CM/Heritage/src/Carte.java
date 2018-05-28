import java.util.ArrayList;
import java.util.Comparator;

public class Carte {
	
	private ArrayList<Produit> produits;
	
	public Carte() {
		produits = new ArrayList<>();
	}
	
	private void trierProduitsParType() {
		produits.sort(new Comparator<Produit>() {
			@Override
			public int compare(Produit arg0, Produit arg1) {
				return arg0.getClass().getSimpleName().compareTo(arg1.getClass().getSimpleName());
			}
		});
	}
	
	// on peut utiliser instanceof 
	
	@Override
	public String toString() {
		String type = "";
		trierProduitsParType();
		String str = "--- Liste :\n";
		for (Produit p : produits) {
			if( !p.getClass().getSimpleName().equals(type)) {
				type = p.getClass().getSimpleName();
				str += type + ":\n";
			}
			str += "\t" + p.toString() + "\n";
		}
		return str;
	}
	
	public void addProduit(Produit p) {
		produits.add(p);
	}

}
