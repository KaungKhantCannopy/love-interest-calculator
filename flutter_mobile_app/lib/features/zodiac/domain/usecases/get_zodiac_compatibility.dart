import '../entities/zodiac_compatibility.dart';
import '../repositories/zodiac_repository.dart';

class GetZodiacCompatibility {
  const GetZodiacCompatibility(this._repository);

  final ZodiacRepository _repository;

  ZodiacPairResult call({
    required DateTime firstDob,
    required DateTime secondDob,
  }) {
    return _repository.resolveCompatibility(
      firstDob: firstDob,
      secondDob: secondDob,
    );
  }
}
