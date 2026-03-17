import 'package:rastreabilidade_barris/core/di/usecasesproviders/anotacao_use_cases.dart';
import 'package:rastreabilidade_barris/features/anotacoes/domain/entity/anotacao_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'anotacao_notifier.g.dart';

@riverpod
class AnotacaoNotifier extends _$AnotacaoNotifier {
  @override
  Future<List<AnotacaoEntity>> build({required String producaoId}) async {
    final useCase = ref.read(getAllAnotacoesUseCaseProvider);
    final result = await useCase(producaoId: producaoId);
    return result.fold((failure) => throw failure, (lista) => lista);
  }

  Future<void> delete({required String anotacaoId}) async {
    final useCase = ref.read(deleteAnotacaoUseCaseProvider);
    final result = await useCase(anotacaoId: anotacaoId);
    return result.fold((failure) => throw failure, (_) => ref.invalidateSelf());
  }

  Future<void> adicionar({required AnotacaoEntity anotacao}) async {
    final useCase = ref.read(insertAnotacaoUseCaseProvider);
    final result = await useCase(anotacao: anotacao);
    return result.fold((failure) => throw failure, (_) => ref.invalidateSelf());
  }

  Future<void> atualizar({required AnotacaoEntity anotacao}) async {
    final useCase = ref.read(updateAnotacaoUseCaseProvider);
    final result = await useCase(anotacao: anotacao);
    return result.fold((failure) => throw failure, (_) => ref.invalidateSelf());
  }
}