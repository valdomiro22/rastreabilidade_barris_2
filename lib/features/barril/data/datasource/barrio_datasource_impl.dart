import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/error/exception.dart';
import '../models/barril_model.dart';
import 'barril_datasource.dart';

class BarrilDatasourceImpl implements BarrilDatasource {
  final FirebaseFirestore _firestore;

  const BarrilDatasourceImpl(this._firestore);

  final _tpBarrilCollection = 'barril';

  @override
  Future<void> insertBarril(BarrilModel barril) async {
    try {
      await _firestore.collection(_tpBarrilCollection).doc(barril.id).set(barril.toJson());
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
      throw UnexpectedException('Erro inesperado ao inserir Quantidade Horaria: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteBarril(String tpId) async {
    try {
      await _firestore.collection(_tpBarrilCollection).doc(tpId).delete();
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
      throw UnexpectedException('Erro inesperado ao deletar  Quantidade Horaria: ${e.toString()}');
    }
  }

  @override
  Future<List<BarrilModel>> getAllBarris() async {
    try {
      final snap = await _firestore.collection(_tpBarrilCollection).get();

      if (snap.docs.isEmpty) return [];

      return snap.docs.map((tp) => BarrilModel.fromJson(tp.data())).toList();
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
        'datasource -> Erro inesperado ao buscar Quantidades Horarias: ${e.toString()}',
      );
    }
  }

  @override
  Stream<List<BarrilModel>> streamBarris() {
    return _firestore
        .collection(_tpBarrilCollection)
        .snapshots()
        .map((querySnap) {
          // se não tiver docs, isso já vira []
          return querySnap.docs.map((doc) => BarrilModel.fromJson(doc.data())).toList();
        })
        .handleError((error, stack) {
          if (error is FirebaseException) {
            switch (error.code) {
              case 'permission-denied':
                throw FirestoreException('Permissão negada para ler os tipos de barril');
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
            'datasource -> Erro inesperado ao buscar s de Barril: ${error.toString()}',
          );
        });
  }

  @override
  Future<BarrilModel?> getBarril(String tpId) async {
    try {
      final snap = await _firestore.doc(tpId).get();

      if (!snap.exists) return null;

      return BarrilModel.fromJson(snap.data()!);
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
      throw UnexpectedException('Erro inesperado ao buscar Quantidade Horaria: ${e.toString()}');
    }
  }

  @override
  Future<void> updateBarril({required BarrilModel barril, required String tpId}) async {
    try {
      await _firestore
          .collection(_tpBarrilCollection)
          .doc(tpId)
          .set(barril.toJson(), SetOptions(merge: true));
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
      throw UnexpectedException('Erro inesperado ao atualizar Quantidade Horaria: ${e.toString()}');
    }
  }
}
