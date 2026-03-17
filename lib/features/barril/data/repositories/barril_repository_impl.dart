import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../domain/entities/barril_entity.dart';
import '../../domain/repositories/tipo_barril_repository.dart';
import '../datasource/barril_datasource.dart';
import '../mapper/barril_mapper.dart';

class BarrilRepositoryImpl implements BarrilRepository {
  final BarrilDatasource _datasource;

  const BarrilRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, Unit>> insertBarril(BarrilEntity barril) async {
    try {
      final model = barril.toModel();

      if (barril.id == null) {
        return Left(UnexpectedFailure('BarrilRepository -> id não pode ser null'));
      }

      await _datasource.insertBarril(model);
      return const Right(unit);
    } on FirestoreException catch (e) {
      return Left(FirestoreFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Erro inesperado ao salvar Tipo de Barrils: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteBarril(String tpId) async {
    try {
      await _datasource.deleteBarril(tpId);
      return const Right(unit);
    } on FirestoreException catch (e) {
      return Left(FirestoreFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Erro inesperado ao salvar Tipo de Barrils: $e'));
    }
  }

  @override
  Future<Either<Failure, List<BarrilEntity>>> getAllBarrils() async {
    try {
      final listaModels = await _datasource.getAllBarris();
      final listaEntities = listaModels.map((vl) => vl.toEntity()).toList();

      return Right(listaEntities);
    } on FirestoreException catch (e) {
      return Left(FirestoreFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Erro inesperado ao salvar Tipo de Barrils: $e'));
    }
  }

  @override
  Future<Either<Failure, BarrilEntity?>> getBarril(String tpId) async {
    try {
      final model = await _datasource.getBarril(tpId);

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
      return Left(UnexpectedFailure('Erro inesperado ao salvar Tipo de Barrils: $e'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateBarril({
    required BarrilEntity barril,
    required String tpId,
  }) async {
    try {
      if (barril.id == null) {
        return const Left(UnexpectedFailure('BarrilRepository -> id não pode ser null'));
      }
      if (tpId.trim().isEmpty) {
        return const Left(UnexpectedFailure('BarrilRepository -> tpId não pode estar vazio'));
      }

      final model = barril.toModel();
      await _datasource.updateBarril(barril: model, tpId: tpId);

      _datasource.updateBarril(barril: model, tpId: tpId);
      return const Right(unit);
    } on FirestoreException catch (e) {
      return Left(FirestoreFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnexpectedFailure('Erro inesperado ao salvar Tipo de Barrils: $e'));
    }
  }

  @override
  Stream<List<BarrilEntity>> streamBarris() {
    return _datasource.streamBarris().map((models) => models.map((m) => m.toEntity()).toList());
  }
}
