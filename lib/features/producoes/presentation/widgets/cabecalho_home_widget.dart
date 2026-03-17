import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../barril/presentation/providers/barril_notifier.dart';
import '../../../produto/presentation/providers/produto_notifier.dart';
import '../../domain/entities/producao_entity.dart';

class CabecalhoHomeWidget extends ConsumerWidget {
  final ProducaoEntity producao;

  const CabecalhoHomeWidget({super.key, required this.producao});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final produtosById = {for (final p in (ref.watch(produtoProvider).value ?? [])) p.id!: p,};
    final barrisById = {for (final b in (ref.watch(barrilProvider).value ?? [])) b.id!: b};

    final produto = produtosById[producao.produtoId];
    final barril = barrisById[producao.barrilId];

    final titulo = '${produto?.nome ?? "Produto"} ${barril?.nome ?? "Barril"}';

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.blueStrong,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        titulo,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
