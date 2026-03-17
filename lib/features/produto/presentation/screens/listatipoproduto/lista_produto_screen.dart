import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../navigate/app_routes_names.dart';
import '../../providers/produto_notifier.dart';

class ListaProdutoScreen extends ConsumerStatefulWidget {
  const ListaProdutoScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListaProdutoScreenState();
}

class _ListaProdutoScreenState extends ConsumerState<ListaProdutoScreen> {

  @override
  Widget build(BuildContext context) {
    final listaAsync = ref.watch(produtoProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de tipos de produtos',
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: listaAsync.when(
          data: (lista) {
            if (lista.isEmpty) {
              return const Center(child: Text('Nenhum tipo de produto cadastrado'));
            }
            
            return ListView.builder(
              itemCount: lista.length,
              itemBuilder: (context, index) {
                final item = lista[index];
                
                return Card(
                  color: Colors.teal[200],
                  child: ListTile(
                    title: Text(item.nome, style: TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text('${item.prazoValidade} dias'),
                    trailing: IconButton(
                      onPressed: () async {
                        ref.read(produtoProvider.notifier).deletar(produtoId: item.id!);
                      },
                      icon: Icon(Icons.delete, color: Colors.black38,),
                    ),
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) => Center(child: Text('Erro: $error')),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(AppRoutesNames.adicionarProduto);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}