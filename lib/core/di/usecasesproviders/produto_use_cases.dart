import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/produto/domain/usecases/delete_produto_use_case.dart';
import '../../../features/produto/domain/usecases/get_all_produtos_use_case.dart';
import '../../../features/produto/domain/usecases/get_um_produto_use_case.dart';
import '../../../features/produto/domain/usecases/insert_produto_use_case.dart';
import '../../../features/produto/domain/usecases/stream_produto_use_case.dart';
import '../../../features/produto/domain/usecases/update_produto_use_case.dart';
import '../firebaseproviders/firebase_providers.dart';

part 'produto_use_cases.g.dart';

@riverpod
InsertProdutoUseCase insertProdutoUseCase(Ref ref) {
  final repository = ref.read(produtoRepositoryProvider);
  return InsertProdutoUseCase(repository);
}

@riverpod
DeleteProdutoUseCase deleteProdutoUseCase(Ref ref) {
  final repository = ref.read(produtoRepositoryProvider);
  return DeleteProdutoUseCase(repository);
}

@riverpod
GetAllProdutoUseCase getAllProdutoUseCase(Ref ref) {
  final repository = ref.read(produtoRepositoryProvider);
  return GetAllProdutoUseCase(repository);
}

@riverpod
GetUmProdutoUseCase getUmProdutoUseCase(Ref ref) {
  final repository = ref.read(produtoRepositoryProvider);
  return GetUmProdutoUseCase(repository);
}

@riverpod
UpdateProdutoUseCase updateProdutoUseCase(Ref ref) {
  final repository = ref.read(produtoRepositoryProvider);
  return UpdateProdutoUseCase(repository);
}

@riverpod
StreamProdutoUseCase streamProdutoUseCase(Ref ref) {
  final repository = ref.read(produtoRepositoryProvider);
  return StreamProdutoUseCase(repository);
}
