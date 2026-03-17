import 'dart:developer' as dev;

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../barril/domain/entities/barril_entity.dart';
import '../../../../produto/domain/entities/tipo_produto_entity.dart';
import '../../../domain/entities/producao_entity.dart';
import '../../../domain/enums/status_producao.dart';
import '../../providers/producao_notifier.dart';

part 'adicionar_producao_notifier.freezed.dart';
part 'adicionar_producao_notifier.g.dart';

@riverpod
class AdicionarProducaoNotifier extends _$AdicionarProducaoNotifier {
  @override
  FormAdicionarProducaoState build() => FormAdicionarProducaoState.inicial();

  void setProduto(ProdutoEntity? produto) => state = state.copyWith(produtoId: produto?.id);

  // void setBarril(BarrilEntity? barril) => state = state.copyWith(barrilId: barril?.id);
  void setBarril(BarrilEntity? barril) {
    dev.log('setter: barril inserido: ${barril?.nome}');
    state = state.copyWith(barrilId: barril?.id);
  }

  void setQuantidade(String v) => state = state.copyWith(quantidade: v, erroQuantidade: null);

  Future<void> adicionarProducao(String gradeId) async {
    if (!_validarCampos()) return;

    state = state.copyWith(isLoading: true);

    final quantidade = int.parse(state.quantidade!);
    final producao = ProducaoEntity(
      gradeId: gradeId,
      status: StatusProducao.naoConcluida,
      produtoId: state.produtoId!,
      barrilId: state.barrilId!,
      quantidadeProgramada: quantidade,
      dataCriacao: DateTime.now(),
    );

    try {
      ref.read(producaoProvider(gradeId: gradeId).notifier).adicionar(gradeId: gradeId, producao: producao);
      state = state.copyWith(isLoading: false, isSucess: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, erro: e.toString());
    }

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
      erroQuantidade = 'Digite o número da grade';
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

  void limpar() {
    state = FormAdicionarProducaoState.inicial();
  }
}

@freezed
sealed class FormAdicionarProducaoState with _$FormAdicionarProducaoState {
  const factory FormAdicionarProducaoState({
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
  }) = _FormAdicionarProducaoState;

  factory FormAdicionarProducaoState.fromJson(Map<String, dynamic> json) =>
      _$FormAdicionarProducaoStateFromJson(json);

  factory FormAdicionarProducaoState.inicial() => const FormAdicionarProducaoState();
}

