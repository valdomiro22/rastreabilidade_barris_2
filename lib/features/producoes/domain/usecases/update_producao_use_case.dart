import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/producao_entity.dart';
import '../repository/producao_repository.dart';

class UpdateProducaoUseCase {
  final ProducaoRepository _repository;

  UpdateProducaoUseCase(this._repository);

  Future<Either<Failure, Unit>> call({
    required ProducaoEntity producao,
    required String gradeId,
    required String producaoId,
  }) async {
    if (producao.id == null) {
      return Left(FirestoreFailure('Produção tem que ter um ID para ser atualizada'));
    }

    return _repository.updateProducao(
      producao: producao,
      producaoId: producaoId,
      gradeId: gradeId,
    );
  }
}
