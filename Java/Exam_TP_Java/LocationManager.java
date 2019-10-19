import java.util.ArrayList;
import java.util.Comparator;
import java.util.Set;
import java.util.function.Predicate;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

public class LocationManager {
	
	private ArrayList<Appareil> appareils;
	
	public LocationManager() {
		appareils = new ArrayList<>();
	}
	
	/**
	 * Ajoute un appareil à la liste
	 * Lance une RuntimeException si l'appareil est deja present
	 * @param a
	 * @throws RuntimeException
	 */
	public void addAppareil(Appareil a) throws RuntimeException {
		for (Appareil appareil : appareils) {
			if(appareil.getNumSerie().equals(a.getNumSerie())) {
				throw new RuntimeException();
			}
		}
		appareils.add(a);
	}
	
	/**
	 * Enleve un apareil de la liste dont le numero de serie est passe en paremetre
	 * Jette une exception si l'appareil n'est pas dans la liste
	 * @param num
	 * @throws RuntimeException
	 */
	public void removeAppareil(String num) throws RuntimeException {
		for (Appareil appareil : appareils) {
			if(appareil.getNumSerie().equals(num)) {
				appareils.remove(appareil);
				return;
			}
		}
		// si on a parcouru toute la liste sans trouver l'appareil, c'est qu'il n'etait pas dans la liste
		throw new RuntimeException();
	}
	
	/**
	 * Affiche tous les appareils
	 */
	public void displayAppareils() {
		for (Appareil appareil : appareils) {
			System.out.println(appareil);
		}
	}
	
	/**
	 * Retourne le nombre de prix differents dans le magasin de location
	 * @return nb prix differents
	 */
	public int getNbPrixDifferents() {
		ArrayList<Integer> prixDifferents = new ArrayList<>();
		for (Appareil appareil : appareils) {
			if(!prixDifferents.contains((Integer)appareil.getPrix())) {
				prixDifferents.add((Integer)appareil.getPrix());
			}
		}
		return prixDifferents.size();
	}
	
	/**
	 * Renvoie la liste des appareils les plus chers
	 * @return liste des appareils les plus chers
	 */
	public ArrayList<Appareil> getPlusCherParCategorie() {
		ArrayList<Appareil> plusChers = new ArrayList<>();
		
		// initialisation de la liste
		plusChers.add(new ScieCirculaire());
		plusChers.add(new Ponceuse());
		plusChers.add(new Echafaudage());
		plusChers.add(new Marteau());
		
		// parcourt de la liste des appareils
		for (Appareil appareil : appareils) {
			for (Appareil cher : plusChers) {
				if (appareil.getClass()==cher.getClass() && appareil.getPrix() > cher.getPrix()) {
					plusChers.set(plusChers.indexOf(cher), appareil);
				}
			}
		}
		
		// suppression des appareils superflus
		Predicate<Appareil> filter = a->a.getPrix()==0;
		plusChers.removeIf(filter);
		
		return plusChers;
	}

	/**
	 * Renvoie la liste des appareils triee par ordre alphabetique
	 * @return liste triee
	 */
	public ArrayList<Appareil> getListeOrdreAlphabetique() {
		ArrayList<Appareil> list = (ArrayList<Appareil>)appareils.clone();
		list.sort(Comparator.comparing(Appareil::getLibelle));
		return list;
	}
}
