import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rastreabilidade_barris/core/common/widgets/carregando_widget.dart';
import 'package:rastreabilidade_barris/core/common/widgets/custom_buttom_widget.dart';
import 'package:rastreabilidade_barris/core/common/widgets/mensagem_erro_widget.dart';
import 'package:rastreabilidade_barris/core/constants/app_dimens.dart';
import 'package:rastreabilidade_barris/core/utils/string_util.dart';

import '../../../domain/entities/grade_entity.dart';
import 'editar_grade_notifier.dart';

class EditarGradeScreen extends ConsumerStatefulWidget {
  final GradeEntity gradeRecebida;

  const EditarGradeScreen({super.key, required this.gradeRecebida});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditarGradeScreenState();
}

class _EditarGradeScreenState extends ConsumerState<EditarGradeScreen> {
  final _numeroController = TextEditingController();
  DateTime? _dataSelecionada;

  @override
  void initState() {
    super.initState();

    _numeroController.text = widget.gradeRecebida.numeroGrade.toString();
    _dataSelecionada = widget.gradeRecebida.data;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notifier = ref.read(editarGradeProvider.notifier);
      notifier.inserirNumero(widget.gradeRecebida.numeroGrade.toString());
      notifier.inserirData(_dataSelecionada!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(editarGradeProvider);
    final notifier = ref.watch(editarGradeProvider.notifier);

    ref.listen(editarGradeProvider, (previous, next) {
      if (next.isSucess) {
        _numeroController.clear();
        context.pop();
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text('Editar Grade')),
      body: Container(
        padding: EdgeInsets.all(AppDimens.paddingPagina),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Número da Grade'),
            TextField(
              controller: _numeroController,
              decoration: InputDecoration(hintText: 'Ex: 01'),
              onChanged: (v) => notifier.inserirNumero(v),
            ),
            if (state.erroNumero != null) MensagemErroWidget(mensagem: state.erroNumero),
            SizedBox(height: 16),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () async {
                final DateTime? picker = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );

                if (picker != null && picker != _dataSelecionada) {
                  setState(() {
                    _dataSelecionada = picker;
                    notifier.inserirData(_dataSelecionada!);
                  });
                }
              },
              child: Text(
                _dataSelecionada == null
                    ? 'Selecione a data'
                    : 'Data ${StringUtil.formatarData(_dataSelecionada?.toIso8601String())}',
              ),
            ),
            if (state.isLoading) CarregandoWidget(),
            SizedBox(height: 16),

            CustomButtomWidget(
              clique: () {
                final grade = widget.gradeRecebida;
                notifier.editarGrade(grade: grade);
              },
              texto: 'Salva',
            ),
          ],
        ),
      ),
    );
  }
}
