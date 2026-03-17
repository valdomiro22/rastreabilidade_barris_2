import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../../core/utils/string_util.dart';
import '../../../../barril/domain/entities/barril_entity.dart';
import '../../../../barril/presentation/providers/barril_notifier.dart';
import '../../../../grades/domain/entities/grade_entity.dart';
import '../../../../grades/presentation/providers/buscar_uma_grade_notifier.dart';
import '../../../../produto/presentation/providers/produto_notifier.dart';
import '../../../domain/entities/producao_entity.dart';
import '../../providers/producao_notifier.dart';

class RelatorioScreen extends ConsumerStatefulWidget {
  final String gradeId;

  const RelatorioScreen({super.key, required this.gradeId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RelatorioScreenState();
}

class _RelatorioScreenState extends ConsumerState<RelatorioScreen> {
  final hoje = StringUtil.formatarData(DateTime.now().toIso8601String());

  void _escreverBlocoProducao(StringBuffer buffer, BarrilEntity baril, ProducaoEntity p) {
    final programada = p.quantidadeProgramada;
    final produzida = p.quantidadeProduzida;
    final pendente = p.quantidadePendente;
    final icone = produzida < programada ? "❌" : "✅";

    buffer.writeln('*${baril.nome}*');
    buffer.writeln('Programado: $programada ✅');
    buffer.writeln('Produzido: $produzida $icone');
    buffer.writeln('Pendente: $pendente $icone');
    buffer.writeln('');
  }

  void _blocoProducaoZerado(StringBuffer buffer, BarrilEntity baril) {
    buffer.writeln('*${baril.nome}*');
    buffer.writeln('Programado: 0 ✅');
    buffer.writeln('');
  }

  String _gerarMensagemRelatorio(GradeEntity grade, List<ProducaoEntity> lista) {
    final data = StringUtil.formatarData(grade.data.toIso8601String());
    final buffer = StringBuffer();

    final producaoPorProduto = <String, Map<String, ProducaoEntity>>{};
    for (final producao in lista) {
      producaoPorProduto.putIfAbsent(producao.produtoId, () => {});
      producaoPorProduto[producao.produtoId]![producao.barrilId] = producao;
    }

    final produtos = ref.watch(produtoProvider).value ?? [];
    final barris = ref.read(barrilProvider).value ?? [];

    buffer.writeln('*PRODUÇÃO - $data*');
    buffer.writeln('Grade: ${grade.numeroGrade}');
    buffer.writeln('');

    for (var i = 0; i < produtos.length; i++) {
      final produto = produtos[i];

      buffer.writeln(produto.nome.toUpperCase());
      buffer.writeln('Estabilidade ✅'); // TODO - tornar isso dinamico e editavel
      buffer.writeln('');

      for (final tipo in barris) {
        final producao = producaoPorProduto[produto.id]?[tipo.id];

        if (producao != null) {
          _escreverBlocoProducao(buffer, tipo, producao);
        } else {
          _blocoProducaoZerado(buffer, tipo);
        }
      }

      if (i < produtos.length - 1) {
        buffer.writeln('➖➖➖➖➖➖➖➖➖\n');
      }
    }

    return buffer.toString().trim();
  }

  Future<void> _copiarMensagem(GradeEntity grade, List<ProducaoEntity> lista) async {
    final msg = _gerarMensagemRelatorio(grade, lista);
    await Clipboard.setData(ClipboardData(text: msg));

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Relatório comiado!'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _compartilharMensagem(GradeEntity grade, List<ProducaoEntity> lista) async {
    final msg = _gerarMensagemRelatorio(grade, lista);
    await Share.share(msg, subject: 'Relatório de Produção');
  }

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final gradeState = ref.watch(buscarUmaGradeProvider(gradeId: widget.gradeId));

    final listaProducoes = ref.watch(producaoProvider(gradeId: widget.gradeId));
    final lista = listaProducoes.value ?? [];

    return Scaffold(
      appBar: AppBar(title: Text('Gerar relatorio')),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: gradeState.when(
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Erro: $error')),
          data: (grade) {
            final texto = _gerarMensagemRelatorio(grade, lista);

            return Stack(
              children: [
                SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(texto),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: altura / 3,
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          await _compartilharMensagem(grade, lista);
                        },
                        icon: Icon(Icons.share),
                      ),
                      SizedBox(height: 8),
                      IconButton(
                        onPressed: () async {
                          await _copiarMensagem(grade, lista);
                        },
                        icon: Icon(Icons.copy),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
