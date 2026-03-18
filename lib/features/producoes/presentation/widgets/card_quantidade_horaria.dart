import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/producao_entity.dart';

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
}
