import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/di/usecasesproviders/barril_use_cases.dart';
import '../../domain/entities/barril_entity.dart';

part 'barril_notifier.g.dart';

@riverpod
class BarrilNotifier extends _$BarrilNotifier {
  @override
  Future<List<BarrilEntity>> build() async {
    final useCase = ref.read(getAllBarrilsUseCaseProvider);
    final result = await useCase();
    return result.fold((failure) => throw failure, (lista) => lista);
  }

  Future<void> deletar(String barrilId) async {
    final useCase = ref.read(deleteBarrilUseCaseProvider);
    final result = await useCase(barrilId);

    result.fold((failure) => throw failure, (_) => ref.invalidateSelf());
  }

  Future<void> adicionar(BarrilEntity barril) async {
    final useCase = ref.read(insertBarrilUseCaseProvider);
    final result = await useCase(barril);

    result.fold((failure) => throw failure, (_) => ref.invalidateSelf());
  }

  Future<void> atualizar(BarrilEntity barril) async {
    final useCase = ref.read(updateBarrilUseCaseProvider);
    final result = await useCase(barril: barril);

    result.fold((failure) => throw failure, (_) => ref.invalidateSelf());
  }
}
