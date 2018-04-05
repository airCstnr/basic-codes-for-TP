
/**
 * Segment du plan
 */
public class Segment {
	
	private Point a;
	private Point b;
	
	public void initialise(Point a, Point b) {
		this.a = a;
		this.b = b;
	}
	
	public void initialise(double ax, double ay, double bx, double by) {
		this.a = new Point();
		this.b = new Point();
		this.a.initialise("a", ax, ay);
		this.b.initialise("b", bx, by);
	}

}
