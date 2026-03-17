import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/widgets/app_drawer.dart';
import '../../../../../navigate/app_routes_names.dart';
import '../../providers/producao_notifier.dart';
import '../../widgets/item_producao_widget.dart';

class ListaProducoesScreen extends ConsumerStatefulWidget {
  final String gradeId;

  const ListaProducoesScreen({super.key, required this.gradeId});

  @override
  ConsumerState<ListaProducoesScreen> createState() => _ListaProducoesScreenState();
}

class _ListaProducoesScreenState extends ConsumerState<ListaProducoesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(producaoProvider(gradeId: widget.gradeId));
    });
  }

  @override
  Widget build(BuildContext context) {
    final listaState = ref.watch(producaoProvider(gradeId: widget.gradeId));

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Produções')),
      drawer: AppDrawer(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: RefreshIndicator(
            onRefresh: () async {
              ref.watch(producaoProvider(gradeId: widget.gradeId));
            },

            child: listaState.when(
              error: (error, stackTrace) => Center(child: Text('Erro: $error')),
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (lista) {
                return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: lista.length,
                  itemBuilder: (context, index) {
                    final producao = lista[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: GestureDetector(
                        onTap: () {
                          final gradeId = lista[index].gradeId;
                          final producaoId = lista[index].id!;
                          context.go(
                            AppRoutesNames.home,
                            extra: (producaoId: producaoId, gradeId: gradeId),
                          );
                        },
                        child: ItemProducaoWidget(producao: producao),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(AppRoutesNames.adicionarProducao, extra: widget.gradeId),
        child: const Icon(Icons.add),
      ),
    );
  }
}
