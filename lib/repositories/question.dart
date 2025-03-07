import 'package:actpod_mental_test/entities/question.dart';

class QuestionRepository {
  final List<Question> questions = [
    Question(
      "1.如果可以選擇一樣魔法道具隨身攜帶，你會選擇？", 
      [
        Option("A. 隨時跟在你身邊的使魔寵物", -2, 3), 
        Option("B. 會把所有觸碰者關進另一個次元空間的鏡子", 1, 2), 
        Option("C. 能偵測危險能量並將其驅散的魔杖", -2, 3),
      ]
    ),
    Question(
      "2.你發現自己來到一個陌生區域，你比較希望這裡是？", 
      [
        Option("A. 會讓人忍不住開始玩耍的棉花糖樂園", -4, -2), 
        Option("B. 有一座清涼瀑布的幽靜峽谷", -1, 5), 
        Option("C. 讓人失去部分重力的神秘星球", 5, -2),
      ]
    ),
    Question(
      "3.你遇到了一個攻擊你的怪物，它最有可能是？", 
      [
        Option("A. 移動迅速且會製造分身的鬼火", -2, 5), 
        Option("B. 會複製你的招式來反擊你的人偶", 3, 0), 
        Option("C. 會跑到夢境裡的百變怪獸", 2, 0),
      ]
    ),
    Question(
      "4.你發現你的道具有一個被封印的功能，那個功能會是？", 
      [
        Option("A. 可以連結你的大腦變出相應的物品", -4, 0), 
        Option("B. 必須一字不漏唸出特定咒語才能張開的防護盾", 4, -2), 
        Option("C. 能量充足時可以變出分身", -2, 5),
      ]
    ),
    Question(
      "5.來到這座森林的人，都必須達成一個最終任務才能回去，你的任務會是？", 
      [
        Option("A. 找到另一個修行者並組隊打敗攻擊你們兩人的怪獸", 0, -1), 
        Option("B. 找到並破解一處密室機關", 1, 4), 
        Option("C. 躲避怪獸的攻擊並存活72小時", 6, 0),
      ]
    ),
  ];

  QuestionRepository();

  List<Question> getQuestions() {
    return questions;
  }
}