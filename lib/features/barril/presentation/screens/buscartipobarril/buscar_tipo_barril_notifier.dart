import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/di/usecasesproviders/barril_use_cases.dart';
import '../../../domain/entities/barril_entity.dart';

part 'buscar_tipo_barril_notifier.g.dart';

@riverpod
class BuscarTipoBarrilNotifier extends _$BuscarTipoBarrilNotifier {
  @override
  AsyncValue<BarrilEntity?> build() => const AsyncValue.data(null);

  Future<void> buscar(String tpId) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final useCase = ref.read(getBarrilUseCaseProvider);
      final result = await useCase(tpId);

      return result.fold((failure) => throw failure, (tp) => tp);
    });
  }
}
