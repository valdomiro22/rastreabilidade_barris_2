import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rastreabilidade_barris/features/producoes/presentation/widgets/container_status_producao.dart';

import '../../../../../core/constants/app_dimens.dart';
import '../../providers/buscar_producao_notifier.dart';
import '../../widgets/container_producao_horaria_widget.dart';
import '../../widgets/selecao_de_turno_widget.dart';

class ProducaoPorTurnoScreen extends ConsumerStatefulWidget {
  final String producaoId;
  final String gradeId;

  const ProducaoPorTurnoScreen({super.key, required this.producaoId, required this.gradeId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProducaoPorTurnoScreenState();
}

class _ProducaoPorTurnoScreenState extends ConsumerState<ProducaoPorTurnoScreen> {
  @override
  Widget build(BuildContext context) {
    final producaoState = ref.watch(
      buscarProducaoProvider(producaoId: widget.producaoId, gradeId: widget.gradeId),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Produção do turno')),
      body: producaoState.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Erro: $error')),
        data: (producao) {
          return Padding(
            padding: EdgeInsets.all(AppDimens.paddingPagina),
            child: Column(
              children: [
                ContainerStatusProducao(producao: producao),
                const SizedBox(height: 16),

                SelecaoDeTurnoWidget(producaoId: widget.producaoId),
                const SizedBox(height: 8),

                ContainerProducaoHorariaWidget(producao: producao),
              ],
            ),
          );
        },
      ),
    );
  }
}
