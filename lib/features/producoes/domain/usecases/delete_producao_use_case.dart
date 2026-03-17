import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repository/producao_repository.dart';

class DeleteProducaoUseCase {
  final ProducaoRepository _repository;

  DeleteProducaoUseCase(this._repository);

  Future<Either<Failure, Unit>> call({required String gradeId, required String producaoId}) async {
    return _repository.deleteProducao(gradeId: gradeId, producaoId: producaoId);
  }
}
