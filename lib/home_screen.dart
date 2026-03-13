import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rastreabilidade_barris/core/common/widgets/app_drawer.dart';
import 'package:rastreabilidade_barris/navigate/app_routes_names.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _opcoesMenu = ['Gerar relatorio', 'Add Produção', 'Produção por turno', 'Opções'];
  
  // Opções do PopUp Menu
  void _opcoesPopUpMenu(String itemEscolhido) {
    switch (itemEscolhido) {
      case 'Gerar relatorio':
        // context.push(AppRoutesNames.relatorioProducao, extra: widget.gradeId);
        context.push(AppRoutesNames.relatorioProducao,);
        break;
      case 'Add Produção':
        // context.push(AppRoutesNames.adicionarProducao, extra: widget.gradeId);
        context.push(AppRoutesNames.adicionarProducao,);
        break;
      case 'Produção por turno':
        context.push(AppRoutesNames.producaoPorTurno);
        break;
      case 'Opções':
        context.push(AppRoutesNames.configuracoesApp);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(provider);
    return Scaffold(
      drawer: AppDrawer(),
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
      body: Center(
        child: Text('HomeScreen'),
      ),
    );
  }
}