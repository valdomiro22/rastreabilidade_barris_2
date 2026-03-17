import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/anotacao_entity.dart';
import '../repositories/aotacao_repository.dart';

class GetAnotacaoUseCase {
  final AnotacaoRepository _repository;

  GetAnotacaoUseCase(this._repository);

  Future<Either<Failure, AnotacaoEntity>> call({required String anotacaoId}) async {
    final result = await _repository.getAnotacao(anotacaoId: anotacaoId);

    return result.fold((failure) => Left(failure), (anotacao) {
      if (anotacao == null) return Left(FirestoreFailure('Anotação não encontrada'));
      return Right(anotacao);
    });
  }
}
