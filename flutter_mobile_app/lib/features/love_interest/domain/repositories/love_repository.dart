import '../entities/love_question.dart';
import '../entities/love_result.dart';

abstract class LoveRepository {
  List<LoveQuestion> getQuestions();

  LoveAnalysis analyzeAnswers(Map<String, int> answers);
}
