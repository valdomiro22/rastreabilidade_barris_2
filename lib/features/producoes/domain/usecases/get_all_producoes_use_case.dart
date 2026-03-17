import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/producao_entity.dart';
import '../repository/producao_repository.dart';

class GetAllProducoesUseCase {
  final ProducaoRepository _repository;
  
  GetAllProducoesUseCase(this._repository);
  
  Future<Either<Failure, List<ProducaoEntity>>> call(String gradeId) async {
    return _repository.getAllProducoes(gradeId);
  }
}