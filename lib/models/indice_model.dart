
import 'package:hive/hive.dart';
import 'package:ryp/models/quiz_model.dart';

part 'indice_model.g.dart';

@HiveType(typeId: 2)
class Indice{

  @HiveField(0)
  int idIndice;
  @HiveField(1)
  String contextIndice;
  @HiveField(2)
  String img;
  @HiveField(3)
  int result;
  @HiveField(4)
  String infobonus;
  @HiveField(5)
  int coins;
  @HiveField(6)
  String indiceResult;
  @HiveField(7)
  List<String> quizLines;
  @HiveField(8)
  List<Quiz> quizList;

  Indice({
    this.idIndice,
    this.contextIndice,
    this.img,
    this.result,
    this.infobonus,
    this.coins,
    this.indiceResult,
    this.quizLines,
    this.quizList,
  });

}

List<Indice> allIndices = [
  Indice(
    idIndice: 20,
    contextIndice: "Accessoire mou qui sert d'arme lors des batailles.",
    img: "assets/images/house21.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Coussins",
    quizLines: [
      ""
    ],
    quizList: [
      Quiz(contextQuiz: "", result: "1", priority: 1),
    ]
  ),
  Indice(
    idIndice: 21,
    contextIndice: "C'est dans l'obscurité que je vis pleinement de mon talent.",
    img: "assets/images/house22.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Veilleuse",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 22,
    contextIndice: "Une partie de moi est utilisé à la moitié. "
      "L'autre partie est le code de la Croatie selon la liste des codes pays du CIO. "
      "Et je suis dans la série Crow."
      "Des artistes m'utilisent souvent.",
    img: "assets/images/house23.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Micro",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 23,
    contextIndice: "A l'intérieur, des gouttes.",
    img: "assets/images/house24.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Jus",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 24,
    contextIndice: "Je coule du nez quand on me penche. "
      "Et à l'intérieur de mon ventre, y'a une mer noire. ",
    img: "assets/images/house25.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Machine à café",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 25,
    contextIndice: "Je parle fort la plupart du temps",
    img: "assets/images/house26.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Hauts parleurs",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 26,
    contextIndice: "La couleur fut une de mes grandes motivations.",
    img: "assets/images/house27.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Télévision",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 27,
    contextIndice: "Je donne vie à mes senblables quand j'ai des ressources. "
      "Mes senblables sont des appareils électronique. ",
    img: "assets/images/house28.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Prises électique murale",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 28,
    contextIndice: "Je contient ce qui parle toutes les langues et qui a souvent la tête à l'envers. "
      "Je contient ce qui est à bille, à plume ou à encre.",
    img: "assets/images/house29.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Boîte à stylo",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 29,
    contextIndice: "On m'utilise pour des souvenirs, des rappels, des programmes.",
    img: "assets/images/house30.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Notes de rappel",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 30,
    contextIndice: "J'ai des tiroirs et un plan de travail. "
    "J'ai quatre pattes mais je ne suis pas un animal. ",
    img: "assets/images/house31.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Bureau",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 31,
    contextIndice: "Mes camarades disent que je suis rond mais actuellement j'ai deux frères à coté. "
      "Ensemble, on peut faire bouger jusqu'à cent fois plus notre poids.",
    img: "assets/images/house32.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Roues",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 32,
    contextIndice: "Il fait un peu moins froid chez moi que chez mon gros cousin",
    img: "assets/images/house33.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Frigo",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 33,
    contextIndice: "Je trouve place dans les expositions d'arts.",
    img: "assets/images/house34.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Tableaux",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 34,
    contextIndice: "Je connais l'alphabet, les nombres et tout les caractères de dialogue social."
    " Je sert de guide et j'accompagne la boîte magique à images.",
    img: "assets/images/house35.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Clavier",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 35,
    contextIndice: "On cache des secrets que seuls les curieux peuvent savoir. "
      "Je suis facilement portable.",
    img: "assets/images/house36.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Rouge & Bleu",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 36,
    contextIndice: "Ustensile de cuisine à fond cintré cerclé "
      "souvent en aluminium.",
    img: "assets/images/house37.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Casserole",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 37,
    contextIndice: "Recyclable et biodégradable fait à base de papier.",
    img: "assets/images/house38.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Carton",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 38,
    contextIndice: "Regardes-moi et je te dirai qui tu es avec ma magie.",
    img: "assets/images/house39.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Clichés",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 39,
    contextIndice: "Quand je sèche, je me mouille."
      "Plus je sèche, plus je deviens humide.",
    img: "assets/images/house40.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Serviette",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 40,
    contextIndice: "J'offre des services de conservations ou de rangement et parfois de cachettes.",
    img: "assets/images/house41.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Casiers et coeur",
    quizLines: [
      ""
    ]
  ),
  Indice(
    idIndice: 41,
    contextIndice: "Mon premier n'est pas froid. "
      "Mon deuxième n'est pas << sous >>. "
      "Mon tout existe pour petits ou pour grands petons. "
      "Autrement, on marche toujours par deux. ",
    img: "assets/images/house42.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Chaussures-Sandales",
    quizLines: [
      ""
    ]
  ),
];

