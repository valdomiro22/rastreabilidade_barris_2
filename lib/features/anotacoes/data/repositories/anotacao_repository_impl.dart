import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entity/anotacao_entity.dart';
import '../../domain/repositories/aotacao_repository.dart';
import '../datasources/anotacao_datasource.dart';
import '../mapper/anotacao_mapper.dart';

class AnotacaoRepositoryImpl implements AnotacaoRepository {
  final AnotacaoDatasource _datasource;

  AnotacaoRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, Unit>> insertAnotacao({required AnotacaoEntity anotacao}) async {
    try {
      final model = anotacao.toModel();
      await _datasource.insertAnotacao(anotacao: model);
      return const Right(unit);
    } on FirestoreException catch (e) {
      return Left(FirestoreFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Erro inesperado ao inserir producao: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAnotacao({required String anotacaoId}) async {
    try {
      await _datasource.deleteAnotacao(anotacaoId: anotacaoId);
      return const Right(unit);
    } on FirestoreException catch (e) {
      return Left(FirestoreFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Erro inesperado ao inserir producao: $e'));
    }
  }

  @override
  Future<Either<Failure, List<AnotacaoEntity>>> getAllAnotacoes({
    required String producaoId,
  }) async {
    try {
      final result = await _datasource.getAllAnotacoes(producaoId: producaoId);
      final listEntities = result.map((nota) => nota.toEntity()).toList();
      return Right(listEntities);
    } on FirestoreException catch (e) {
      return Left(FirestoreFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Erro inesperado ao inserir producao: $e'));
    }
  }

  @override
  Future<Either<Failure, AnotacaoEntity?>> getAnotacao({required String anotacaoId}) async {
    try {
      final result = await _datasource.getAnotacao(anotacaoId: anotacaoId);

      if (result == null) return const Right(null);

      final listEntities = result.toEntity();
      return Right(listEntities);
    } on FirestoreException catch (e) {
      return Left(FirestoreFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Erro inesperado ao inserir producao: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateAnotacao({required AnotacaoEntity anotacao}) async {
    try {
      final model = anotacao.toModel();
      await _datasource.updateAnotacao(anotacao: model);
      return const Right(unit);
    } on FirestoreException catch (e) {
      return Left(FirestoreFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Erro inesperado ao inserir producao: $e'));
    }
  }
}
