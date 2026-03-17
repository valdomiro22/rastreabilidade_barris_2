import '../entities/tipo_produto_entity.dart';
import '../repositories/produto_repository.dart';

class StreamProdutoUseCase {
  final ProdutoRepository _repository;

  StreamProdutoUseCase(this._repository);

  Stream<List<ProdutoEntity>> call() {
    return _repository.streamProdutos();
  }
}
