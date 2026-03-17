import '../entities/barril_entity.dart';
import '../repositories/tipo_barril_repository.dart';

class StreamBarrilUseCase {
  final BarrilRepository _repository;

  StreamBarrilUseCase(this._repository);

  Stream<List<BarrilEntity>> call() {
    return _repository.streamBarris();
  }
}
