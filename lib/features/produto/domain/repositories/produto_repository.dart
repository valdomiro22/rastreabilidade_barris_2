import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/tipo_produto_entity.dart';

abstract class ProdutoRepository {
  Future<Either<Failure, Unit>> insertProduto(ProdutoEntity produto);

  Future<Either<Failure, Unit>> updateProduto({
    required ProdutoEntity produto,
    required String tpId,
  });

  Future<Either<Failure, ProdutoEntity?>> getProduto(String tpId);

  Future<Either<Failure, Unit>> deleteProduto(String tpId);

  Future<Either<Failure, List<ProdutoEntity>>> getAllProdutos();

  Stream<List<ProdutoEntity>> streamProdutos();
}
