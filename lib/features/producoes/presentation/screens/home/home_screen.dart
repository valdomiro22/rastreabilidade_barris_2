import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rastreabilidade_barris/features/anotacoes/presentation/screens/providers/stream_anotacao_notifier.dart';
import 'package:rastreabilidade_barris/features/anotacoes/presentation/widgets/adicionar_nota_widget.dart';
import 'package:rastreabilidade_barris/features/anotacoes/presentation/widgets/cabecalho_contador_anotacoes.dart';
import 'package:rastreabilidade_barris/features/anotacoes/presentation/widgets/item_anotacao_widget.dart';

import '../../../../../core/common/widgets/app_drawer.dart';
import '../../../../../core/constants/app_dimens.dart';
import '../../../../../navigate/app_routes_names.dart';
import '../../../domain/entities/producao_entity.dart';
import '../../providers/buscar_producao_notifier.dart';

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
      body: Container(
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
    // final contadorState = ref.watch(anotacaoProvider(producaoId: producao.id!));
    final contadorState = ref.watch(streamAnotacaoProvider(producaoId: producao.id!));

    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(AppDimens.paddingPagina),
        child: Column(
          children: [
            // Cabeçalho
            CabecalhoContadorAnotacoes(qt: 293),
            const SizedBox(height: 16),

            Expanded(
              child: contadorState.when(
                error: (error, stackTrace) => Center(child: Text('Erro: $error')),
                loading: () => const Center(child: CircularProgressIndicator()),
                data: (lista) {
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, index) {
                      return ItemAnotacaoWidget(anotacao: lista[index]);
                    },
                  );
                },
              ),
            ),

            // Botões de codigos
            const SizedBox(height: 20),
            AdicionarNotaWidget(producao: producao),
          ],
        ),
      ),
    );
  }
}
