import 'package:hive/hive.dart';

part 'quiz_model.g.dart';

@HiveType(typeId: 3)
class Quiz{

  @HiveField(0)
  int idQuiz;
  @HiveField(1)
  String contextQuiz;
  @HiveField(2)
  String result;
  @HiveField(3)
  int priority;

  Quiz({
    this.idQuiz,
    this.contextQuiz,
    this.result,
    this.priority,
  });

}

List<String> listSubQuiz = [
  "1", "2", "3", "4", "5",
  "6", "7", "8", "9", "10",
  "11", "12", "13", "14", "15",
  "16", "17", "18", "19", "20",
  "21", "22", "23", "24", "25",
];