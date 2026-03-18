import 'dart:developer' as dev;

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/error/exception.dart';
import '../models/anotacao_model.dart';
import 'anotacao_datasource.dart';

class AnotacaoDatasourceImpl implements AnotacaoDatasource {
  final FirebaseFirestore _firestore;

  AnotacaoDatasourceImpl(this._firestore);

  final _anotacoesCollection = 'anotacoes';

  @override
  Future<void> insertAnotacao({required AnotacaoModel anotacao}) async {
    try {
      await _firestore.collection(_anotacoesCollection).doc(anotacao.id).set(anotacao.toJson());
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
      throw UnexpectedException('Erro inesperado ao inserir anotacao: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteAnotacao({required String anotacaoId}) async {
    try {
      await _firestore.collection(_anotacoesCollection).doc(anotacaoId).delete();
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
      throw UnexpectedException('Erro inesperado ao deletar anotacao: ${e.toString()}');
    }
  }

  @override
  Future<List<AnotacaoModel>> getAllAnotacoes({required String producaoId}) async {
    // dev.log('producaoId recebido: $producaoId');

    try {
      final snapshot = await _firestore
          .collection(_anotacoesCollection)
          .where('producaoId', isEqualTo: producaoId)
          .orderBy('data', descending: true)
          .orderBy('horario', descending: true)
          .get();

      if (snapshot.docs.isEmpty) return [];

      return snapshot.docs.map((doc) => AnotacaoModel.fromJson(doc.data())).toList();
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'permission-denied':
          throw FirestoreException('Permissão negada para ler os anotacao');
        case 'unavailable':
        case 'failed-precondition':
          throw FirestoreException(
            'Índice composto necessário para esta consulta. Crie o índice no Firebase Console usando o link do log: ${e.message}',
          );
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
        'datasource -> Erro inesperado ao buscar anotacoes: ${e.toString()}',
      );
    }
  }

  @override
  Future<AnotacaoModel?> getAnotacao({required String anotacaoId}) async {
    try {
      final snapshot = await _firestore.collection(_anotacoesCollection).doc(anotacaoId).get();

      if (!snapshot.exists) return null;

      return AnotacaoModel.fromJson(snapshot.data()!);
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'permission-denied':
          throw FirestoreException('Permissão negada para atualizar esta anotacao');
        case 'not-found':
          throw FirestoreException('Usuario não encontrada para atualização');
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
          throw FirestoreException(e.message ?? 'Erro ao atualizar anotacao: ${e.code}');
      }
    } catch (e) {
      throw UnexpectedException('Erro inesperado ao atualizar anotacao: ${e.toString()}');
    }
  }

  @override
  Future<void> updateAnotacao({required AnotacaoModel anotacao}) async {
    try {
      dev.log('chegou no datasource. id: ${anotacao.id}');
      dev.log('Payload da atualização: ${anotacao.toJson()}');
      await _firestore.collection(_anotacoesCollection).doc(anotacao.id).update(anotacao.toJson());
      dev.log('chegou no datasource. Deu certo');
      // await _firestore.collection(_anotacoesCollection).doc(anotacaoId).set(anotacao.toJson());
    } on FirebaseException catch (e) {
      dev.log('chegou no datasource. Deu erro no firebase');
      switch (e.code) {
        case 'permission-denied':
          throw FirestoreException('Permissão negada para atualizar esta anotacao');
        case 'not-found':
          throw FirestoreException('Usuario não encontrada para atualização');
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
          throw FirestoreException(e.message ?? 'Erro ao atualizar anotacao: ${e.code}');
      }
    } catch (e) {
      dev.log('chegou no datasource. Deu erro qualquer');
      throw UnexpectedException('Erro inesperado ao atualizar anotacao: ${e.toString()}');
    }
  }
}
