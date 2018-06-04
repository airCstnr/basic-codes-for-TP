
public class TD11 {

	public static void main(String[] args) {
		System.out.println("\t--- TD11 ---\n");
		testPoint();
//		testPointAffichable();
		testPointNom();
		System.out.println("\t--- Fin TD11 ---");
	}
	
	public static void testPoint() {
		System.out.println("\tTest Point");
		Point p = new Point(0, 0);
		System.out.println(p);
		System.out.println();
	}
	
//	public static void testPointAffichable() {
//		System.out.println("\tTest PointAffichable");
//		PointAffichable pa = new PointAffichable(0, 0);
//		System.out.println(pa);
//		pa.affiche();
//		System.out.println();
//	}
	
	public static void testPointNom() {
		System.out.println("\tTest PointNom");
		PointNom pn = new PointNom(0, 0, "hello there");
		pn.affiche();
		System.out.println();
	}

}
