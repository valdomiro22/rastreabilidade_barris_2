import 'package:dartz/dartz.dart';
import 'package:rastreabilidade_barris/core/error/failure.dart';

import '../entities/grade_entity.dart';
import '../repositories/grade_repository.dart';

class InsertGradeUseCase {
  final GradeRepository _repository;

  InsertGradeUseCase(this._repository);

  Future<Either<Failure, Unit>> call(GradeEntity grade) async {
    return await _repository.insertGrade(grade);
  }
}