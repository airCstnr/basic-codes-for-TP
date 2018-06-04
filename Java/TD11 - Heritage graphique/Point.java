
public class Point {
	
	private int x, y;
	
	/**
	 * @param x
	 * @param y
	 */
	public Point(int x, int y) {
		this.x = x;
		this.y = y;
	}

//	/**
//	 * Déplace le point
//	 * @param dx
//	 * @param dy
//	 */
//	public void deplace(int dx, int dy) {
//		x += dx;
//		y += dy;
//	}
//
//	/**
//	 * @return the x
//	 */
//	public int getX() {
//		return x;
//	}
//
//	/**
//	 * @return the y
//	 */
//	public int getY() {
//		return y;
//	}
	
	public void affiche() {
		System.out.print("Coordonnées : x=" + x + " y=" + y);
	}
}
