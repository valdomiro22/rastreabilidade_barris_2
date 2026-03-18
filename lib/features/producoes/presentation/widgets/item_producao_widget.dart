import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widgets/linha_chave_valor.dart';
import '../../../../core/common/widgets/linha_formatada.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/producao_util.dart';
import '../../../../navigate/app_routes_names.dart';
import '../../../barril/domain/entities/barril_entity.dart';
import '../../../barril/presentation/providers/barril_notifier.dart';
import '../../../produto/domain/entities/tipo_produto_entity.dart';
import '../../../produto/presentation/providers/produto_notifier.dart';
import '../../domain/entities/producao_entity.dart';
import '../providers/producao_notifier.dart';

class ItemProducaoWidget extends ConsumerWidget {
  final ProducaoEntity producao;

  const ItemProducaoWidget({super.key, required this.producao});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(producaoProvider(gradeId: producao.gradeId).notifier);
    final produtos = ref.watch(produtoProvider).value ?? [];
    final barris = ref.watch(barrilProvider).value ?? [];

    final produto = produtos.cast<ProdutoEntity?>().firstWhere(
      (p) => p?.id == producao.produtoId,
      orElse: () => null,
    );

    final barril = barris.cast<BarrilEntity?>().firstWhere(
      (p) => p?.id == producao.barrilId,
      orElse: () => null,
    );

    final parametrosEditar = (producao: producao, barril: barril, produto: produto);

    final nomeProduto = produto?.nome ?? '';
    final nomeDimencionado = nomeProduto.length > 12
        ? '${nomeProduto.substring(0, 9)} ...'
        : nomeProduto;

    return Card(
      color: AppColors.lightSurface,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinhaFormatada(
                  valor: nomeDimencionado,
                  valorStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                LinhaFormatada(
                  valor: 'Barril de ${barril?.nome}',
                  valorStyle: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),

            Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Informações da produção
                IconButton(
                  icon: Icon(Icons.info, color: Colors.grey, size: 30),
                  onPressed: () =>
                      _infoProducao(context: context, produto: produto!, barril: barril!),
                ),

                // Excluir produção
                _deletar(context: context, notifier: notifier),

                // Editar produção
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue, size: 30),
                  onPressed: () {
                    context.push(AppRoutesNames.editarProducao, extra: parametrosEditar);
                  },
                ),

                // Compartilhar produção
                IconButton(
                  icon: Icon(Icons.share, color: Colors.purple, size: 30),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Share'),
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _deletar({required BuildContext context, required ProducaoNotifier notifier}) {
    return IconButton(
      icon: Icon(Icons.delete, color: Colors.red, size: 30),
      onPressed: () {
        if (producao.id != null) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Row(
                  children: [
                    Icon(Icons.warning, color: AppColors.primaryRed),
                    SizedBox(width: 4),
                    Text('Alerta!', style: TextStyle(color: AppColors.primaryDarkText)),
                  ],
                ),
                content: Text(
                  'Esta ação não pode ser revertida. Você realmente quer excluir esta Produção?',
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent),
                    child: Text('Cancelar', style: TextStyle(color: AppColors.primaryDarkText)),
                  ),
                  TextButton(
                    onPressed: () async {
                      notifier.deletar(gradeId: producao.gradeId, producaoId: producao.id!);
                      if (context.mounted) context.pop();
                    },
                    child: Text('Deletar', style: TextStyle(color: Colors.red)),
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }

  void _infoProducao({
    required BuildContext context,
    required ProdutoEntity produto,
    required BarrilEntity barril,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Center(
                  child: Text(produto.nome, style: TextStyle(fontWeight: FontWeight.w600)),
                ),
              ),
              Divider(),
              LinhaChaveValor(
                chave: 'Barril',
                chaveStyle: TextStyle(fontSize: 14),
                valor: barril.nome,
                valorStyle: TextStyle(fontSize: 14),
              ),
              Divider(),
              LinhaChaveValor(
                chave: 'Status',
                chaveStyle: TextStyle(fontSize: 14),
                valor: producao.status.label,
                valorStyle: TextStyle(fontSize: 14),
              ),
              Divider(),
              LinhaChaveValor(
                chave: 'Quantidade programada',
                chaveStyle: TextStyle(fontSize: 14),
                valor: producao.quantidadeProgramada.toString(),
                valorStyle: TextStyle(fontSize: 14),
              ),
              Divider(),
              LinhaChaveValor(
                chave: 'Quantidade produzida',
                chaveStyle: TextStyle(fontSize: 14),
                valor: producao.quantidadeProduzida.toString(),
                valorStyle: TextStyle(fontSize: 14),
              ),
              Divider(),
              LinhaChaveValor(
                chave: 'Quantidade pendente',
                chaveStyle: TextStyle(fontSize: 14),
                valor: producao.quantidadePendente.toString(),
                valorStyle: TextStyle(fontSize: 14),
              ),
              Divider(),
              LinhaChaveValor(
                chave: 'Volume necessário',
                chaveStyle: TextStyle(fontSize: 14),
                valor:
                    '${ProducaoUtil.calcularVolumeNecessario(producao.quantidadeProgramada, barril.volume)} hl',
                valorStyle: TextStyle(fontSize: 14),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Adicione sua lógica aqui para a ação principal
                Navigator.of(context).pop(); // Fecha o diálogo após a ação
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

}
