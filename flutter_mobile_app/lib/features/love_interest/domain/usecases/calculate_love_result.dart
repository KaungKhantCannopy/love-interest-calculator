import '../entities/love_result.dart';
import '../repositories/love_repository.dart';

class CalculateLoveResult {
  const CalculateLoveResult(this._repository);

  final LoveRepository _repository;

  LoveAnalysis call(Map<String, int> answers) {
    return _repository.analyzeAnswers(answers);
  }
}