List<Indice> allIndice = [
  Indice(
    idIndice: 0,
    contextIndice: "On a besoin de moi quand on a peur.",
    img: "assets/images/house1.png",
    result: 0424,
    infobonus: "Dans un nombre écrit, chaque a des valeurs parmis lesquelles il y a, "
      "celle là qui vient de la place qu'elle occupe dans le nombre. C'est la valeur relative.",
    coins: 10,
    indiceResult: "Lampe",
    quizLines: [
      "0004 + 0420 ?"
    ],
    quizList: [
      Quiz(contextQuiz: "0004 + 0420 ?", result: "0424", priority: 1),
    ]
  ),
  Indice(
    idIndice: 1,
    contextIndice: "J'existe, je vis, depuis la nuit des temps "
      "avec toutes choses, tout être. Ce qui brille m'élimine "
      "et me crée.",
    img: "assets/images/house2.png",
    result: 2000,
    infobonus: "La valeur relative sert à indiquer l'espèce d'unités représentées par le chiffre, "
      "en se fondant sur le principe que tout chiffre placé à la gauche d'un autre représente "
      "des unités dix fois plus fortes.",
    coins: 10,
    indiceResult: "Ombre",
    quizLines: [
      "La valeur du chiffre 2  dans le nombre 52 398 ?"
    ],
    quizList: [
      Quiz(contextQuiz: "La valeur du chiffre 2  dans le nombre 52 328 ?", result: "2000", priority: 1),
    ]
  ),
  Indice(
    idIndice: 2,
    contextIndice: "Je dis la vérité. Sans lumière, je n'existe."
      " Regarde moi et je te dirai qui tu es. 12345 | 54321",
    img: "assets/images/house3.jpg",
    result: 333,
    infobonus: "Tout entier naturel supérieur ou égal à deux est décomposable en un "
      "produit de facteur premier. Cette décomposition est unique.",
    coins: 10,
    indiceResult: "Mirroir",
    quizLines: [
      "Trouver la décomposition en produit de facteurs premiers de 27 ?",
      "Les nombres résultants sont dans l'ordre le code"
    ],
    quizList: [
      Quiz(contextQuiz: "Trouver la décomposition en produit de facteurs premiers de 27 ?"
      "Les nombres résultants sont dans l'ordre le code", result: "333", priority: 1),
    ]
  ),
  Indice(
    idIndice: 3,
    contextIndice: "Plantes à fleurs, plantes succulentes, xérophytes qui stockent dans leurs tissus des"
      " réserves de suc pour faire face aux longues périodes de sécheresse.",
    img: "assets/images/house4.jpg",
    result: 138,
    infobonus: "Dans une opération, le contenu des parenthéses prime sur le reste.",
    coins: 10,
    indiceResult: "Cactus",
    quizLines: [
      "17 + ((5 + 6) * 11)"
    ],
    quizList: [
      Quiz(contextQuiz: "17 + ((5 + 6) * 11)", result: "138", priority: 1),
    ]
  ),
  Indice(
    idIndice: 4,
    contextIndice: "A plusieurs comme à seul, j'existe dans presque tout les métiers; "
      "à l'école comme au boulot.",
    img: "assets/images/house5.jpg",
    result: 58,
    infobonus: "Dans une opération, la "
      "multiplication est prioritaire par rapport aux autres signes d'opération.",
    coins: 10,
    indiceResult: "Papier",
    quizLines: [
      "23 + 7 x 5",
    ],
    quizList: [
      Quiz(contextQuiz: "23 + 7 x 5", result: "58", priority: 1),
    ]
  ),
  Indice(
    idIndice: 5,
    contextIndice: "Je retombe toujours sur mes pieds mais je ne suis pas un homme.",
    img: "assets/images/house6.jpg",
    result: 1118,
    infobonus: "Dans une suite logique, il suffit de trouver la logique selon laquelle les "
      "différents termes sont écrits. Aussi, Le dénombrement est la détermination du nombre d'éléments d'un ensemble.",
    coins: 10,
    indiceResult: "Chat",
    quizLines: [
      "10 + 3 = 1113", "12 x 12 = 1124", "17 + 8 = 1215", "3 x 6 = ?",
    ],
    quizList: [
      Quiz(contextQuiz: "10 + 3 = 1113 ; 12 x 12 = 1124 ; 17 + 8 = 1215 ; 3 x 6 = ? ", result: "1118", priority: 1),
    ]
  ),
  Indice(
    idIndice: 6,
    contextIndice: "Quand je marche, je ne dois pas avancer. "
      "Je peux m'arrêter même si je ne bouge pas. "
      "Bien que je ne descende jamais, il faut toujours me remonter.",
    img: "assets/images/house7.jpg",
    result: 4355,
    infobonus: "Suite logique combina",
    coins: 10,
    indiceResult: "Horloge",
    quizLines: [
      "O3, T3, T5, F4, ?, ?, ?, ?.",
      "Quels sont les termes suivants ?",
      "Les chiffres associés aux lettres formeront le code"
    ],
    quizList: [
      Quiz(contextQuiz: "O3, T3, T5, F4, ?, ?, ?, ?. "
      "Quels sont les termes suivants ? "
      "Les chiffres associés aux lettres formeront le code", result: "4355", priority: 1),
    ]
  ),
  Indice(
    idIndice: 7,
    contextIndice: "Je donne des couleurs quand on a besoin de moi.",
    img: "assets/images/house8.jpg",
    result: 139,
    infobonus: "Il faut additionner les chiffres du nombre précédent et l'ajouter au dernier nombre actuel ",
    coins: 10,
    indiceResult: "Imprimante",
    quizLines: [
      "89, 106, 111, 118, 128, ?",
      "Quel est le nombre suivant de cette suite logique ? "
    ],
    quizList: [
      Quiz(contextQuiz: "89, 106, 111, 118, 128, ? ."
      "Quel est le nombre suivant de cette suite logique ? ", result: "139", priority: 1),
    ]
  ),
  Indice(
    idIndice: 8,
    contextIndice: "De toutes les formes, j'accueille plantes et fleurs.",
    img: "assets/images/house9.jpg",
    result: 3157,
    infobonus: "Un nombre impair, est un nombre qui n'est pas un multiple de 2.",
    coins: 10,
    indiceResult: "Pot",
    quizLines: [
      "Ensemble des nombres impairs dans : ",
      "8, 0, 3, 12, 15, 7"
    ],
    quizList: [
      Quiz(contextQuiz: "Ensemble des nombres impairs dans : "
      "8, 0, 3, 12, 15, 7", result: "3157", priority: 1),
    ]
  ),
  Indice(
    idIndice: 9,
    contextIndice: "Généralement plus haut que large et sans pied. "
      "Dans un certain contexte, soit le jeu, sert à lancer des dés.",
    img: "assets/images/house10.jpg",
    result: 52317,
    infobonus: "Dans la table de multiplication des nombres par 2 ou par les multiples de 2, tous les résultats "
      "correspondants à ces opérations sont des nombres pairs.",
    coins: 10,
    indiceResult: "Gobelet",
    quizLines: [
      "Ensemble des nombres impairs dans : ",
      "5, 0, 23, 10, 1, 7 "
    ],
    quizList: [
      Quiz(contextQuiz: "Ensemble des nombres impairs dans : "
      "5, 0, 23, 10, 1, 7.", result: "52317", priority: 1),
    ]
  ),


  
  Indice(
    idIndice: 10,
    contextIndice: "Rangement coulissant dernier de la classe.",
    img: "assets/images/house11.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Tiroir",
    quizLines: [
      ""
    ],
    quizList: [
      Quiz(contextQuiz: "", result: "1", priority: 1),
    ]
  ),
  Indice(
    idIndice: 11,
    contextIndice: "Je regroupe dans mon ventre ce qui peut y entrer mais pas de pattes.",
    img: "assets/images/house12.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Recipient",
    quizLines: [
      ""
    ],
    quizList: [
      Quiz(contextQuiz: "", result: "1", priority: 1),
    ]
  ),
  Indice(
    idIndice: 12,
    contextIndice: "Son contenu sert de souvenir. ",
    img: "assets/images/house13.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Cadre photo",
    quizLines: [
      ""
    ],
    quizList: [
      Quiz(contextQuiz: "", result: "1", priority: 1),
    ]
  ),
  Indice(
    idIndice: 13,
    contextIndice: "Mon premier est une boisson que les anglais apprécient. "
      "Mon deuxième est le plat préféré des bébés. "
      "Mon troisième est le contraire de vrai. " 
      "Mon quatrième se fait avec des ficelles. "
      "Mon tout est un moyen de communication. "
      "Soit : Au bout du fil. ",
    img: "assets/images/house14.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Téléphone",
    quizLines: [
      ""
    ],
    quizList: [
      Quiz(contextQuiz: "", result: "1", priority: 1),
    ]
  ),
  Indice(
    idIndice: 14,
    contextIndice: "Mon premier est forcement chaud. "
      "Mon deuxième est le quatre des anglophones. "
      "Mon tout est un outil de cuisine.",
    img: "assets/images/house15.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Four",
    quizLines: [
      ""
    ],
    quizList: [
      Quiz(contextQuiz: "", result: "1", priority: 1),
    ]
  ),
  Indice(
    idIndice: 15,
    contextIndice: "Mes feuilles ne changent jamais de couleur.",
    img: "assets/images/house16.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Livres",
    quizLines: [
      ""
    ],
    quizList: [
      Quiz(contextQuiz: "", result: "1", priority: 1),
    ]
  ),
  Indice(
    idIndice: 16,
    contextIndice: "Froid quand il fait chaud.",
    img: "assets/images/house17.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Climatiseur",
    quizLines: [
      ""
    ],
    quizList: [
      Quiz(contextQuiz: "", result: "1", priority: 1),
    ]
  ),
  Indice(
    idIndice: 17,
    contextIndice: "Débloque, ferme, contient, électronique sans batterie.",
    img: "assets/images/house18.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "USB",
    quizLines: [
      ""
    ],
    quizList: [
      Quiz(contextQuiz: "", result: "1", priority: 1),
    ]
  ),
  Indice(
    idIndice: 18,
    contextIndice: "Je suis toujours chaud peu importe la météo.",
    img: "assets/images/house19.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Four",
    quizLines: [
      ""
    ],
    quizList: [
      Quiz(contextQuiz: "", result: "1", priority: 1),
    ]
  ),
  Indice(
    idIndice: 19,
    contextIndice: "Certaines personnes pensent que je suis méchant et beurk, "
      "mais ils n'hésitent pas à me salir.",
    img: "assets/images/house20.jpg",
    result: 12,
    infobonus: "exfgcet dty tyjyg",
    coins: 10,
    indiceResult: "Poubelle",
    quizLines: [
      ""
    ],
    quizList: [
      Quiz(contextQuiz: "", result: "1", priority: 1),
    ]
  ),
];