import 'package:hive/hive.dart';
import 'package:ryp/models/indice_model.dart';
import 'package:ryp/models/quiz_model.dart';
import 'package:ryp/models/user_model.dart';

const alarmAudioPath = "audios/0020.mp3";
const audioClickPuzzleGrid = "audios/1801.mp3";
const audioWin = "audios/saut1.mp3";
const audioLose = "audios/fall.mp3";
const audioLevel = "audios/saut1.mp3";
const audioResetPuzzle = "audios/sf_twang_01.mp3";
const audioAugmentedTime = "audios/SF-bewitch.mp3";
const fairytail = "audios/fairytail.mp3";

const String userBoxName = 'player';
const String indiceBoxName = "indice";
const String quizBoxName = "quiz";

int timeRest = 0;

List<Box> allBox = [];

User player;

Future<void> initDatabaseData() async {
  var boxUser = Hive.box<User>(userBoxName);
  var boxIndice = Hive.box<Indice>(indiceBoxName);

  if(boxUser == null || boxUser.length == 0)
  await boxUser.add(User()
    ..focusUser = 0
    ..coinsUser = 0
    ..progressUser = 0
    ..nameUser = "Player"
    ..lifeUser = 5
    ..highScore = 0
    ..hadStarted = false
  );

  if(boxIndice == null || boxIndice.length == 0)
    await boxIndice.addAll(allIndice);
}

Future<List<Box>> openAllBox() async{
  Hive.registerAdapter(UserAdapter());
  var boxUser = await Hive.openBox<User>(userBoxName);
  Hive.registerAdapter(QuizAdapter());
  var boxQuiz = await Hive.openBox<Quiz>(quizBoxName);
  Hive.registerAdapter(IndiceAdapter());
  var boxIndice = await Hive.openBox<Indice>(indiceBoxName);

  allBox.add(boxUser);
  allBox.add(boxQuiz);
  allBox.add(boxIndice);

  return allBox;
}

//User
void getUser(){
  final box = Hive.box<User>(userBoxName);
  player = box.values.toList().first;
}

//User
void userStarted(){
  final box = Hive.box<User>(userBoxName);
  User user = box.values.toList().first;

  user.hadStarted = true;

  box.putAt(0, user);
}

void userRegress(){
  final box = Hive.box<User>(userBoxName);
  User user = box.values.toList().first;

  //user.hadStarted = false;
  user.lifeUser = 5;
  int focus;
  if(getFirstUser().focusUser > 0){
    focus = getFirstUser().focusUser - 1;
  }else focus = 0;

  user.focusUser = focus;

  box.putAt(0, user);
}

void userRestart(){
  final box = Hive.box<User>(userBoxName);
  User user = box.values.toList().first;

  user.lifeUser = 5;
  user.focusUser = 0;

  box.putAt(0, user);
}

User getFirstUser(){
  final box = Hive.box<User>(userBoxName);
  return box.values.toList().first;
}

int getIndicesSize(){
  return Hive.box<Indice>(indiceBoxName).values.toList().length;
}

Indice getActuallyIndice(){
  final boxI = Hive.box<Indice>(indiceBoxName);
  Indice indice;
  boxI.values.toList().forEach((element) {
    if (element.idIndice == getFirstUser().focusUser) {
      indice = element;
    }
  });

  return indice;
}


diminitionPlayerLife(){
  var boxUser = Hive.box<User>(userBoxName);
  User user = boxUser.getAt(0);
    user.progressUser -= 1;
  boxUser.putAt(0, user);
}

diminitionUserLife(){
  var boxUser = Hive.box<User>(userBoxName);
  User user = boxUser.values.toList().first;
    user.lifeUser -= 1;
  boxUser.putAt(0, user);
}

augementedUserLife(){
  var boxUser = Hive.box<User>(userBoxName);
  User user = boxUser.values.toList().first;
    user.lifeUser += 1;
  boxUser.putAt(0, user);
}

augementedPlayerLevel(){
  var boxUser = Hive.box<User>(userBoxName);
  User user = getFirstUser();
  user.focusUser ++;
  boxUser.putAt(0, user);
}

highScore(int time){
  var boxUser = Hive.box<User>(userBoxName);
  User user = getFirstUser();
  if (user.highScore != 0) {
    if (user.highScore > time) {
      user.highScore = time;
    }
  }else user.highScore = time;
  boxUser.putAt(0, user);
}

augmentedCoins(int coins){
  var boxUser = Hive.box<User>(userBoxName);
  User user = getFirstUser();
  user.coinsUser += coins;
  boxUser.putAt(0, user);
}

diminutionCoins(int coins){
  var boxUser = Hive.box<User>(userBoxName);
  User user = getFirstUser();
  user.coinsUser -= coins;
  boxUser.putAt(0, user);
}
