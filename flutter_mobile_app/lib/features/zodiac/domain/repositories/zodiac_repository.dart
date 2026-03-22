import '../entities/zodiac_compatibility.dart';

abstract class ZodiacRepository {
  ZodiacPairResult resolveCompatibility({
    required DateTime firstDob,
    required DateTime secondDob,
  });
}
