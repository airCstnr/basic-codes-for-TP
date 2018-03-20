
// auteur : Raphaël Castanier

/** Classe de base pour illustrer le cours magistral */
public class CoursMagistral {

    public static void main(String[] args) {
        System.out.println("Hello world!");

        Scanner sc;                     // nouvel objet de type Scanner
        sc = new Scanner(System.in);    // associe un lecteur du clavier à sc
        int a = sc.nextInt();           // enregistre l'entier lu au clavier à la variable a
        String s = sc.next();           // enregistre la saisie au clavier à la variable s

        float f = 35.5f;
        double d = 35.5; // à vérifier
        double e = 35.5d;
        long l = 500l;
    };

}
