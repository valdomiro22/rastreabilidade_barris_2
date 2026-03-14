import 'package:rastreabilidade_barris/core/di/firebaseproviders/firebase_providers.dart';
import 'package:rastreabilidade_barris/features/grades/domain/usecases/delete_grade_use_case.dart';
import 'package:rastreabilidade_barris/features/grades/domain/usecases/get_all_grades_use_case.dart';
import 'package:rastreabilidade_barris/features/grades/domain/usecases/get_grade_use_case.dart';
import 'package:rastreabilidade_barris/features/grades/domain/usecases/insert_grade_use_case.dart';
import 'package:rastreabilidade_barris/features/grades/domain/usecases/update_grade_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grade_use_cases.g.dart';

@riverpod
InsertGradeUseCase insertGradeUseCase(Ref ref) {
  final repository = ref.read(gradeRepositoryProvider);
  return InsertGradeUseCase(repository);
}

@riverpod
DeleteGradeUseCase deleteGradeUseCase(Ref ref) {
  final repository = ref.read(gradeRepositoryProvider);
  return DeleteGradeUseCase(repository);
}

@riverpod
GetAllGradesUseCase getAllGradesUseCase(Ref ref) {
  final repository = ref.read(gradeRepositoryProvider);
  return GetAllGradesUseCase(repository);
}

@riverpod
GetGradeUseCase getGradeUseCase(Ref ref) {
  final repository = ref.read(gradeRepositoryProvider);
  return GetGradeUseCase(repository);
}

@riverpod
UpdateGradeUseCase updateGradeUseCase(Ref ref) {
  final repository = ref.read(gradeRepositoryProvider);
  return UpdateGradeUseCase(repository);
}