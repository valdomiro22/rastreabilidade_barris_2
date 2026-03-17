import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/barril_entity.dart';

abstract class BarrilRepository {
  Future<Either<Failure, Unit>> insertBarril(BarrilEntity barril);

  Future<Either<Failure, Unit>> updateBarril({
    required BarrilEntity barril,
    required String tpId,
  });

  Future<Either<Failure, BarrilEntity?>> getBarril(String tpId);

  Future<Either<Failure, Unit>> deleteBarril(String tpId);

  Future<Either<Failure, List<BarrilEntity>>> getAllBarrils();

  Stream<List<BarrilEntity>> streamBarris();
}
