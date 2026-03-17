import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../navigate/app_routes_names.dart';
import '../../../grades/presentation/widgets/card_status_producao.dart';
import '../../domain/entities/producao_entity.dart';

class ContainerStatusProducao extends ConsumerWidget {
  final ProducaoEntity producao;

  const ContainerStatusProducao({super.key, required this.producao});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CardStatusProducao(
          label: 'Programado',
          fundoTitulo: Color(0xFF2563EB),
          valor: producao.quantidadeProgramada,
        ),
        GestureDetector(
          onTap: () => context.push(
            AppRoutesNames.producaoPorTurno,
            extra: (producaoId: producao.id, gradeId: producao.gradeId),
          ),
          child: CardStatusProducao(
            label: 'Produzido',
            fundoTitulo: Color(0xFF22C55E),
            valor: producao.quantidadeProduzida,
          ),
        ),
        CardStatusProducao(
          label: 'Pendente',
          fundoTitulo: Color(0xFFEF4444),
          valor: producao.quantidadePendente,
        ),
      ],
    );
  }
}
