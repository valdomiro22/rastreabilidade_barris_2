import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/usecasesproviders/producao_use_cases.dart';
import '../../domain/entities/producao_entity.dart';

part 'producao_notifier.g.dart';

@riverpod
class ProducaoNotifier extends _$ProducaoNotifier {
  @override
  Future<List<ProducaoEntity>> build({required String gradeId}) async {
    state = const AsyncValue.loading();
    final useCase = ref.read(getAllProducoesUseCaseProvider);
    final result = await useCase(gradeId);
    return result.fold((failure) => throw failure, (lista) => lista);
  }

  Future<void> deletar({required String gradeId, required String producaoId}) async {
    final useCase = ref.read(deleteProducaoUseCaseProvider);
    final result = await useCase(gradeId: gradeId, producaoId: producaoId);

    result.fold((failure) => throw failure, (_) => ref.invalidateSelf());
  }

  Future<void> adicionar({required String gradeId, required ProducaoEntity producao}) async {
    final useCase = ref.read(insertProducaoUseCaseProvider);
    final result = await useCase(gradeId: gradeId, producao: producao);

    result.fold((failure) => throw failure, (_) => ref.invalidateSelf());
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
