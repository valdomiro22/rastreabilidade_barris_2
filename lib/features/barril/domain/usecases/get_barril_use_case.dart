import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/barril_entity.dart';
import '../repositories/tipo_barril_repository.dart';

class GetBarrilUseCase {
  final BarrilRepository _repository;

  const GetBarrilUseCase(this._repository);

  Future<Either<Failure, BarrilEntity>> call(String tpId) async {
    final barril = await _repository.getBarril(tpId);

    return barril.fold(
        (failure) => Left(failure),
        (barril) {
          if (barril == null) return Left(FirestoreFailure('Barril não encontrado'));
          return Right(barril);
        }
    );
  }
}
