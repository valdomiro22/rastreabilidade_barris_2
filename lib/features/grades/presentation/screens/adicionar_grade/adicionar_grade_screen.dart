import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rastreabilidade_barris/core/common/widgets/carregando_widget.dart';
import 'package:rastreabilidade_barris/core/common/widgets/custom_buttom_widget.dart';
import 'package:rastreabilidade_barris/core/common/widgets/custom_textfiewd_sem_icone.dart';
import 'package:rastreabilidade_barris/core/common/widgets/mensagem_erro_widget.dart';
import 'package:rastreabilidade_barris/core/utils/string_util.dart';

import 'adicionar_grade_notifier.dart';

class AdicionarGradeScreen extends ConsumerStatefulWidget {
  const AdicionarGradeScreen({super.key});

  @override
  ConsumerState<AdicionarGradeScreen> createState() => _AdicionarGradeScreenState();
}

class _AdicionarGradeScreenState extends ConsumerState<AdicionarGradeScreen> {
  final _numeroController = TextEditingController();
  DateTime? _dataSelecionada;

  @override
  void dispose() {
    super.dispose();
    _numeroController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(adicionarGradeProvider);
    final notifier = ref.watch(adicionarGradeProvider.notifier);

    ref.listen(adicionarGradeProvider, (previous, next) {
      if (next.isSucess) {
        _numeroController.clear();
        context.pop();
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Grade')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextfiewdSemIcone(
              controller: _numeroController,
              label: 'Número da Grade',
              inputType: TextInputType.number,
              onChanged: (v) => notifier.setNumeroGrade(v),
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
                    notifier.inserirData(picker);
                  });
                }
              },
              child: Text(
                _dataSelecionada == null
                    ? 'Selecione a data'
                    : 'Data ${StringUtil.formatarData(_dataSelecionada?.toIso8601String())}',
              ),
            ),
            if (state.erroData != null) MensagemErroWidget(mensagem: state.erroData),
            if (state.isLoading) CarregandoWidget(),
            SizedBox(height: 20),

            CustomButtomWidget(texto: 'Salvar', clique: () => notifier.inserirGrade()),
          ],
        ),
      ),
    );
  }
}
