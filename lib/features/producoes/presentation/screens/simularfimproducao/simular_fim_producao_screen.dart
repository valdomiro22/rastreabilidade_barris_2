import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rastreabilidade_barris/features/producoes/presentation/screens/simularfimproducao/simular_fim_producao_notifier.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/producao_util.dart';
import '../../../../../core/utils/produto_barril_helper.dart';
import '../../../../grades/presentation/widgets/mensagem_aviso_buffer.dart';
import '../../../domain/entities/producao_entity.dart';
import '../../providers/buscar_producao_notifier.dart';
import '../../widgets/linha_nome_valor.dart';

class SimularFimProducaoScreen extends ConsumerStatefulWidget {
  final ProducaoEntity producao;

  const SimularFimProducaoScreen({super.key, required this.producao});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StatusProducaoScreenState();
}

class _StatusProducaoScreenState extends ConsumerState<SimularFimProducaoScreen> {
  final _qtProduzidaController = TextEditingController();
  final _nivelController = TextEditingController();
  final _qtProgramadaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final producaoId = widget.producao.id!;
    final gradeId = widget.producao.gradeId;
    final producaoState = ref.watch(
      buscarProducaoProvider(producaoId: producaoId, gradeId: gradeId),
    );
    final formState = ref.watch(simularFimProducaoProvider);
    final formNotifier = ref.watch(simularFimProducaoProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text('Simular fim da Produção', style: TextStyle(fontSize: 24))),
      body: producaoState.when(
        error: (error, stackTrace) => Center(child: Text('Produção não encontrada')),
        loading: () => Center(child: CircularProgressIndicator()),
        data: (producao) {
          final produto = ref.produtoPorId(producao.produtoId);
          final barril = ref.barrilPorId(producao.barrilId);
          final volumeNecessario = ProducaoUtil.calcularVolumeNecessario(
            producao.quantidadePendente,
            barril!.volume,
          );

          final volume = formState.isSucess ? formState.vlNecessario : volumeNecessario;

          return SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cabeçalho
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.blueStrong,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${produto!.nome} ${barril.nome}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Quantidade programada
                SizedBox(width: double.infinity, child: Text('Quantidade programada')),
                TextField(
                  controller: _qtProgramadaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Ex: 450'),
                  onChanged: (v) => formNotifier.inserirQtProgramada(v),
                ),
                SizedBox(height: 10),

                // Quantidade produzida
                SizedBox(width: double.infinity, child: Text('Quantidade de barris produzidos')),
                TextField(
                  controller: _qtProduzidaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Ex: 382'),
                  onChanged: (v) => formNotifier.inserirQtProduzida(v),
                ),
                SizedBox(height: 10),

                // Nível
                SizedBox(width: double.infinity, child: Text('Nível maximo do Buffer')),
                TextField(
                  controller: _nivelController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Ex: 38'),
                  onChanged: (v) => formNotifier.inserirNivel(v),
                ),
                SizedBox(height: 16),

                // Botão calcular
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      final programado = int.tryParse(_qtProgramadaController.text.trim()) ?? 0;
                      final produzido = int.tryParse(_qtProduzidaController.text.trim()) ?? 0;
                      final nivelMax = int.tryParse(_nivelController.text.trim()) ?? 0;
                      final vlBarril = barril.volume;

                      formNotifier.calcular(
                        programado: programado,
                        produzido: produzido,
                        nivelMax: nivelMax,
                        vlBarril: vlBarril,
                      );
                    },
                    child: Text('Simular'),
                  ),
                ),
                SizedBox(height: 16),

                LinhaNomeValor(
                  texto: 'Tipo do barril',
                  quantidade: barril.nome,
                  corDeFundo: AppColors.blueStrong,
                  corValor: Colors.white,
                  corTexto: Colors.white,
                ),
                const SizedBox(height: 4),

                LinhaNomeValor(
                  texto: 'Volume necessário',
                  corTexto: Colors.white,
                  quantidade: '${volume.toStringAsFixed(1)} hl',
                  corValor: Colors.white,
                  corDeFundo: AppColors.blueStrong,
                ),
                const SizedBox(height: 16),

                Center(
                  child: MensagemAvisoBuffer(
                    vlNecessario: volumeNecessario,
                    vlMaximoTanque: formState.nivelMax,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
