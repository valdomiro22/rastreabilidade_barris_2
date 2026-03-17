import 'dart:developer' as dev;

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/usecasesproviders/produto_use_cases.dart';
import '../../domain/entities/tipo_produto_entity.dart';

part 'produto_notifier.g.dart';

@riverpod
class ProdutoNotifier extends _$ProdutoNotifier {
  @override
  Future<List<ProdutoEntity>> build() async {
    final useCase = ref.read(getAllProdutoUseCaseProvider);
    final result = await useCase();
    return result.fold((failure) => throw failure, (lista) => lista);
  }

  Future<void> deletar({required String produtoId}) async {
    final useCase = ref.read(deleteProdutoUseCaseProvider);
    final result = await useCase(produtoId);

    result.fold((failure) => throw failure, (_) => ref.invalidateSelf());
  }

  Future<void> adicionar(ProdutoEntity produto) async {
    final useCase = ref.read(insertProdutoUseCaseProvider);
    final result = await useCase(produto);

    result.fold((failure) => throw failure, (_) => ref.invalidateSelf());
  }

  Future<void> atualizar(ProdutoEntity produto) async {
    final useCase = ref.read(updateProdutoUseCaseProvider);
    final result = await useCase(produto: produto);

    result.fold((failure) => throw failure, (_) => ref.invalidateSelf());
  }
}
