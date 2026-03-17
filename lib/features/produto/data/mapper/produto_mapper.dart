import '../../domain/entities/tipo_produto_entity.dart';
import '../models/produto_model.dart';

extension ProdutoModelToEntity on ProdutoModel {
  ProdutoEntity toEntity() {
    return ProdutoEntity(id: id, nome: nome, prazoValidade: prazoValidade);
  }
}

extension ProdutoEntityToModel on ProdutoEntity {
  ProdutoModel toModel() {
    return ProdutoModel(id: id, nome: nome, prazoValidade: prazoValidade);
  }
}
