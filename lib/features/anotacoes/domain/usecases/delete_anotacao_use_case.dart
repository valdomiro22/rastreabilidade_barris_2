import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/aotacao_repository.dart';

class DeleteAnotacaoUseCase {
  final AnotacaoRepository _repository;

  DeleteAnotacaoUseCase(this._repository);

  Future<Either<Failure, Unit>> call({
    required String anotacaoId,
  }) async {
    return await _repository.deleteAnotacao(
      anotacaoId: anotacaoId,
    );
  }
}
