import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rastreabilidade_barris/core/di/usecasesproviders/anotacao_use_cases.dart';
import 'package:rastreabilidade_barris/features/anotacoes/domain/entity/anotacao_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'editar_anotacao_notifier.g.dart';
part 'editar_anotacao_notifier.freezed.dart';

@riverpod
class EditarAnotacaoNotifier extends _$EditarAnotacaoNotifier {
  @override
  EditarAnotacaoState build() => EditarAnotacaoState.inicial();

  void setCodigo(String v) => state = state.copyWith(codigo: v);
  void setObservacao(String v) => state = state.copyWith(observacao: v);

  Future<void> editar({required AnotacaoEntity anotacao}) async {
    state = state.copyWith(isLoading: true);

    AnotacaoEntity? notaAtualizada;
    if (state.codigo.isNotEmpty && state.observacao.isEmpty) {
      notaAtualizada = _apenasCodigo(anotacao);
    } else if (state.codigo.isEmpty && state.observacao.isNotEmpty) {
      notaAtualizada = _apenasObs(anotacao);
    } else if (state.codigo.isNotEmpty && state.observacao.isNotEmpty) {
      notaAtualizada = _codigoObservacao(anotacao);
    } else {
      state = state.copyWith(isLoading: false, isSucess: true);
      return;
    }

    final useCase = ref.read(updateAnotacaoUseCaseProvider);
    final result = await useCase(anotacao: notaAtualizada);
    result.fold(
      (failure) => state = state.copyWith(isLoading: false, erro: failure.message),
      (_) => state = state.copyWith(isLoading: false, isSucess: true),
    );
  }

  AnotacaoEntity _apenasCodigo(AnotacaoEntity anotacao) {
    return anotacao.copyWith(codigo: state.codigo, horarioEdicao: DateTime.now());
  }

  AnotacaoEntity _apenasObs(AnotacaoEntity anotacao) {
    return anotacao.copyWith(observacao: state.observacao, horarioEdicao: DateTime.now());
  }

  AnotacaoEntity _codigoObservacao(AnotacaoEntity anotacao) {
    return anotacao.copyWith(codigo: state.codigo, observacao: state.observacao, horarioEdicao: DateTime.now());
  }
}

@freezed
sealed class EditarAnotacaoState with _$EditarAnotacaoState {
  const factory EditarAnotacaoState({
    @Default('') String codigo,
    @Default('') String observacao,
    String? erro,
    String? codigoErro,
    String? observacaoErro,
    @Default(false) bool isLoading,
    @Default(false) bool isSucess,
    @Default(false) bool camposValidos,
  }) = _EditarAnotacaoState;

  factory EditarAnotacaoState.inicial() => const EditarAnotacaoState();
}
