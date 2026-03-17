import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/barril_entity.dart';
import '../repositories/tipo_barril_repository.dart';

class GetAllBarrilsUseCase {
  final BarrilRepository _repository;

  const GetAllBarrilsUseCase(this._repository);

  Future<Either<Failure, List<BarrilEntity>>> call() async {
    return await _repository.getAllBarrils();
  }
}
