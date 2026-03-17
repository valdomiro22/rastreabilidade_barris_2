import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/producoes/domain/usecases/delete_producao_use_case.dart';
import '../../../features/producoes/domain/usecases/get_all_producoes_use_case.dart';
import '../../../features/producoes/domain/usecases/get_producao_use_case.dart';
import '../../../features/producoes/domain/usecases/insert_producao_use_case.dart';
import '../../../features/producoes/domain/usecases/update_producao_use_case.dart';
import '../firebaseproviders/firebase_providers.dart';

part 'producao_use_cases.g.dart';

@riverpod
InsertProducaoUseCase insertProducaoUseCase(Ref ref) {
  final repository = ref.read(producaoRepositoryProvider);
  return InsertProducaoUseCase(repository);
}

@riverpod
DeleteProducaoUseCase deleteProducaoUseCase(Ref ref) {
  final repository = ref.read(producaoRepositoryProvider);
  return DeleteProducaoUseCase(repository);
}

@riverpod
GetProducaoUseCase getProducaoUseCase(Ref ref) {
  final repository = ref.read(producaoRepositoryProvider);
  return GetProducaoUseCase(repository);
}

@riverpod
GetAllProducoesUseCase getAllProducoesUseCase(Ref ref) {
  final repository = ref.read(producaoRepositoryProvider);
  return GetAllProducoesUseCase(repository);
}

@riverpod
UpdateProducaoUseCase updateProducaoUseCase(Ref ref) {
  final repository = ref.read(producaoRepositoryProvider);
  return UpdateProducaoUseCase(repository);
}
