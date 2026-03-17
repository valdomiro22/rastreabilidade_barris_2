import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/usecasesproviders/produto_use_cases.dart';
import '../../domain/entities/tipo_produto_entity.dart';

part 'buscar_um_produto_notifier.g.dart';

@riverpod
class BuscarUmProdutoNotifier extends _$BuscarUmProdutoNotifier {
  @override
  Future<ProdutoEntity> build({required String produtoId}) async {
    final useCase = ref.read(getUmProdutoUseCaseProvider);
    final result = await useCase(produtoId);

    return result.fold((failure) => throw failure, (produto) => produto);
  }
}
