import 'package:rastreabilidade_barris/core/di/usecasesproviders/grade_use_cases.dart';
import 'package:rastreabilidade_barris/features/grades/domain/entities/grade_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'buscar_uma_grade_notifier.g.dart';

@riverpod
class BuscarUmaGradeNotifier extends _$BuscarUmaGradeNotifier {
  @override
  Future<GradeEntity> build({required String gradeId}) async {
    final useCase = ref.read(getGradeUseCaseProvider);
    final result = await useCase(gradeId);

    return result.fold((failure) => throw failure, (grade) => grade);
  }
}
