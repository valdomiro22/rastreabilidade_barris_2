import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/barril_entity.dart';
import '../repositories/tipo_barril_repository.dart';

class UpdateBarrilUseCase {
  final BarrilRepository _repository;

  const UpdateBarrilUseCase(this._repository);

  Future<Either<Failure, Unit>> call({required BarrilEntity barril}) async {
    if (barril.id == null) {
      return Left(FirestoreFailure('Barril precisa ter um ID para ser atualizado'));
    }
    return await _repository.updateBarril(barril: barril, tpId: barril.id!);
  }
}
