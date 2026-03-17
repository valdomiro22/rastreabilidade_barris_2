import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/entities/barril_entity.dart';
import '../../providers/barril_notifier.dart';

part 'adicionar_barril_notifier.freezed.dart';
part 'adicionar_barril_notifier.g.dart';

@riverpod
class AdicionarBarrilNotifier extends _$AdicionarBarrilNotifier {
  @override
  AdicionarTipoBarrilState build() => AdicionarTipoBarrilState.inicial();

  void inserirNome(String v) => state = state.copyWith(nome: v);

  void insertIsDescartavel(bool v) => state = state.copyWith(isDescartavel: v);

  void inserirVolume(String v) {
    final intValue = int.tryParse(v);
    state = state.copyWith(volume: intValue ?? -1);
  }

  Future<void> adicionar() async {
    if (!_isCamposValidos()) return;

    state = state.copyWith(isLoading: true, erro: null);

    final barril = BarrilEntity(
      nome: state.nome,
      volume: state.volume,
      isDescartavel: state.isDescartavel,
    );

    try {
      await ref.read(barrilProvider.notifier).adicionar(barril);
      state = state.copyWith(isLoading: false, isSucess: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, erro: e.toString());
    }
  }

  bool _isCamposValidos() {
    bool validos = true;
    String? erroNome;
    String? erroVolume;

    if (state.nome.isEmpty) {
      validos = false;
      erroNome = 'Digite o nome';
    }

    if (state.volume.isNegative) {
      validos = false;
      erroVolume = 'Digite o volume';
    }

    if (state.volume == 0) {
      validos = false;
      erroVolume = 'Digite um volume válido';
    }

    state = state.copyWith(erroNome: erroNome, erroVolume: erroVolume);
    return validos;
  }

  void limpar() => state = AdicionarTipoBarrilState.inicial();
}

@freezed
sealed class AdicionarTipoBarrilState with _$AdicionarTipoBarrilState {
  const factory AdicionarTipoBarrilState({
    @Default('') String nome,
    @Default(-1) int volume,
    @Default(false) bool isDescartavel,
    String? erro,
    String? erroNome,
    String? erroVolume,
    @Default(false) bool isLoading,
    @Default(false) bool isSucess,
    @Default(false) bool camposValidos,
  }) = _AdicionarTipoBarrilState;

  factory AdicionarTipoBarrilState.inicial() => const AdicionarTipoBarrilState();
}
