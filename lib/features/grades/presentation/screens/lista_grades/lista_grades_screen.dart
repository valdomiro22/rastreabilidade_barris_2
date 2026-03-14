import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rastreabilidade_barris/core/constants/app_dimens.dart';
import 'package:rastreabilidade_barris/navigate/app_routes_names.dart';

import '../../../../../core/common/widgets/app_drawer.dart';
import '../../providers/grade_notifier.dart';
import '../../widgets/item_grade_widget.dart';

class ListaGradesScreen extends ConsumerWidget {
  const ListaGradesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(gradeProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Grades')),
      drawer: AppDrawer(),
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Erro: $error')),
        data: (lista) {
          if (lista.isEmpty) {
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: const Center(child: Text('Adicione uma nova Grade')),
              ),
            );
          }

          return Padding(
            padding: EdgeInsets.all(10),
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: lista.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppDimens.paddingPagina),
                  child: GestureDetector(
                    onTap: () {
                      // context.push(AppRoutesNames.listaProducoes, extra: lista[index].id);
                      context.go(
                        AppRoutesNames.listaProducoes,
                        extra: lista[index].id,
                      );
                    },
                    child: ItemGradeWidget(grade: lista[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(AppRoutesNames.adicionarGrade),
        child: const Icon(Icons.add),
      ),
    );
  }
}
