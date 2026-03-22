import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/usecases/get_zodiac_compatibility.dart';
import 'zodiac_compatibility_state.dart';

class ZodiacCompatibilityController
    extends StateNotifier<ZodiacCompatibilityState> {
  ZodiacCompatibilityController(this._getZodiacCompatibility)
    : super(const ZodiacCompatibilityState());

  final GetZodiacCompatibility _getZodiacCompatibility;

  void setFirstDob(DateTime date) {
    state = state.copyWith(
      firstDob: _dateOnly(date),
      clearResult: true,
      clearError: true,
    );
  }

  void setSecondDob(DateTime date) {
    state = state.copyWith(
      secondDob: _dateOnly(date),
      clearResult: true,
      clearError: true,
    );
  }

  void calculate() {
    if (!state.canCalculate) {
      state = state.copyWith(
        errorMessage: 'Please choose both dates of birth.',
      );
      return;
    }

    final now = _dateOnly(DateTime.now());
    if (state.firstDob!.isAfter(now) || state.secondDob!.isAfter(now)) {
      state = state.copyWith(
        errorMessage: 'Dates of birth cannot be in the future.',
      );
      return;
    }

    final result = _getZodiacCompatibility(
      firstDob: state.firstDob!,
      secondDob: state.secondDob!,
    );

    state = state.copyWith(result: result, clearError: true);
  }

  DateTime _dateOnly(DateTime value) =>
      DateTime(value.year, value.month, value.day);
}
