import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/di/usecasesproviders/barril_use_cases.dart';
import '../../../domain/entities/barril_entity.dart';

part 'buscar_um_barril_notifier.g.dart';

@riverpod
class BuscarUmBarrilNotifier extends _$BuscarUmBarrilNotifier {
  @override
  Future<BarrilEntity> build({required String barrilId}) async {
    final useCase = ref.read(getBarrilUseCaseProvider);
    final result = await useCase(barrilId);

    return result.fold(
        (failure) => throw failure,
        (barril) {

          return barril;
        }
    );
  }
}