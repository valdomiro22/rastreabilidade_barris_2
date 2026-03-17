import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/producao_entity.dart';

abstract class ProducaoRepository {
  Future<Either<Failure, Unit>> insertProducao({
    required ProducaoEntity producao,
    required String gradeId,
  });

  Future<Either<Failure, Unit>> updateProducao({
    required ProducaoEntity producao,
    required String producaoId,
    required String gradeId,
  });

  Future<Either<Failure, ProducaoEntity?>> getProducao({
    required String gradeId,
    required String producaoId,
  });

  Future<Either<Failure, Unit>> deleteProducao({
    required String gradeId,
    required String producaoId,
  });

  Future<Either<Failure, List<ProducaoEntity>>> getAllProducoes(String gradeId);
}
