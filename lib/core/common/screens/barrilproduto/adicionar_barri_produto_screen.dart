import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rastreabilidade_barris/core/constants/app_dimens.dart';
import 'package:rastreabilidade_barris/navigate/app_routes_names.dart';

class AdicionarBarriProdutoScreen extends ConsumerStatefulWidget {
  const AdicionarBarriProdutoScreen({super.key});

  @override
  ConsumerState<AdicionarBarriProdutoScreen> createState() => _AdicionarBarriProdutoScreenState();
}

class _AdicionarBarriProdutoScreenState extends ConsumerState<AdicionarBarriProdutoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Configurações')),
      body: Scaffold(
        body: Container(
          padding: EdgeInsets.all(AppDimens.paddingPagina),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () => context.push(AppRoutesNames.listaProdutos),
                child: Text('Lista de Produtos'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.push(AppRoutesNames.listaBarris),
                child: Text('Lista de Barris'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
