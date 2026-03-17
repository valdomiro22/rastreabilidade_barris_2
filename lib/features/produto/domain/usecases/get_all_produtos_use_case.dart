import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/tipo_produto_entity.dart';
import '../repositories/produto_repository.dart';

class GetAllProdutoUseCase {
  final ProdutoRepository _repository;

  GetAllProdutoUseCase(this._repository);

  Future<Either<Failure, List<ProdutoEntity>>> call() async {
    return _repository.getAllProdutos();
  }
}
