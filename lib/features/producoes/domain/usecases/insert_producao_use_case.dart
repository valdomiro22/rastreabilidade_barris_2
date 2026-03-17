import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/error/failure.dart';
import '../entities/producao_entity.dart';
import '../repository/producao_repository.dart';

class InsertProducaoUseCase {
  final ProducaoRepository _repository;

  InsertProducaoUseCase(this._repository);

  Future<Either<Failure, Unit>> call({
    required String gradeId,
    required ProducaoEntity producao,
  }) async {
    final idGerado = const Uuid().v4();

    final producaoEditada = producao.copyWith(id: idGerado);

    return await _repository.insertProducao(producao: producaoEditada, gradeId: gradeId);
  }
}
