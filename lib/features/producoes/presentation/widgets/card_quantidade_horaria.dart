import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/producao_entity.dart';
import '../screens/home/selecionar_turno_notifier.dart';

class CardQuantidadeHoraria extends ConsumerStatefulWidget {
  final String horario;
  final ProducaoEntity producao;

  const CardQuantidadeHoraria({super.key, required this.horario, required this.producao});

  @override
  ConsumerState<CardQuantidadeHoraria> createState() => _CardQuantidadeHorariaState();
}

class _CardQuantidadeHorariaState extends ConsumerState<CardQuantidadeHoraria> {
  final _qtController = TextEditingController();

  @override
  void dispose() {
    _qtController.dispose();
    super.dispose();
  }

  void _incrementar(int valor) {
    final atual = int.tryParse(_qtController.text) ?? 0;
    _qtController.text = (atual + valor).toString();
    _qtController.selection = TextSelection.fromPosition(
      TextPosition(offset: _qtController.text.length),
    );
  }

  void _subtrair(int valor) {
    // Pega o que está no campo (ex: 0) e subtrai o valor do chip (ex: 5)
    final atual = int.tryParse(_qtController.text) ?? 0;
    final op = atual - valor;

    // Agora o texto pode ser "-5"
    _qtController.text = op.toString();

    _qtController.selection = TextSelection.fromPosition(
      TextPosition(offset: _qtController.text.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    final producaoId = widget.producao.id ?? '';
    final gradeId = widget.producao.gradeId;
    final horarioInt = int.parse(widget.horario.replaceAll(':', ''));
    final params = (producaoId: producaoId, hrReferente: horarioInt);
    final turnoState = ref.watch(selecionarTurnoProvider);
    // final buscarState = ref.watch(
    //   streamQuantidadeSomadaProvider(
    //     producaoId: producaoId,
    //     horarioReferente: horarioInt,
    //     turnoNome: turnoState.turno.name,
    //   ),
    // );

    // final String qtBuscada = buscarState.when(
    //   loading: () => '...',
    //   error: (error, stackTrace) => '!',
    //   data: (quantidade) => quantidade.toString(),
    // );

    return GestureDetector(
      // onTap: () => _abrirDialog(context, params, gradeId, qtBuscada),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xffd2d6de)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.horario, style: const TextStyle(fontSize: 11, color: Colors.grey)),
            const SizedBox(height: 4),
            Text(
              '938',
              style: const TextStyle(
                color: Color(0xff0840a1),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _abrirDialog(BuildContext context, BuscarParams params, String gradeId, String qtBuscada) {
  //   _qtController.clear();
  //
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       content: SingleChildScrollView(
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Align(
  //               alignment: Alignment.topCenter,
  //               child: Column(
  //                 children: [
  //                   Text(
  //                     'Barris Produzidos',
  //                     style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  //                   ),
  //                   Text('Horário: ${widget.horario}'),
  //                 ],
  //               ),
  //             ),
  //             const SizedBox(height: 24),
  //
  //             TextField(
  //               controller: _qtController,
  //               autofocus: true,
  //               keyboardType: TextInputType.number,
  //               decoration: const InputDecoration(
  //                 hintText: 'Ex: 30',
  //                 labelText: 'Quantidade',
  //                 border: OutlineInputBorder(),
  //                 enabledBorder: OutlineInputBorder(
  //                   borderSide: BorderSide(color: Colors.green, width: 2),
  //                 ),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderSide: BorderSide(color: Colors.green, width: 2),
  //                 ),
  //               ),
  //             ),
  //             const SizedBox(height: 10),
  //             const SizedBox(height: 16),
  //             Align(
  //               alignment: Alignment.center,
  //               child: Wrap(
  //                 spacing: 8.0, // Espaço horizontal entre os chips
  //                 runSpacing: 8.0, // Espaço vertical entre as linhas de chips
  //                 alignment: WrapAlignment.center,
  //                 children: [
  //                   _chipIncremento(1),
  //                   _chipIncremento(5),
  //                   _chipIncremento(10),
  //                   _chipIncremento(20),
  //
  //                   _chipDecremento(1),
  //                   _chipDecremento(5),
  //                   _chipDecremento(10),
  //                   _chipDecremento(20),
  //                 ],
  //               ),
  //             ),
  //             const SizedBox(height: 16),
  //           ],
  //         ),
  //       ),
  //       actions: [
  //         TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancelar')),
  //         ElevatedButton(
  //           onPressed: () async {
  //             // 1. Parse do valor (pode vir positivo ou negativo)
  //             final qtAjuste = int.tryParse(_qtController.text) ?? 0;
  //
  //             if (qtAjuste == 0) {
  //               Navigator.pop(context);
  //               return;
  //             }
  //
  //             // Opcional: Validação para não deixar o total do horário ficar negativo
  //             final totalAtualNoCard = int.tryParse(qtBuscada) ?? 0;
  //             if (totalAtualNoCard + qtAjuste < 0) {
  //               // Aqui você pode colocar um SnackBar ou apenas ignorar
  //               return;
  //             }
  //
  //             // 2. Gravação no banco (Envia o ajuste, seja +10 ou -5)
  //             await ref
  //                 .read(inserirQuantidadeHorariaProvider(params.producaoId).notifier)
  //                 .inserirQuantidade(horario: widget.horario, quantidade: qtAjuste);
  //
  //             // 3. Atualizações de estado local (O total da produção também sofre o ajuste)
  //             final novaQuantidadeTotalProducao = widget.producao.quantidadeProduzida + qtAjuste;
  //             final statusProducao =
  //                 novaQuantidadeTotalProducao < widget.producao.quantidadeProgramada
  //                 ? StatusProducao.naoConcluida
  //                 : StatusProducao.concluida;
  //
  //             final producaoAtualizada = widget.producao.copyWith(
  //               quantidadeProduzida: novaQuantidadeTotalProducao,
  //               status: statusProducao,
  //             );
  //
  //             // Atualiza a lista geral
  //             await ref
  //                 .watch(
  //                   buscarProducaoProvider(
  //                     producaoId: widget.producao.id!,
  //                     gradeId: widget.producao.gradeId,
  //                   ).notifier,
  //                 )
  //                 .atualizar(
  //                   gradeId: gradeId,
  //                   producao: producaoAtualizada,
  //                   producaoId: producaoAtualizada.id!,
  //                 );
  //
  //             // 5. Fecha o Dialog
  //             if (context.mounted) {
  //               Navigator.of(context).pop();
  //             }
  //           },
  //           style: ElevatedButton.styleFrom(
  //             backgroundColor: Colors.green,
  //             padding: EdgeInsets.zero,
  //           ),
  //           child: const Text('OK'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _chipIncremento(int valor) {
  //   return ActionChip(
  //     side: BorderSide(color: AppColors.blueStrong),
  //     label: Text('+$valor', style: TextStyle(fontSize: 12, color: AppColors.blueStrong)),
  //     onPressed: () => _incrementar(valor),
  //   );
  // }
  //
  // Widget _chipDecremento(int valor) {
  //   return ActionChip(
  //     side: BorderSide(color: AppColors.red900),
  //     label: Text('-$valor', style: TextStyle(fontSize: 12, color: AppColors.red900)),
  //     onPressed: () => _subtrair(valor),
  //   );
  // }
}
