import '../models/produto_model.dart';

abstract class ProdutoDatasource {
  Future<void> insertProduto(ProdutoModel produto);

  Future<void> updateProduto({required ProdutoModel produto, required String tpId});

  Future<ProdutoModel?> getProduto(String tpId);

  Future<void> deleteProduto(String tpId);

  Future<List<ProdutoModel>> getAllProdutos();

  Stream<List<ProdutoModel>> streamProduto();
}
