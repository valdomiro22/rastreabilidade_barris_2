import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/grade_entity.dart';
import '../../providers/grade_notifier.dart';

part 'editar_grade_notifier.freezed.dart';

part 'editar_grade_notifier.g.dart';

@riverpod
class EditarGradeNotifier extends _$EditarGradeNotifier {
  @override
  FormEditarGradeState build() => FormEditarGradeState.inicial();

  void inserirNumero(String v) {
    int? num;
    try {
      num = int.parse(v.trim());
    } on FormatException {
      state = state.copyWith(erro: 'Número inválido');
      return;
    }
    state = state.copyWith(numeroGrade: num, erroNumero: null);
  }

  void inserirData(DateTime d) => state = state.copyWith(data: d, erroData: null);

  Future<void> editarGrade({required GradeEntity grade}) async {
    if (!_validarCampos()) return;

    state = state.copyWith(isLoading: true, erro: null);

    final gradeEditada = grade.copyWith(numeroGrade: state.numeroGrade, data: state.data);

    try {
      await ref.read(gradeProvider.notifier).atualizar(gradeEditada);
      state = state.copyWith(isLoading: false, isSucess: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, erro: e.toString());
    }
  }

  bool _validarCampos() {
    bool validos = true;
    String? num;
    String? dt;

    if (state.numeroGrade == null) {
      validos = false;
      num = 'Digite o número da grade';
    } else if (state.numeroGrade!.isNaN) {
      validos = false;
      num = 'Digite um valor numerico';
    }

    if (state.data == null) {
      validos = false;
      num = 'Selecione a data';
    }

    state = state.copyWith(erroNumero: num, erroData: dt);
    return validos;
  }
}

@freezed
sealed class FormEditarGradeState with _$FormEditarGradeState {
  const factory FormEditarGradeState({
    int? numeroGrade,
    DateTime? data,
    String? erro,
    String? erroNumero,
    String? erroData,
    @Default(false) bool isLoading,
    @Default(false) bool isSucess,
    @Default(false) bool camposValidos,
  }) = _FormEditarGradeState;

  factory FormEditarGradeState.inicial() => const FormEditarGradeState();
}
