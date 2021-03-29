
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class User{

  @HiveField(0)
  int idUser;
  @HiveField(1)
  String nameUser;
  @HiveField(2)
  int coinsUser;
  @HiveField(3)
  int starsUser;
  @HiveField(4)
  int focusUser;
  @HiveField(5)
  double progressUser;
  @HiveField(6)
  int lifeUser;
  @HiveField(7)
  int highScore;
  @HiveField(8)
  bool hadStarted;

  User({this.nameUser, this.coinsUser, this.starsUser, this.highScore,
   this.focusUser, this.progressUser, this.lifeUser, this.hadStarted});
  
}
