import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/entities/grade_entity.dart';
import '../../providers/grade_notifier.dart';

part 'adicionar_grade_notifier.freezed.dart';

part 'adicionar_grade_notifier.g.dart';

@riverpod
class AdicionarGradeNotifier extends _$AdicionarGradeNotifier {
  @override
  FormAdicionarGradeState build() => FormAdicionarGradeState.inicial();

  void setNumeroGrade(String v) {
    state = state.copyWith(
      numeroGrade: v,
      erroNumero: null,
    );
  }

  void inserirData(DateTime d) => state = state.copyWith(data: d, erroData: null);

  Future<void> inserirGrade() async {
    if (!_validarCampos()) return;

    state = state.copyWith(isLoading: true, erro: null);  // TODO - adicionar err: null nas outras features

    final numeroDaGrade = int.parse(state.numeroGrade!);
    final grade = GradeEntity(
      id: const Uuid().v4(),  // TODO - Mover este id para o useCase
      numeroGrade: numeroDaGrade,
      data: state.data!,
    );

    try {
      await ref.read(gradeProvider.notifier).adicionar(grade);
      state = state.copyWith(isLoading: false, isSucess: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, erro: e.toString());
    }
  }

  bool _validarCampos() {
    bool validos = true;
    String? erroNumero;
    String? erroData;

    final texto = state.numeroGrade?.trim() ?? '';

    if (texto.isEmpty) {
      validos = false;
      erroNumero = 'Digite o número da grade';
    } else if (int.tryParse(texto) == null || int.tryParse(texto)! < 0) {
      validos = false;
      erroNumero = 'Digite um número válido';
    }

    if (state.data == null) {
      validos = false;
      erroData = 'Selecione a data';
    }

    state = state.copyWith(erroNumero: erroNumero, erroData: erroData);
    return validos;
  }
}

@freezed
sealed class FormAdicionarGradeState with _$FormAdicionarGradeState {
  const factory FormAdicionarGradeState({
    String? numeroGrade,
    DateTime? data,
    String? erro,
    String? erroNumero,
    String? erroData,
    @Default(false) bool isLoading,
    @Default(false) bool isSucess,
    @Default(false) bool camposValidos,
  }) = _FormAdicionarGradeState;

  factory FormAdicionarGradeState.inicial() => const FormAdicionarGradeState();
}
