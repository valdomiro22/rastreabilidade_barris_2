import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/anotacao_entity.dart';
import '../repositories/aotacao_repository.dart';

class GetAllAnotacoesUseCase {
  final AnotacaoRepository _repository;

  GetAllAnotacoesUseCase(this._repository);

  Future<Either<Failure, List<AnotacaoEntity>>> call({
    required String producaoId,
  }) async {
    return await _repository.getAllAnotacoes(producaoId: producaoId);
  }
}
