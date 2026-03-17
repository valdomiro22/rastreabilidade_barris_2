import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/anotacao_entity.dart';
import '../repositories/aotacao_repository.dart';

class UpdateAnotacaoUseCase {
  final AnotacaoRepository _repository;

  UpdateAnotacaoUseCase(this._repository);

  Future<Either<Failure, Unit>> call({
    required AnotacaoEntity anotacao,
  }) async {
    return await _repository.updateAnotacao(
      anotacao: anotacao,
    );
  }
}
