import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_dimens.dart';
import '../../../../barril/domain/entities/barril_entity.dart';
import '../../../../barril/presentation/providers/barril_notifier.dart';
import '../../../../produto/domain/entities/tipo_produto_entity.dart';
import '../../../../produto/presentation/providers/produto_notifier.dart';
import '../../../domain/entities/producao_entity.dart';
import 'editar_producao_notifier.dart';

class EditarProducaoScreen extends ConsumerStatefulWidget {
  final ProducaoEntity producao;
  final BarrilEntity barril;
  final ProdutoEntity produto;

  const EditarProducaoScreen({
    super.key,
    required this.producao,
    required this.barril,
    required this.produto,
  });

  @override
  ConsumerState<EditarProducaoScreen> createState() => _EditarProducaoScreenState();
}

class _EditarProducaoScreenState extends ConsumerState<EditarProducaoScreen> {
  final _qtController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _qtController.text = widget.producao.quantidadeProgramada.toString();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notifier = ref.read(editarProducaoProvider.notifier);
      notifier.setBarril(widget.barril);
      notifier.setProduto(widget.produto);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editarProducaoProvider);
    final notifier = ref.watch(editarProducaoProvider.notifier);
    final listaBarrisState = ref.watch(barrilProvider);
    final listaProdutosState = ref.watch(produtoProvider);
    final gradeId = widget.producao.gradeId;

    final listaBarris = listaBarrisState.value ?? [];
    final listaProdutos = listaProdutosState.value ?? [];

    ref.listen(editarProducaoProvider, (previous, next) {
      if (next.isSucess) {
        _qtController.clear();
        context.pop();
        // notifier.limpar();
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text('Editar Produção')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppDimens.paddingPagina),
        child: Column(
          children: [
            Row(
              children: [
                if (state.erro != null)
                  Text(state.erro!, style: TextStyle(color: Colors.blue, fontSize: 12)),

                // Produto
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.teal,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<ProdutoEntity>(
                        dropdownColor: Colors.brown[200],
                        borderRadius: BorderRadius.circular(10),
                        hint: const Text('Produto', style: TextStyle(color: Colors.white)),
                        isDense: false,
                        value: state.produtoId == null
                            ? null
                            : listaProdutos.firstWhere(
                                (b) => b.id == state.produtoId,
                                orElse: () => listaProdutos.first, // ou null, se preferir
                              ),
                        items: listaProdutos.map((p) {
                          return DropdownMenuItem(
                            value: p,
                            child: Text(p.nome, style: TextStyle(color: Colors.black)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          notifier.setProduto(value);
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Barril
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.teal,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<BarrilEntity>(
                        dropdownColor: Colors.brown[200],
                        borderRadius: BorderRadius.circular(10),
                        hint: const Text('Barril', style: TextStyle(color: Colors.white)),
                        isDense: false,
                        value: state.barrilId == null
                            ? null
                            : listaBarris.firstWhere(
                                (b) => b.id == state.barrilId,
                                orElse: () => listaBarris.first, // ou null, se preferir
                              ),
                        items: listaBarris.map((p) {
                          return DropdownMenuItem(
                            value: p,
                            child: Text(p.nome, style: TextStyle(color: Colors.black)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          notifier.setBarril(value);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _qtController,
              decoration: InputDecoration(labelText: 'Quantidade', hintText: 'Ex: 50'),
              keyboardType: TextInputType.number,
              onChanged: (value) => notifier.setQuantidade(value),
            ),
            if (state.erroQuantidade != null)
              Text(state.erroQuantidade.toString(), style: TextStyle(color: Colors.red)),
            if (state.erroProduto != null)
              Text(state.erroProduto.toString(), style: TextStyle(color: Colors.red)),
            if (state.erroBarril != null)
              Text(state.erroBarril.toString(), style: TextStyle(color: Colors.red)),

            const SizedBox(height: 8),

            if (state.isLoading == true)
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Center(child: CircularProgressIndicator()),
              ),

            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  final producao = widget.producao;
                  notifier.editarProducao(producao: producao, gradeId: gradeId);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                child: Text('Salvar', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
