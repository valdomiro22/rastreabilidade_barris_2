import 'package:rastreabilidade_barris/core/di/usecasesproviders/anotacao_use_cases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'deletar_anotacao_notifier.g.dart';

@riverpod
class DeletarAnotacaoNotifier extends _$DeletarAnotacaoNotifier {
  @override
  AsyncValue build() => AsyncValue.data(null);

  Future<void> deletar({required String anotacaoId}) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      final useCase = ref.read(deleteAnotacaoUseCaseProvider);
      final result = await useCase(anotacaoId: anotacaoId);

      result.fold((failure) => failure, (_) => null);
    });
  }
}
