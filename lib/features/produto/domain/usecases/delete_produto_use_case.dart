import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/produto_repository.dart';

class DeleteProdutoUseCase {
  final ProdutoRepository _repository;

  DeleteProdutoUseCase(this._repository);

  Future<Either<Failure, Unit>> call(String tpId) async {
    return await _repository.deleteProduto(tpId);
  }
}