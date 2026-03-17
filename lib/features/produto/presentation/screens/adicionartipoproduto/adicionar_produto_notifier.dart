import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/tipo_produto_entity.dart';
import '../../providers/produto_notifier.dart';

part 'adicionar_produto_notifier.freezed.dart';
part 'adicionar_produto_notifier.g.dart';

@riverpod
class AdicionarProdutoNotifier extends _$AdicionarProdutoNotifier {
  @override
  AdicionarProdutoState build() => AdicionarProdutoState.inicial();

  void inserirNome(String v) => state = state.copyWith(nome: v);

  void inserirPrazoValidade(String v) {
    final intValue = int.tryParse(v);
    state = state.copyWith(prazoValidade: intValue ?? -1);
  }

  Future<void> adicionar() async {
    if (!_validar()) return;

    state = state.copyWith(isLoading: true);

    final produto = ProdutoEntity(nome: state.nome, prazoValidade: state.prazoValidade);

    try {
      await ref.read(produtoProvider.notifier).adicionar(produto);
      state = state.copyWith(isLoading: false, isSucess: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, erro: e.toString());
    }
  }

  bool _validar() {
    bool validos = true;
    String? erNome;
    String? erPrazo;

    if (state.nome.isEmpty) {
      validos = false;
      erNome = 'Digite o nome';
    }

    if (state.prazoValidade <= 0) {
      validos = false;
      erPrazo = 'Digite o prazo de validade';
    }

    state = state.copyWith(erroNome: erNome, erroValidade: erPrazo);
    return validos;
  }

  void limparCampos() => AdicionarProdutoState.inicial();
}

@freezed
sealed class AdicionarProdutoState with _$AdicionarProdutoState {
  const factory AdicionarProdutoState({
    @Default('') String nome,
    @Default(0) int prazoValidade,
    String? erro,
    String? erroNome,
    String? erroValidade,
    @Default(false) bool isLoading,
    @Default(false) bool isSucess,
    @Default(false) bool camposValidos,
  }) = _AdicionarProdutoState;

  factory AdicionarProdutoState.inicial() => const AdicionarProdutoState();
}
