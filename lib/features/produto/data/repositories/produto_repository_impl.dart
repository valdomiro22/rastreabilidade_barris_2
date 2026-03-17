import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/tipo_produto_entity.dart';
import '../../domain/repositories/produto_repository.dart';
import '../datasource/produto_datasource.dart';
import '../mapper/produto_mapper.dart';

class ProdutoRepositoryImpl implements ProdutoRepository {
  final ProdutoDatasource _datasource;

  const ProdutoRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, Unit>> insertProduto(ProdutoEntity produto) async {
    try {
      final model = produto.toModel();

      if (produto.id == null) {
        return Left(UnexpectedFailure('TipoBarrilRepository -> id não pode ser null'));
      }

      await _datasource.insertProduto(model);
      return const Right(unit);
    } on FirestoreException catch (e) {
      return Left(FirestoreFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Erro inesperado ao salvar Tipo de Produto: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProduto(String tpId) async {
    try {
      await _datasource.deleteProduto(tpId);
      return const Right(unit);
    } on FirestoreException catch (e) {
      return Left(FirestoreFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Erro inesperado ao salvar Tipo de Produto: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ProdutoEntity>>> getAllProdutos() async {
    try {
      final listaModels = await _datasource.getAllProdutos();
      final listaEntities = listaModels.map((vl) => vl.toEntity()).toList();

      return Right(listaEntities);
    } on FirestoreException catch (e) {
      return Left(FirestoreFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Erro inesperado ao salvar Tipo de Produto: $e'));
    }
  }

  @override
  Future<Either<Failure, ProdutoEntity?>> getProduto(String tpId) async {
    try {
      final model = await _datasource.getProduto(tpId);

      if (model == null) return const Right(null);

      final entity = model.toEntity();

      return Right(entity);
    } on FirestoreException catch (e) {
      return Left(FirestoreFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Erro inesperado ao salvar Tipo de Produto: $e'));
    }
  }

  @override
  Stream<List<ProdutoEntity>> streamProdutos() {
    return _datasource.streamProduto().map((models) => models.map((m) => m.toEntity()).toList());
  }

  @override
  Future<Either<Failure, Unit>> updateProduto({
    required ProdutoEntity produto,
    required String tpId,
  }) async {
    try {
      if (produto.id == null) {
        return const Left(UnexpectedFailure('TipoBarrilRepository -> id não pode ser null'));
      }
      if (tpId.trim().isEmpty) {
        return const Left(UnexpectedFailure('TipoBarrilRepository -> tpId não pode estar vazio'));
      }

      final model = produto.toModel();
      await _datasource.updateProduto(produto: model, tpId: tpId);

      _datasource.updateProduto(produto: model, tpId: tpId);
      // _datasource.up
      return const Right(unit);
    } on FirestoreException catch (e) {
      return Left(FirestoreFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Erro inesperado ao salvar Tipo de Produto: $e'));
    }
  }
}
