import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../barril/domain/entities/barril_entity.dart';
import '../../../../produto/domain/entities/tipo_produto_entity.dart';
import '../../../domain/entities/producao_entity.dart';
import '../../../domain/enums/status_producao.dart';
import '../../providers/producao_notifier.dart';

part 'editar_producao_notifier.freezed.dart';

part 'editar_producao_notifier.g.dart';

@riverpod
class EditarProducaoNotifier extends _$EditarProducaoNotifier {
  @override
  EditarProducaoState build() => EditarProducaoState.inicial();

  void setProduto(ProdutoEntity? produto) => state = state.copyWith(produtoId: produto?.id);

  void setBarril(BarrilEntity? barril) => state = state.copyWith(barrilId: barril?.id);

  void setQuantidade(String v) => state = state.copyWith(quantidade: v, erroQuantidade: null);

  Future<void> editarProducao({required ProducaoEntity producao, required String gradeId}) async {
    if (!_validarCampos()) return;

    state = state.copyWith(isLoading: true, erro: null);

    final quantidade = int.parse(state.quantidade!);
    final producaoAtualizada = producao.copyWith(
      gradeId: gradeId,
      status: StatusProducao.naoConcluida,
      produtoId: state.produtoId!,
      barrilId: state.barrilId!,
      quantidadeProgramada: quantidade,
      dataCriacao: DateTime.now(),
    );

    try {
      ref
          .read(producaoProvider(gradeId: gradeId).notifier)
          .atualizar(
            producaoId: producaoAtualizada.id!,
            gradeId: gradeId,
            producao: producaoAtualizada,
          );
      state = state.copyWith(isLoading: false, isSucess: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, erro: e.toString());
    }
  }

  void limpar() {
    state = EditarProducaoState.inicial();
  }

  bool _validarCampos() {
    bool camposValidos = true;
    String? erroProduto;
    String? erroBarril;
    String? erroQuantidade;

    if (state.produtoId == null) {
      erroProduto = 'Selecione um produto';
      camposValidos = false;
    }

    if (state.barrilId == null) {
      erroBarril = 'Selecione um barril';
      camposValidos = false;
    }

    final texto = state.quantidade?.trim() ?? '';
    if (texto.isEmpty) {
      camposValidos = false;
      erroQuantidade = 'Digite a quantidade';
    } else if (int.tryParse(texto) == null || int.tryParse(texto)! < 0) {
      camposValidos = false;
      erroQuantidade = 'Digite um número válido';
    }

    state = state.copyWith(
      erroQuantidade: erroQuantidade,
      erroBarril: erroBarril,
      erroProduto: erroProduto,
    );

    return camposValidos;
  }
}

@freezed
sealed class EditarProducaoState with _$EditarProducaoState {
  const factory EditarProducaoState({
    String? produtoId,
    String? barrilId,
    String? quantidade,
    @Default(-1) int ordem,
    @Default(-1) int codigo,
    @Default('') String horarioReferente,
    DateTime? data,
    String? erro,
    String? erroProduto,
    String? erroBarril,
    String? erroQuantidade,
    String? erroOrdem,
    String? erroCodigo,
    String? erroGeral,
    String? erroData,
    @Default(false) bool isLoading,
    @Default(false) bool isSucess,
    @Default(false) bool camposValidos,
  }) = _EditarProducaoState;

  factory EditarProducaoState.fromJson(Map<String, dynamic> json) =>
      _$EditarProducaoStateFromJson(json);

  factory EditarProducaoState.inicial() => const EditarProducaoState();
}
