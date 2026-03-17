import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/tipo_produto_entity.dart';
import '../repositories/produto_repository.dart';

class InsertProdutoUseCase {
  final ProdutoRepository _repository;

  InsertProdutoUseCase(this._repository);

  Future<Either<Failure, Unit>> call(ProdutoEntity produto) async {
    final id = '${produto.nome}_${DateTime.now().millisecondsSinceEpoch}';
    final tipoConId = produto.copyWith(id: id);
    return await _repository.insertProduto(tipoConId);
  }
}