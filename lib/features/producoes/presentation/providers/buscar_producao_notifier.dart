import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/usecasesproviders/producao_use_cases.dart';
import '../../domain/entities/producao_entity.dart';

part 'buscar_producao_notifier.g.dart';

@riverpod
class BuscarProducao extends _$BuscarProducao {
  @override
  Future<ProducaoEntity> build({required String gradeId, required String producaoId}) async {
    final useCase = ref.read(getProducaoUseCaseProvider);

    final result = await useCase(gradeId: gradeId, producaoId: producaoId);

    return result.fold((failure) => throw failure, (producao) => producao);
  }

  Future<void> atualizar({
    required ProducaoEntity producao,
    required String gradeId,
    required String producaoId,
  }) async {
    final useCase = ref.read(updateProducaoUseCaseProvider);
    final result = await useCase(gradeId: gradeId, producao: producao, producaoId: producaoId);

    result.fold((failure) => throw failure, (_) => ref.invalidateSelf());
  }
}
