import java.awt.Graphics;
import java.util.Random;

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
		private Random r;
		
		private void init() {
			x = getWidth()/2;
			y = getWidth()/2;
		}
		
		public Dessin()	{
			init();
			r = new Random();
		}
		
		/**
		 * Deplace les coordonnees de la balle
		 * Si la balle atteint un bord, elle change de sens
		 */
		public void deplacer() {
			x += (r.nextInt(3)-1)*r.nextDouble()*50;
			y += (r.nextInt(3)-1)*r.nextDouble()*50;
			
			if (x > getWidth() || x < 0 || y > getHeight() || y < 0) {
				init();
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
