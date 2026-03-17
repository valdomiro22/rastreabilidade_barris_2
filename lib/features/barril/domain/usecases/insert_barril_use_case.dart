import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/barril_entity.dart';
import '../repositories/tipo_barril_repository.dart';

class InsertBarrilUseCase {
  final BarrilRepository _repository;

  InsertBarrilUseCase(this._repository);

  Future<Either<Failure, Unit>> call(BarrilEntity barril) async {
    final id = '${barril.nome}_${barril.volume}_${DateTime.now().millisecondsSinceEpoch}';

    final tpComId = barril.copyWith(id: id);
    return await _repository.insertBarril(tpComId);
  }
}
