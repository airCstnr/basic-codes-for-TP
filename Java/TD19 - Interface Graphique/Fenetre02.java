import java.awt.Graphics;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class Fenetre02 {
	
	private void afficher() {
		JFrame f = new JFrame("Mon premier dessin animé");
		Dessin dessin = new Dessin();
		f.getContentPane().add(dessin);
		f.setSize(500, 800);
		f.setVisible(true);
		//la boucle d'animation
		while (true) {
			//fait deplacer le ballon
			dessin.deplacer();
			//la zone de dessin se réaffiche
			dessin.repaint();
			//un temps de pause pour avoir le temps de voir le nouveau dessin
			pause(60);
		}
	}
	
	public void pause(int duree) {
		try {
			Thread.sleep(duree);
		}
		catch (InterruptedException e) {
		}
	}
	
	class Dessin extends JPanel {
		int x, y;
		int signeX, signeY;
		public Dessin()	{
			x = 0;
			y = 0;
			signeX = 1;
			signeY = 1;
		}
		
		/**
		 * Deplace les coordonnees de la balle
		 * Si la balle atteint un bord, elle change de sens
		 */
		public void deplacer() {
			x += signeX*10;
			y += signeY*10;
			
			if (x > getWidth() || x < 0) {
				signeX*=-1;
			}
			
			if (y > getHeight() || y < 0) {
				signeY*=-1;
			}
		}
		
		/**
		 * Permet d'afficher la zone de dessin et son contenu
		 *
		 */
		@Override
		public void paintComponent(Graphics g) {
			// Rayon de notre cercle
			int r = 10;
			super.paintComponent(g);
			g.fillOval(x - r, y - r, 2 * r, 2 * r);
		}
	}
	
	public static void main(String[] args) {
		Fenetre02 f1 = new Fenetre02();
		f1.afficher();
	}
}
