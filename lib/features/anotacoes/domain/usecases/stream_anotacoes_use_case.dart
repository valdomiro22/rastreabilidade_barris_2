import '../entity/anotacao_entity.dart';
import '../repositories/aotacao_repository.dart';

class StreamAnotacoesUseCase {
  final AnotacaoRepository _repository;

  StreamAnotacoesUseCase(this._repository);

  Stream<List<AnotacaoEntity>> call({required String producaoId}) {
    return _repository.streamAnotacoesDaProducao(producaoId: producaoId);
  }
}
