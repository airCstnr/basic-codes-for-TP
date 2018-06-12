import java.awt.Graphics;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class Fenetre01 {
	
	private void afficher() {
		JFrame f = new JFrame("Mon premier dessin");
		Dessin dessin = new Dessin();
		f.getContentPane().add(dessin);
		f.setSize(512, 512);
		f.setVisible(true);
	}

	class Dessin extends JPanel {
	
		/**
		 * Permet d'afficher la zone de dessin et son contenu
		 */
		@Override
		public void paintComponent(Graphics g) {
			super.paintComponent(g);
			int x = 200;
			int y = 200;
			int r = 15;
			g.fillOval(x - r, y - r, 2 * r, 2 * r);
		}
	}

	public static void main(String[] args) {
		Fenetre01 f1 = new Fenetre01();
		f1.afficher();
	}
}
