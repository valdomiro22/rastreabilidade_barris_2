import 'package:rastreabilidade_barris/core/di/usecasesproviders/grade_use_cases.dart';
import 'package:rastreabilidade_barris/features/grades/domain/entities/grade_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grade_notifier.g.dart';

@riverpod
class GradeNotifier extends _$GradeNotifier {
  @override
  Future<List<GradeEntity>> build() async {
    final useCase = ref.read(getAllGradesUseCaseProvider);
    final result = await useCase();
    return result.fold((failure) => throw failure, (lista) => lista);
  }

  Future<void> deletar(String gradeId) async {
    final useCase = ref.read(deleteGradeUseCaseProvider);
    final result = await useCase(gradeId);

    result.fold((failure) => throw failure, (_) => ref.invalidateSelf());
  }

  Future<void> adicionar(GradeEntity grade) async {
    final useCase = ref.read(insertGradeUseCaseProvider);
    final result = await useCase(grade);

    result.fold((failure) => throw failure, (_) => ref.invalidateSelf());
  }

  Future<void> atualizar(GradeEntity grade) async {
    final useCase = ref.read(updateGradeUseCaseProvider);
    final result = await useCase(gradeId: grade.id!, grade: grade);

    result.fold((failure) => throw failure, (_) => ref.invalidateSelf());
  }
}
