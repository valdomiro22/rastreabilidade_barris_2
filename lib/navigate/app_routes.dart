import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rastreabilidade_barris/core/common/screens/splashscreen/splash_screen.dart';
import 'package:rastreabilidade_barris/features/autenticacao/presentation/screens/cadastro/cadastro_screen.dart';
import 'package:rastreabilidade_barris/features/autenticacao/presentation/screens/configuracoes/configuracoes_screen.dart';
import 'package:rastreabilidade_barris/features/autenticacao/presentation/screens/logar/logar_screen.dart';
import 'package:rastreabilidade_barris/features/autenticacao/presentation/screens/recuperarsenha/recuperar_senha_screen.dart';
import 'package:rastreabilidade_barris/home_screen.dart';
import 'app_routes_names.dart';

class AppRoutes {
  static final routes = [
    GoRoute(path: AppRoutesNames.cadastro, builder: (context, state) => CadastroScreen()),
    GoRoute(path: AppRoutesNames.login, builder: (context, state) => LogarScreen()),
    GoRoute(path: AppRoutesNames.splash, builder: (context, state) => SplashScreen()),
    GoRoute(path: AppRoutesNames.recuperarSenha, builder: (context, state) => RecuperarSenhaScreen(),),
    GoRoute(path: AppRoutesNames.configuracoesUsuario, builder: (context, state) => ConfiguracoesUsuarioScreen(),),
    // GoRoute(path: AppRoutesNames.listaGrades, builder: (context, state) => ListaGradesScreen()),
    // GoRoute(path: AppRoutesNames.adicionarGrade, builder: (context, state) => AdicionarGradeScreen(),),
    // GoRoute(path: AppRoutesNames.adicionarProduto, builder: (context, state) => AdicionarProdutoScreen(),),
    // GoRoute(path: AppRoutesNames.adicionarBarril, builder: (context, state) => AdicionarBarrilScreen(),),
    // GoRoute(path: AppRoutesNames.listaBarris, builder: (context, state) => ListaTipoBarrilScreen()),
    // GoRoute(path: AppRoutesNames.listaProdutos, builder: (context, state) => ListaProdutoScreen()),
    // GoRoute(path: AppRoutesNames.configuracoesApp, builder: (context, state) => ConfiguracoesAppScreen()),
    // GoRoute(path: AppRoutesNames.inserirNivelBuffer, builder: (context, state) => InserirNivelBufferScreen()),
    // GoRoute(path: AppRoutesNames.calculadoraTempoParadas, builder: (context, state) => CalcularTempoParadaScreen()),

    // // Alterar Nome
    // GoRoute(
    //   path: AppRoutesNames.alterarNome,
    //   builder: (context, state) {
    //     final usuario = state.extra as UsuarioEntity?;
    //     if (usuario == null) {
    //       return const Scaffold(
    //         body: Center(child: Text('Item não encontrado - Alterar nome de usuário')),
    //       );
    //     }
    //     return AlterarNomeScreen(usuario: usuario);
    //   },
    // ),

    // // Alterar Email
    // GoRoute(
    //   path: AppRoutesNames.alterarEmail,
    //   builder: (context, state) {
    //     final usuario = state.extra as UsuarioEntity?;
    //     if (usuario == null) {
    //       return const Scaffold(
    //         body: Center(child: Text('Item não encontrado - Alterar email de usuário')),
    //       );
    //     }
    //     return AlterarEmailScreen(usuario: usuario);
    //   },
    // ),

    // // Alterar Senha
    // GoRoute(
    //   path: AppRoutesNames.alterarSenha,
    //   builder: (context, state) {
    //     final usuario = state.extra as UsuarioEntity?;
    //     if (usuario == null) {
    //       return const Scaffold(
    //         body: Center(child: Text('Item não encontrado - Alterar senha do usuário')),
    //       );
    //     }
    //     return AlterarSenhaScreen(usuario: usuario);
    //   },
    // ),

    // // Deletar Conta
    // GoRoute(
    //   path: AppRoutesNames.deletarConta,
    //   builder: (context, state) {
    //     final usuario = state.extra as UsuarioEntity?;
    //     if (usuario == null) {
    //       return const Scaffold(
    //         body: Center(child: Text('Item não encontrado - Alterar senha do usuário')),
    //       );
    //     }
    //     return DeletarContaScreen(usuario: usuario);
    //   },
    // ),

    // // Editar Grade
    // GoRoute(
    //   path: AppRoutesNames.editarGrade,
    //   builder: (context, state) {
    //     final grade = state.extra as GradeEntity?;
    //     if (grade == null) {
    //       return const Scaffold(body: Center(child: Text('Item não encontrado - Editar Grade')));
    //     }
    //     return EditarGradeScreen(gradeRecebida: grade);
    //   },
    // ),

    // // Lista de Produções
    // GoRoute(
    //   path: AppRoutesNames.listaProducoes,
    //   builder: (context, state) {
    //     final gradeId = state.extra as String?;
    //     if (gradeId == null) {
    //       return const Scaffold(body: Center(child: Text('Item não encontrado - Editar Grade')));
    //     }
    //     return ListaProducoesScreen(gradeId: gradeId);
    //   },
    // ),

    // // Relatorio Screen
    // GoRoute(
    //   path: AppRoutesNames.relatorioProducao,
    //   builder: (context, state) {
    //     final gradeId = state.extra as String?;
    //     if (gradeId == null) {
    //       return const Scaffold(body: Center(child: Text('Item não encontrado - Editar Grade')));
    //     }
    //     return RelatorioScreen(gradeId: gradeId);
    //   },
    // ),

    // // Adicionar Produção
    // GoRoute(
    //   path: AppRoutesNames.adicionarProducao,
    //   builder: (context, state) {
    //     final gradeId = state.extra as String?;
    //     if (gradeId == null) {
    //       return const Scaffold(body: Center(child: Text('Item não encontrado - Editar Grade')));
    //     }
    //     return AdicionarProducaoScreen(gradeId: gradeId);
    //   },
    // ),

    // // Alterar nível Buffer
    // GoRoute(path: AppRoutesNames.nivelBuffer, builder: (context, state) {
    //   final configuracao = state.extra as ConfiguracoesEntity?;
    //   if (configuracao == null) {
    //     return const Scaffold(body: Center(child: Text('Item não encontrado - Alterar nível Buffer')));
    //   }
    //   return AlterarNivelScreen(configuracao: configuracao);
    // }),

    // // Produção por Turno
    // GoRoute(
    //   path: AppRoutesNames.producaoPorTurno,
    //   builder: (context, state) {
    //     final params = state.extra as ({String producaoId, String gradeId})?;
    //     if (params == null) {
    //       return const Scaffold(body: Center(child: Text('Item não encontrado - Produção por turno')));
    //     }
    //     return ProducaoPorTurnoScreen(producaoId: params.producaoId, gradeId: params.gradeId,);
    //   },
    // ),

    // Home Screen
    GoRoute(path: AppRoutesNames.home, builder: (context, state) => HomeScreen()),
    // GoRoute(
    //   path: AppRoutesNames.home,
    //   builder: (context, state) {
    //     final params = state.extra as ({String producaoId, String gradeId})?;

    //     if (params == null) {
    //       return const Scaffold(body: Center(child: SelecionarProducaoWidget()));
    //     }

    //     return HomeScreen(producaoId: params.producaoId, gradeId: params.gradeId);
    //   },
    // ),

    // // Status da Produção Screen
    // GoRoute(
    //   path: AppRoutesNames.statusProducao,
    //   builder: (context, state) {
    //     final params = state.extra as ({String producaoId, String gradeId})?;

    //     if (params == null) {
    //       return const Scaffold(body: Center(child: SelecionarProducaoWidget()));
    //     }

    //     return StatusProducaoScreen(producaoId: params.producaoId, gradeId: params.gradeId);
    //   },
    // ),

    // // Simular fim de Produção Screen
    // GoRoute(
    //   path: AppRoutesNames.simularFimProducao,
    //   builder: (context, state) {
    //     final producao = state.extra as ProducaoEntity?;
    //     if (producao == null) {
    //       return const Scaffold(body: Center(child: Text('Item não encontrado - Editar Grade')));
    //     }
    //     return SimularFimProducaoScreen(producao: producao);
    //   },
    // ),

    // // Editar Produção
    // GoRoute(
    //   path: AppRoutesNames.editarProducao,
    //   builder: (context, state) {
    //     // final producao = state.extra as ProducaoEntity?;
    //     final params = state.extra as ({ProducaoEntity producao, BarrilEntity barril, ProdutoEntity produto})?;
    //     if (params == null) {
    //       return const Scaffold(body: Center(child: Text('Item não encontrado - Editar Grade')));
    //     }
    //     return EditarProducaoScreen(producao: params.producao, produto: params.produto, barril: params.barril);
    //   },
    // ),
  ];
}
