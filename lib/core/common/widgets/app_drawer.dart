import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as usuario;

import '../../../features/autenticacao/domain/entities/usuario_entity.dart';
import '../../../features/autenticacao/presentation/buscarusuario/buscar_usuario_notifier.dart';
import '../../../features/autenticacao/presentation/widgets/foto_perfil_wieget.dart';
import '../../../navigate/app_routes_names.dart';
import '../../theme/app_colors.dart';

class AppDrawer extends ConsumerStatefulWidget {
  const AppDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppDrawerState();
}

class _AppDrawerState extends ConsumerState<AppDrawer> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(buscarUsuarioProvider.notifier);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(homeProvider);
    final usuarioState = ref.watch(buscarUsuarioProvider);

    return Drawer(
      width: 260,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 32, left: 10, bottom: 8),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.transparent, width: 0.0)),
              color: AppColors.red900,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Stack(
                    children: <Widget>[
                      FotoPerfilWieget(imageUrl: 'usuario.fo', tamanho: 100),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'nome',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Text('email', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        context.pop();
                        context.push(AppRoutesNames.configuracoesApp);
                      },
                      icon: Icon(Icons.settings, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Divider(),
          SizedBox(height: 8),
          ListTile(
            leading: const Icon(Icons.home, color: AppColors.red900),
            title: const Text('Home'),
            onTap: () {
              context.pop();
              context.push(AppRoutesNames.home);
            },
          ),
          ListTile(
            leading: const Icon(Icons.stacked_bar_chart_rounded, color: AppColors.red900),
            title: const Text('Adicionar Grade'),
            onTap: () {
              context.pop();
              context.push(AppRoutesNames.adicionarGrade);
            },
          ),
          ListTile(
            leading: const Icon(Icons.list, color: AppColors.red900),
            title: const Text('Lista de Grades'),
            onTap: () {
              context.pop();
              context.push(AppRoutesNames.listaGrades);
            },
          ),
          ListTile(
            leading: const Icon(Icons.list, color: AppColors.red900),
            title: const Text('Cacular tempo parada'),
            onTap: () {
              context.pop();
              context.push(AppRoutesNames.calculadoraTempoParadas);
            },
          ),
          // TODO - Adicionar Produção
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app, color: AppColors.red900),
            title: const Text('Sair'),
            onTap: () {
              // ref.read(homeProvider.notifier).deslogar();
            },
          ),
        ],
      ),
    );
  }
}
