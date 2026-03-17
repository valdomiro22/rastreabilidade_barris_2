import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/tipo_barril_repository.dart';

class DeleteBarrilUseCase {
  final BarrilRepository _repository;

  const DeleteBarrilUseCase(this._repository);

  Future<Either<Failure, Unit>> call(String tpId) async {
    return await _repository.deleteBarril(tpId);
  }
}
