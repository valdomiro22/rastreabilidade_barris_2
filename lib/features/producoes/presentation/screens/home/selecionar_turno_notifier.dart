import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../grades/domain/enums/turno.dart';

part 'selecionar_turno_notifier.freezed.dart';

part 'selecionar_turno_notifier.g.dart';

@riverpod
class SelecionarTurnoNotifier extends _$SelecionarTurnoNotifier {
  @override
  SelecionarTurnoState build() => SelecionarTurnoState.inicial();

  void selecionarTurno(Turno turno) {
    state = state.copyWith(turno: turno);
  }

  void inserirQuantidade(String quantidade) {
    state = state.copyWith(quantidade: quantidade);
  }
}

@freezed
abstract class SelecionarTurnoState with _$SelecionarTurnoState {
  const SelecionarTurnoState._();

  const factory SelecionarTurnoState({@Default(Turno.turnoA) Turno turno, String? quantidade}) =
      _SelecionarTurnoState;

  factory SelecionarTurnoState.inicial() => const SelecionarTurnoState();
}
