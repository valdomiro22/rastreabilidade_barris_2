import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rastreabilidade_barris/features/producoes/domain/entities/producao_entity.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/enums/tipo_codigo.dart';
import '../screens/inseriranotacoes/adicionar_anotacao_notifier.dart';

class AdicionarNotaWidget extends ConsumerWidget {
  final ProducaoEntity producao;

  const AdicionarNotaWidget({super.key, required this.producao});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adicionarNotifier = ref.watch(adicionarAnotacaoProvider.notifier);

    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Digitar codigo
          _digitarCodigo(adicionarNotifier, context),
          SizedBox(width: 24),

          // QR Code
          _lerQRCode(adicionarNotifier),
          SizedBox(width: 24),

          // Código be barras
          _lerCodigoBarras(adicionarNotifier),
        ],
      ),
    );
  }

  Widget _lerCodigoBarras(AdicionarAnotacaoNotifier notifier) {
    return ElevatedButton(
      onPressed: () {
        final gradeId = producao.gradeId;
        final producaoId = producao.id!;
        notifier.lerCodigoBarras(gradeId: gradeId, producaoId: producaoId);
      },
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.blueStrong),
      child: Icon(MdiIcons.barcode, size: 40),
    );
  }

  Widget _lerQRCode(AdicionarAnotacaoNotifier notifier) {
    return ElevatedButton(
      onPressed: () {
        final gradeId = producao.gradeId;
        final producaoId = producao.id!;
        notifier.lerQRCode(gradeId: gradeId, producaoId: producaoId);
      },
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.blueStrong),
      child: Icon(Icons.qr_code, size: 40),
    );
  }

  Widget _digitarCodigo(AdicionarAnotacaoNotifier notifier, BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            final docigoController = TextEditingController();

            return AlertDialog(
              title: Column(
                children: [
                  TextField(
                    autofocus: true,
                    controller: docigoController,
                    decoration: InputDecoration(labelText: 'Código', hintText: 'Codigo produto'),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final gradeId = producao.gradeId;
                        final producaoId = producao.id!;

                        final codigo = docigoController.text;
                        notifier.adicionar(
                          gradeId: gradeId,
                          producaoId: producaoId,
                          codigo: codigo,
                          tipoCodigo: TipoCodigo.anotacao,
                        );

                        // ref.read(buscarAnotacoesProvider.notifier)
                        //     .buscarAll(gradeId: gradeId, producaoId: producaoId);

                        // Quantidades na produção
                        final qtProduzida = producao.quantidadeProduzida + 1;
                        final producaoAtualizada = producao.copyWith(
                          quantidadeProduzida: qtProduzida,
                        );

                        // await ref
                        //     .read(listaProducoesProvider.notifier)
                        //     .atualizarProducao(
                        //       gradeId: gradeId,
                        //       producaoId: producaoId,
                        //       producao: producaoAtualizada,
                        //     );
                        // ref
                        //     .read(buscarProducaoProvider.notifier)
                        //     .atualizarEstadoLocal(producaoAtualizada);

                        // 3. Atualiza o card específico
                        // ref.invalidate(buscarQtHorariaProvider());

                        if (context.mounted) context.pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Adicionou'),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryRed),
                      child: const Text('Adicionar', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.blueStrong),
      child: Icon(Icons.edit, size: 40),
    );
  }
}
