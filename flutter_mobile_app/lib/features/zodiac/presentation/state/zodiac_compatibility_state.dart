import '../../domain/entities/zodiac_compatibility.dart';

class ZodiacCompatibilityState {
  const ZodiacCompatibilityState({
    this.firstDob,
    this.secondDob,
    this.result,
    this.errorMessage,
  });

  final DateTime? firstDob;
  final DateTime? secondDob;
  final ZodiacPairResult? result;
  final String? errorMessage;

  bool get canCalculate => firstDob != null && secondDob != null;

  ZodiacCompatibilityState copyWith({
    DateTime? firstDob,
    DateTime? secondDob,
    ZodiacPairResult? result,
    String? errorMessage,
    bool clearResult = false,
    bool clearError = false,
  }) {
    return ZodiacCompatibilityState(
      firstDob: firstDob ?? this.firstDob,
      secondDob: secondDob ?? this.secondDob,
      result: clearResult ? null : (result ?? this.result),
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}
