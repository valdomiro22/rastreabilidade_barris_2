import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/barril/domain/usecases/delete_barril_use_case.dart';
import '../../../features/barril/domain/usecases/get_all_barrils_use_case.dart';
import '../../../features/barril/domain/usecases/get_barril_use_case.dart';
import '../../../features/barril/domain/usecases/insert_barril_use_case.dart';
import '../../../features/barril/domain/usecases/update_barril_use_case.dart';
import '../firebaseproviders/firebase_providers.dart';

part 'barril_use_cases.g.dart';

@riverpod
InsertBarrilUseCase insertBarrilUseCase(Ref ref) {
  final repository = ref.read(barrilRepositoryProvider);
  return InsertBarrilUseCase(repository);
}

@riverpod
DeleteBarrilUseCase deleteBarrilUseCase(Ref ref) {
  final repository = ref.read(barrilRepositoryProvider);
  return DeleteBarrilUseCase(repository);
}

@riverpod
GetAllBarrilsUseCase getAllBarrilsUseCase(Ref ref) {
  final repository = ref.read(barrilRepositoryProvider);
  return GetAllBarrilsUseCase(repository);
}

@riverpod
GetBarrilUseCase getBarrilUseCase(Ref ref) {
  final repository = ref.read(barrilRepositoryProvider);
  return GetBarrilUseCase(repository);
}

@riverpod
UpdateBarrilUseCase updateBarrilUseCase(Ref ref) {
  final repository = ref.read(barrilRepositoryProvider);
  return UpdateBarrilUseCase(repository);
}
