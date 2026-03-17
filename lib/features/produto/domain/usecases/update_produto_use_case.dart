import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/tipo_produto_entity.dart';
import '../repositories/produto_repository.dart';

class UpdateProdutoUseCase {
  final ProdutoRepository _repository;

  UpdateProdutoUseCase(this._repository);

  Future<Either<Failure, Unit>> call({required ProdutoEntity produto}) async {
    if (produto.id == null) {
      return Left(FirestoreFailure('Produto precisa ter um ID para ser atualizado'));
    }
    return _repository.updateProduto(produto: produto, tpId: produto.id!);
  }
}
