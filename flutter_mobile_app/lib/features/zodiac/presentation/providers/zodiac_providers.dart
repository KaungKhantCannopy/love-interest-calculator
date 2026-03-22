import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/zodiac_repository_impl.dart';
import '../../domain/repositories/zodiac_repository.dart';
import '../../domain/usecases/get_zodiac_compatibility.dart';
import '../state/zodiac_compatibility_controller.dart';
import '../state/zodiac_compatibility_state.dart';

final zodiacRepositoryProvider = Provider<ZodiacRepository>((ref) {
  return ZodiacRepositoryImpl();
});

final getZodiacCompatibilityProvider = Provider<GetZodiacCompatibility>((ref) {
  return GetZodiacCompatibility(ref.watch(zodiacRepositoryProvider));
});

final zodiacCompatibilityControllerProvider =
    StateNotifierProvider.autoDispose<
      ZodiacCompatibilityController,
      ZodiacCompatibilityState
    >((ref) {
      final useCase = ref.watch(getZodiacCompatibilityProvider);
      return ZodiacCompatibilityController(useCase);
    });
