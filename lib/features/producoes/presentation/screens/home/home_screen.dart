import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rastreabilidade_barris/features/anotacoes/presentation/widgets/adicionar_nota_widget.dart';

import '../../../../../core/common/widgets/app_drawer.dart';
import '../../../../../core/constants/app_dimens.dart';
import '../../../../../navigate/app_routes_names.dart';
import '../../../domain/entities/producao_entity.dart';
import '../../providers/buscar_producao_notifier.dart';
import '../../widgets/cabecalho_home_widget.dart';
import '../../widgets/container_producao_horaria_widget.dart';
import '../../widgets/container_status_producao.dart';
import '../../widgets/selecao_de_turno_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  final String gradeId;
  final String producaoId;

  const HomeScreen({super.key, required this.producaoId, required this.gradeId});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _opcoesMenu = ['Gerar relatorio', 'Add Produção', 'Produção por turno', 'Configurações'];

  // Opções do PopUp Menu
  void _opcoesPopUpMenu(String itemEscolhido) {
    switch (itemEscolhido) {
      case 'Gerar relatorio':
        context.push(AppRoutesNames.relatorioProducao, extra: widget.gradeId);
        break;
      case 'Add Produção':
        context.push(AppRoutesNames.adicionarProducao, extra: widget.gradeId);
        break;
      case 'Produção por turno':
        context.push(
          AppRoutesNames.producaoPorTurno,
          extra: (producaoId: widget.producaoId, gradeId: widget.gradeId),
        );
        break;
      case 'Configurações':
        context.push(AppRoutesNames.configuracoesApp);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final producaoState = ref.watch(
      buscarProducaoProvider(gradeId: widget.gradeId, producaoId: widget.producaoId),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          PopupMenuButton(
            onSelected: _opcoesPopUpMenu,
            itemBuilder: (context) => _opcoesMenu.map((String item) {
              return PopupMenuItem(value: item, child: Text(item));
            }).toList(),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: producaoState.when(
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Erro: $error')),
          data: (producao) {
            final parametros = (producaoId: producao.id!, gradeId: producao.gradeId);
            return _conteudoProducao(producao: producao, context: context, parametros: parametros);
          },
        ),
      ),
    );
  }

  Widget _conteudoProducao({
    required ProducaoEntity producao,
    required BuildContext context,
    required ({String producaoId, String? gradeId}) parametros,
  }) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimens.paddingPagina),
        child: Column(
          children: [
            // Cabeçalho
            GestureDetector(
              onTap: () => context.push(AppRoutesNames.statusProducao, extra: parametros),
              child: CabecalhoHomeWidget(producao: producao),
            ),
            const SizedBox(height: 16),

            ContainerStatusProducao(producao: producao),
            const SizedBox(height: 16),

            // Monitoramento de volume

            SelecaoDeTurnoWidget(producaoId: widget.producaoId),
            const SizedBox(height: 8),

            // Produção horária
            ContainerProducaoHorariaWidget(producao: producao),

            // Botões de codigos
            // ElevatedButton(onPressed: () => context.push(AppRoutesNames.inserirAnotacao, extra: producao), child: Text('Adicionar'))
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            AdicionarNotaWidget(producao: producao),
          ],
        ),
      ),
    );
  }
}
