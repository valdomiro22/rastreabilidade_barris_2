import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/tipo_produto_entity.dart';
import '../repositories/produto_repository.dart';

class GetUmProdutoUseCase {
  final ProdutoRepository _repository;

  const GetUmProdutoUseCase(this._repository);

  Future<Either<Failure, ProdutoEntity>> call(String tpId) async {
    final produto = await _repository.getProduto(tpId);

    return produto.fold(
        (failure) => Left(failure),
        (produto) {
          if (produto == null) return Left(FirestoreFailure('Produto não encontrado'));

          return Right(produto);
        }
    );
  }
}
