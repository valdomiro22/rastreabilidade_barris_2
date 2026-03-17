import 'dart:developer' as dev;

import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/error/failure.dart';
import '../entity/anotacao_entity.dart';
import '../repositories/aotacao_repository.dart';

class InsertAnotacaoUseCase {
  final AnotacaoRepository _repository;

  InsertAnotacaoUseCase(this._repository);

  Future<Either<Failure, Unit>> call({
    required AnotacaoEntity anotacao,
  }) async {
    final idGerado = const Uuid().v4();
    final anotacaoComId = anotacao.copyWith(id: idGerado);

    dev.log('idGerado: $idGerado');
    dev.log('id na anotacao: ${anotacaoComId.id}');

    return await _repository.insertAnotacao(
      anotacao: anotacaoComId,
    );
  }
}
