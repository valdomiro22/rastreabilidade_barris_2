import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../grades/domain/enums/turno.dart';
import '../screens/home/selecionar_turno_notifier.dart';

class SelecaoDeTurnoWidget extends ConsumerWidget {
  final String producaoId;

  const SelecaoDeTurnoWidget({super.key, required this.producaoId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final turnoState = ref.watch(selecionarTurnoProvider);
    final turnoNotifier = ref.watch(selecionarTurnoProvider.notifier);

    return Column(
      children: [
        // Selecionar turno
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(4),
                      elevation: 0,
                      backgroundColor: turnoState.turno == Turno.turnoA
                          ? Color(0xff3559fa)
                          : Color(0xffd2d6de),
                      overlayColor: Colors.black.withOpacity(0.05),
                      splashFactory: InkRipple.splashFactory,
                      animationDuration: const Duration(milliseconds: 120),
                    ),
                    onPressed: () {
                      // qtNotifier.setTurno(Turno.turnoA);
                      turnoNotifier.selecionarTurno(Turno.turnoA);
                    },
                    child: Text(
                      'Turno A',
                      style: TextStyle(
                        color: turnoState.turno == Turno.turnoA ? Colors.white : Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(4),
                      elevation: 0,
                      backgroundColor: turnoState.turno == Turno.turnoB
                          ? Color(0xff3559fa)
                          : Color(0xffd2d6de),
                      overlayColor: Colors.black.withOpacity(0.05),
                      splashFactory: InkRipple.splashFactory,
                      animationDuration: const Duration(milliseconds: 120),
                    ),
                    onPressed: () {
                      // qtNotifier.setTurno(Turno.turnoB);
                      turnoNotifier.selecionarTurno(Turno.turnoB);
                    },
                    child: Text(
                      'Turno B',
                      style: TextStyle(
                        color: turnoState.turno == Turno.turnoB ? Colors.white : Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),

                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(4),
                      elevation: 0,
                      backgroundColor: turnoState.turno == Turno.turnoC
                          ? Color(0xff3559fa)
                          : Color(0xffd2d6de),
                      overlayColor: Colors.black.withOpacity(0.05),
                      splashFactory: InkRipple.splashFactory,
                      animationDuration: const Duration(milliseconds: 120),
                    ),
                    onPressed: () {
                      // qtNotifier.setTurno(Turno.turnoC);
                      turnoNotifier.selecionarTurno(Turno.turnoC);
                    },
                    child: Text(
                      'Turno C',
                      style: TextStyle(
                        color: turnoState.turno == Turno.turnoC ? Colors.white : Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
