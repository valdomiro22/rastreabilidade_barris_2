import 'package:dartz/dartz.dart';
import 'package:rastreabilidade_barris/features/grades/domain/enums/turno.dart';

import '../../../../core/error/failure.dart';
import '../entity/anotacao_entity.dart';

abstract class AnotacaoRepository {
  Future<Either<Failure, Unit>> insertAnotacao({required AnotacaoEntity anotacao});

  Future<Either<Failure, Unit>> updateAnotacao({required AnotacaoEntity anotacao});

  Future<Either<Failure, AnotacaoEntity?>> getAnotacao({required String anotacaoId});

  Future<Either<Failure, Unit>> deleteAnotacao({required String anotacaoId});

  Stream<List<AnotacaoEntity>> streamAnotacoesDaProducao({required String producaoId});
}
