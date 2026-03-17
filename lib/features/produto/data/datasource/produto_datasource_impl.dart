import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rastreabilidade_barris/features/produto/data/datasource/produto_datasource.dart';

import '../../../../core/error/exception.dart';
import '../models/produto_model.dart';

class ProdutoDatasourceImpl implements ProdutoDatasource {
  final FirebaseFirestore _firestore;

  const ProdutoDatasourceImpl(this._firestore);

  final _produtoCollection = 'produto';

  @override
  Future<void> insertProduto(ProdutoModel produto) async {
    try {
      await _firestore
          .collection(_produtoCollection)
          .doc(produto.id)
          .set(produto.toJson());
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'permission-denied':
          throw FirestoreException('Permissão negada nas regras do Firestore');
        case 'unavailable':
        case 'deadline-exceeded':
          throw NetworkException('Problema de conexão ou serviço indisponível');
        case 'already-exists':
          throw FirestoreException('Esta grade já existe');
        case 'not-found':
          throw FirestoreException('Coleção ou documento não encontrado');
        case 'resource-exhausted':
          throw UnexpectedException('Limite de uso do Firestore excedido');
        case 'unauthenticated':
          throw AuthException('Usuário não autenticado');
        case 'invalid-argument':
          throw FirestoreException('Dados inválidos enviados');
        default:
          throw FirestoreException(e.message ?? 'Erro no Firestore: ${e.code}');
      }
    } catch (e) {
      throw UnexpectedException('Erro inesperado ao inserir produto: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteProduto(String tpId) async {
    try {
      await _firestore.collection(_produtoCollection).doc(tpId).delete();
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'permission-denied':
          throw FirestoreException('Permissão negada nas regras do Firestore');
        case 'unavailable':
        case 'deadline-exceeded':
          throw NetworkException('Problema de conexão ou serviço indisponível');
        case 'resource-exhausted':
          throw UnexpectedException('Limite de uso do Firestore excedido');
        case 'unauthenticated':
          throw AuthException('Usuário não autenticado');
        case 'invalid-argument':
          throw FirestoreException('ID inválido para exclusão');
        default:
          throw FirestoreException(e.message ?? 'Erro ao deletar no Firestore: ${e.code}');
      }
    } catch (e) {
      throw UnexpectedException('Erro inesperado ao deletar  produto: ${e.toString()}');
    }
  }

  @override
  Future<List<ProdutoModel>> getAllProdutos() async {
    try {
      final snap = await _firestore.collection(_produtoCollection).get();

      if (snap.docs.isEmpty) return [];

      return snap.docs.map((tp) => ProdutoModel.fromJson(tp.data())).toList();
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'permission-denied':
          throw FirestoreException('Permissão negada para ler as produções');
        case 'unavailable':
        case 'deadline-exceeded':
          throw NetworkException('Problema de conexão ou serviço indisponível');
        case 'resource-exhausted':
          throw UnexpectedException('Limite de quota do Firestore excedido');
        case 'unauthenticated':
          throw AuthException('Usuário não autenticado');
        case 'invalid-argument':
          throw FirestoreException('Argumentos inválidos na consulta');
        default:
          throw FirestoreException(e.message ?? 'Erro ao buscar dados: ${e.code}');
      }
    } catch (e) {
      throw UnexpectedException(
        'datasource -> Erro inesperado ao buscar produto: ${e.toString()}',
      );
    }
  }

  @override
  Future<ProdutoModel?> getProduto(String tpId) async {
    try {
      final snap = await _firestore.doc(tpId).get();

      if (!snap.exists) return null;

      return ProdutoModel.fromJson(snap.data()!);
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'permission-denied':
          throw FirestoreException('Permissão negada para ler esta produção');
        case 'unavailable':
        case 'deadline-exceeded':
          throw NetworkException('Problema de conexão ou serviço indisponível');
        case 'resource-exhausted':
          throw UnexpectedException('Limite de quota do Firestore excedido');
        case 'unauthenticated':
          throw AuthException('Usuário não autenticado');
        case 'invalid-argument':
          throw FirestoreException('ID inválido para busca');
        default:
          throw FirestoreException(e.message ?? 'Erro ao buscar produção: ${e.code}');
      }
    } catch (e) {
      throw UnexpectedException('Erro inesperado ao buscar produto: ${e.toString()}');
    }
  }

  @override
  Stream<List<ProdutoModel>> streamProduto() {
    return _firestore
        .collection(_produtoCollection)
        .snapshots()
        .map((querySnap) {
          // se não tiver docs, isso já vira []
          return querySnap.docs.map((doc) => ProdutoModel.fromJson(doc.data())).toList();
        })
        .handleError((error, stack) {
          if (error is FirebaseException) {
            switch (error.code) {
              case 'permission-denied':
                throw FirestoreException('Permissão negada para ler os tipos de produto');
              case 'unavailable':
              case 'deadline-exceeded':
                throw NetworkException('Problema de conexão ou serviço indisponível');
              case 'resource-exhausted':
                throw UnexpectedException('Limite de quota do Firestore excedido');
              case 'unauthenticated':
                throw AuthException('Usuário não autenticado');
              case 'invalid-argument':
                throw FirestoreException('Argumentos inválidos na consulta');
              default:
                throw FirestoreException(error.message ?? 'Erro ao buscar dados: ${error.code}');
            }
          }
          throw UnexpectedException(
            'datasource -> Erro inesperado ao buscar Tipos de Produto: ${error.toString()}',
          );
        });
  }

  @override
  Future<void> updateProduto({required ProdutoModel produto, required String tpId}) async {
    try {
      await _firestore
          .collection(_produtoCollection)
          .doc(tpId)
          .set(produto.toJson(), SetOptions(merge: true));
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'permission-denied':
          throw FirestoreException('Permissão negada para atualizar esta produção');
        case 'not-found':
          throw FirestoreException('Produção não encontrada para atualização');
        case 'unavailable':
        case 'deadline-exceeded':
          throw NetworkException('Problema de conexão ou serviço indisponível');
        case 'resource-exhausted':
          throw UnexpectedException('Limite de quota do Firestore excedido');
        case 'unauthenticated':
          throw AuthException('Usuário não autenticado');
        case 'invalid-argument':
          throw FirestoreException('Dados ou ID inválidos para atualização');
        default:
          throw FirestoreException(e.message ?? 'Erro ao atualizar produção: ${e.code}');
      }
    } catch (e) {
      throw UnexpectedException('Erro inesperado ao atualizar produto: ${e.toString()}');
    }
  }
}
