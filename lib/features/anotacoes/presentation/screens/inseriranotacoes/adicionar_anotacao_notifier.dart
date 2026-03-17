import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rastreabilidade_barris/features/anotacoes/presentation/screens/providers/anotacao_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../grades/domain/enums/turno.dart';
import '../../../domain/entity/anotacao_entity.dart';
import '../../../domain/enums/tipo_codigo.dart';

part 'adicionar_anotacao_notifier.freezed.dart';

part 'adicionar_anotacao_notifier.g.dart';

@riverpod
class AdicionarAnotacaoNotifier extends _$AdicionarAnotacaoNotifier {
  @override
  AdicionarAnotacaoState build() => AdicionarAnotacaoState.inicial();

  void inserirCodigo(String v) {
    state = state.copyWith(codigo: v);
  }

  Future<void> adicionar({
    required String gradeId,
    required String producaoId,
    required TipoCodigo tipoCodigo,
    String? codigo,
  }) async {
    final codigoFinal = codigo ?? state.codigo;

    if (codigoFinal.isEmpty) {
      state = state.copyWith(erro: 'Código inválido ou vazio');
      return;
    }

    state = state.copyWith(isLoading: true, erro: null);

    final anotacao = AnotacaoEntity(
      gradeId: gradeId,
      producaoId: producaoId,
      codigo: codigoFinal,
      usuarioId: 'usuarioId',
      // TODO: Injetar via AuthProvider
      nomeUsuario: 'nomeUsuario',
      // TODO: Injetar via AuthProvider
      turno: Turno.turnoA,
      // TODO: Calcular turno real
      data: DateTime.now(),
      horario: DateTime.now(),
      horarioId: 1500,
      // TODO: Calcular id real
      tipoCodigo: tipoCodigo,
    );

    try {
      await ref
          .read(anotacaoProvider(producaoId: producaoId).notifier)
          .adicionar(anotacao: anotacao);
      state = state.copyWith(isLoading: false, isSucess: true);
    } catch (e) {
      state = state.copyWith(isLoading: false, erro: e.toString());
    }
  }

  Future<void> lerCodigoBarras({required String gradeId, required String producaoId}) async {
    final link = ref.keepAlive();

    state = state.copyWith(isLoading: true);

    try {
      ScanResult result = await BarcodeScanner.scan();

      if (result.type == ResultType.Cancelled) {
        state = state.copyWith(isLoading: false);
        return;
      }

      String codigoLido = result.rawContent;

      if (codigoLido.isNotEmpty) {
        if (codigoLido.length > 18) {
          codigoLido = codigoLido.substring(0, 18);
        }

        state = state.copyWith(codigo: codigoLido);

        await adicionar(
          gradeId: gradeId,
          producaoId: producaoId,
          codigo: codigoLido,
          tipoCodigo: TipoCodigo.codigoBarras,
        );
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, erro: 'Erro ao ler código: $e');
    } finally {
      link.close();
    }
  }

  Future<void> lerQRCode({required String gradeId, required String producaoId}) async {
    final link = ref.keepAlive();

    state = state.copyWith(isLoading: true);

    try {
      ScanResult result = await BarcodeScanner.scan();

      if (result.type == ResultType.Cancelled) {
        state = state.copyWith(isLoading: false);
        return;
      }

      String codigoLido = result.rawContent;

      if (codigoLido.isNotEmpty) {
        if (codigoLido.length > 18) {
          codigoLido = codigoLido.substring(0, 18);
        }

        state = state.copyWith(codigo: codigoLido);

        await adicionar(
          gradeId: gradeId,
          producaoId: producaoId,
          codigo: codigoLido,
          tipoCodigo: TipoCodigo.qrCode,
        );
      } else {
        state = state.copyWith(isLoading: false);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, erro: 'Erro ao ler código: $e');
    } finally {
      link.close();
    }
  }
}

@freezed
sealed class AdicionarAnotacaoState with _$AdicionarAnotacaoState {
  const factory AdicionarAnotacaoState({
    @Default('') String codigo,
    String? erro,
    String? codigoErro,
    @Default(false) bool isLoading,
    @Default(false) bool isSucess,
    @Default(false) bool camposValidos,
  }) = _AdicionarAnotacaoState;

  factory AdicionarAnotacaoState.inicial() => const AdicionarAnotacaoState();
}
