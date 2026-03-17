import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_dimens.dart';
import '../../../../../navigate/app_routes_names.dart';
import '../../../../barril/domain/entities/barril_entity.dart';
import '../../../../barril/presentation/providers/barril_notifier.dart';
import '../../../../produto/domain/entities/tipo_produto_entity.dart';
import '../../../../produto/presentation/providers/produto_notifier.dart';
import 'adicionar_producao_notifier.dart';

class AdicionarProducaoScreen extends ConsumerStatefulWidget {
  final String gradeId;

  const AdicionarProducaoScreen({super.key, required this.gradeId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdicionarProducaoScreenState();
}

class _AdicionarProducaoScreenState extends ConsumerState<AdicionarProducaoScreen> {
  final _qtController = TextEditingController();
  final _ordemController = TextEditingController();
  final _codigoController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _ordemController.dispose();
    _qtController.dispose();
    _codigoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adicionarProducaoProvider);
    final notifier = ref.watch(adicionarProducaoProvider.notifier);
    final listaBarrisState = ref.watch(barrilProvider);
    final listaProdutosState = ref.watch(produtoProvider);
    final gradeId = widget.gradeId;

    final listaBarris = listaBarrisState.value ?? [];
    final listaProdutos = listaProdutosState.value ?? [];

    ref.listen(adicionarProducaoProvider, (previous, next) {
      if (next.isSucess) {
        notifier.limpar();
        _qtController.clear();
        _ordemController.clear();
        context.pop();
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Produção')),
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
                    child: listaProdutos.isEmpty
                        ? _botaoAdicionar(
                            fucao: () => context.push(AppRoutesNames.adicionarProduto),
                            mensagem: 'Adicionar Produto',
                          )
                        : _selecionarProduto(listaProdutos: listaProdutos),
                  ),
                ),
                SizedBox(width: 16),

                // Barril
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.teal,
                    ),
                    child: listaBarris.isEmpty
                        ? _botaoAdicionar(
                            fucao: () => context.push(AppRoutesNames.adicionarBarril),
                            mensagem: 'Adicionar Barril',
                          )
                        : _selecionarBarril(listaBarris: listaBarris),
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

            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  notifier.adicionarProducao(gradeId);
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

  Widget _botaoAdicionar({required VoidCallback fucao, required String mensagem}) {
    return TextButton(
      onPressed: fucao,
      child: Text(
        mensagem.toUpperCase(),
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _selecionarProduto({required List<ProdutoEntity> listaProdutos}) {
    final state = ref.watch(adicionarProducaoProvider);
    final notifier = ref.watch(adicionarProducaoProvider.notifier);
    return DropdownButton<ProdutoEntity>(
      dropdownColor: Colors.brown[200],
      isExpanded: true,
      borderRadius: BorderRadius.circular(10),
      hint: const Text('Produto', style: TextStyle(color: Colors.white)),
      isDense: false,
      value: state.produtoId == null
          ? null
          : listaProdutos.firstWhere(
              (b) => b.id == state.barrilId,
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
    );
  }

  Widget _selecionarBarril({required List<BarrilEntity> listaBarris}) {
    final state = ref.watch(adicionarProducaoProvider);
    final notifier = ref.watch(adicionarProducaoProvider.notifier);

    return DropdownButton<BarrilEntity>(
      dropdownColor: Colors.brown[200],
      borderRadius: BorderRadius.circular(10),
      isExpanded: true,
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
        debugPrint('\n\barril selecionado: ${value?.nome}');
        notifier.setBarril(value);
      },
    );
  }
}
