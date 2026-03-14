import 'package:dartz/dartz.dart';
import 'package:rastreabilidade_barris/core/error/failure.dart';

import '../entities/grade_entity.dart';
import '../repositories/grade_repository.dart';

class GetGradeUseCase {
  final GradeRepository _repository;

  GetGradeUseCase(this._repository);

  Future<Either<Failure, GradeEntity>> call(String id) async {
    final grade = await _repository.getGrade(id);

    return grade.fold(
      (failure) => Left(failure),
      (grade) {
        if (grade == null) return Left(AuthFailure('Grade não encontrada'));
        return Right(grade);
    });
  }
}
