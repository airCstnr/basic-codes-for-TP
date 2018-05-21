/**
 * Chronomètre
 */
public class Chrono1 {
	
	private int heures, minutes, secondes;
	private Thread compteur;
	private boolean compte;

	/**
	 * Initialise à zéro
	 */
	public Chrono1() {
		this.init(0, 0, 0);
	}
	
	/**
	 * Initialise à la valeur passée
	 * @param heures
	 * @param minutes
	 * @param secondes
	 */
	public Chrono1(int heures, int minutes, int secondes) {
		if (!this.init(heures, minutes, secondes)) {
			throw new IllegalArgumentException();
		}
	}
	
	/**
	 * Initialise le chrono à une valeur donnée
	 * @param heures
	 * @param minutes
	 * @param secondes
	 * @return boolean : true si les paramètres sont corrects
	 */
	public boolean init(int heures, int minutes, int secondes) {
		return this.setSecondes(secondes) && this.setMinutes(minutes) && this.setHeures(heures);
	}
	
	/**
	 * Soustrait une seconde
	 * @return boolean : retourne false si le compteur est déja à zéro
	 */
	public boolean rebours() {
		if(secondes==0) {
			if(minutes==0) {
				if (heures==0) {
					return false;
				}
				else {
					heures--;
					
				}
				minutes = 59;
			}
			else {
				minutes--;
			}
			
			secondes = 59;	
		}
		else {
			secondes--;
		}
		return true;
	}
	
	/**
	 * Lance le chronomètre à rebours
	 */
	public void startRebours() {
		compteur = new Thread(()->{
			while(compte && this.rebours()) {
				try
				{
					Thread.sleep(1000);
				}
				catch (InterruptedException e)
				{
					e.printStackTrace();
				}
			}
		});
		compte = true;
		compteur.start();
	}
	
	/**
	 * Arrete le chronomètre
	 */
	public void stopRebours() {
		compte = false;
		compteur = null;
	}
	
	
	/**
	 * @return the heures
	 */
	public int getHeures() {
		return heures;
	}

	/**
	 * @param heures the heures to set
	 * @return boolean : true if param is correct
	 */
	public boolean setHeures(int heures) {
		if(heures<0) {
			return false;
		}
		this.heures = heures;
		return true;
	}

	/**
	 * @return the minutes
	 */
	public int getMinutes() {
		return minutes;
	}

	/**
	 * @param minutes the minutes to set
	 * @return boolean : true if param is correct
	 */
	public boolean setMinutes(int minutes) {
		if(minutes<0 || minutes>59) {
			return false;
		}
		this.minutes = minutes;
		return true;
	}

	/**
	 * @return the secondes
	 */
	public int getSecondes() {
		return secondes;
	}

	/**
	 * @param secondes the secondes to set
	 * @return boolean : true if param is correct
	 */
	public boolean setSecondes(int secondes) {
		if(secondes<0 || secondes>59) {
			return false;
		}
		this.secondes = secondes;
		return true;
	}

	@Override
	public String toString() {
		return String.format("%02d:%02d:%02d", heures, minutes, secondes);
	}
	
	
}
