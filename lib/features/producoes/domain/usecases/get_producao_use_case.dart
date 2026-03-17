import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/producao_entity.dart';
import '../repository/producao_repository.dart';

class GetProducaoUseCase {
  final ProducaoRepository _repository;

  GetProducaoUseCase(this._repository);

  Future<Either<Failure, ProducaoEntity>> call({
    required String gradeId,
    required String producaoId,
  }) async {
    final producao = await _repository.getProducao(gradeId: gradeId, producaoId: producaoId);
    return producao.fold(
        (failure) => throw failure,
        (producao) {
          if (producao == null) return Left(FirestoreFailure('Produção não encontrada'));
          return Right(producao);
        }
    );
  }
}
