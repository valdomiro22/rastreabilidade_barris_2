import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/producao_entity.dart';
import '../screens/home/selecionar_turno_notifier.dart';
import 'card_quantidade_horaria.dart';

class ContainerProducaoHorariaWidget extends ConsumerStatefulWidget {
  final ProducaoEntity producao;

  const ContainerProducaoHorariaWidget({super.key, required this.producao});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ContainerProducaoHorariaWidgetState();
}

class _ContainerProducaoHorariaWidgetState extends ConsumerState<ContainerProducaoHorariaWidget> {
  @override
  Widget build(BuildContext context) {
    final producao = widget.producao;
    final turnoState = ref.watch(selecionarTurnoProvider);

    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 1,
      ),
      itemCount: turnoState.turno.horarios.length,
      itemBuilder: (context, index) {
        final horario = turnoState.turno.horarios.values.toList()[index];
        return CardQuantidadeHoraria(horario: horario, producao: producao);
      },
    );
  }
}
