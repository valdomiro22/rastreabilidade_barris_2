import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rastreabilidade_barris/features/anotacoes/data/datasources/anotacao_datasource.dart';
import 'package:rastreabilidade_barris/features/anotacoes/data/datasources/anotacao_datasource_impl.dart';
import 'package:rastreabilidade_barris/features/anotacoes/data/repositories/anotacao_repository_impl.dart';
import 'package:rastreabilidade_barris/features/anotacoes/domain/repositories/aotacao_repository.dart';
import 'package:rastreabilidade_barris/features/autenticacao/data/datasource/usuario_datasource.dart';
import 'package:rastreabilidade_barris/features/grades/data/datasources/grade_datasource.dart';
import 'package:rastreabilidade_barris/features/grades/data/datasources/grade_datasource_impl.dart';
import 'package:rastreabilidade_barris/features/grades/data/mapper/grade_mapper.dart';
import 'package:rastreabilidade_barris/features/grades/data/repositories/grade_repository_impl.dart';
import 'package:rastreabilidade_barris/features/grades/domain/repositories/grade_repository.dart';
// import 'package:gestao_producao_chopp/features/barril/data/datasource/barrio_datasource_impl.dart';
// import 'package:gestao_producao_chopp/features/barril/data/datasource/barril_datasource.dart';
// import 'package:gestao_producao_chopp/features/barril/data/repositories/barril_repository_impl.dart';
// import 'package:gestao_producao_chopp/features/barril/domain/repositories/tipo_barril_repository.dart';
// import 'package:gestao_producao_chopp/features/configuracoes/data/models/configuracoes_local_model.dart';
// import 'package:gestao_producao_chopp/features/grades/data/datasources/grade_datasource.dart';
// import 'package:gestao_producao_chopp/features/grades/data/datasources/grade_datasource_impl.dart';
// import 'package:gestao_producao_chopp/features/grades/data/mapper/grade_mapper.dart';
// import 'package:gestao_producao_chopp/features/grades/data/repositories/grade_repository_impl.dart';
// import 'package:gestao_producao_chopp/features/grades/domain/repositories/grade_repository.dart';
// import 'package:gestao_producao_chopp/features/producoes/data/datasource/producao_datasource.dart';
// import 'package:gestao_producao_chopp/features/producoes/data/datasource/producao_datasource_impl.dart';
// import 'package:gestao_producao_chopp/features/producoes/data/repository/producao_repository_impl.dart';
// import 'package:gestao_producao_chopp/features/producoes/domain/repository/producao_repository.dart';
// import 'package:gestao_producao_chopp/features/produto/data/datasource/produto_datasource.dart';
// import 'package:gestao_producao_chopp/features/produto/data/datasource/produto_datasource_impl.dart';
// import 'package:gestao_producao_chopp/features/produto/data/repositories/produto_repository_impl.dart';
// import 'package:gestao_producao_chopp/features/produto/domain/repositories/produto_repository.dart';
// import 'package:gestao_producao_chopp/features/quantidadehoraria/data/datasource/quantidade_horaria_datasource.dart';
// import 'package:gestao_producao_chopp/features/quantidadehoraria/data/datasource/quantidade_horaria_datasource_impl.dart';
// import 'package:gestao_producao_chopp/features/quantidadehoraria/data/repositories/quantidade_horaria_repository_impl.dart';
// import 'package:gestao_producao_chopp/features/quantidadehoraria/domain/entities/quantidade_horaria_entity.dart';
// import 'package:gestao_producao_chopp/features/quantidadehoraria/domain/repositories/quantidade_horaria_repository.dart';
// import 'package:hive_ce/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/autenticacao/data/datasource/auth_remote_datasource.dart';
import '../../../features/autenticacao/data/datasource/auth_remote_datasource_impl.dart';
import '../../../features/autenticacao/data/datasource/usuario_datasource_impl.dart';
import '../../../features/autenticacao/data/datasource/usuario_storage_datasource.dart';
import '../../../features/autenticacao/data/datasource/usuario_storage_datasource_impl.dart';
import '../../../features/autenticacao/data/repository/auth_repository_impl.dart';
import '../../../features/autenticacao/data/repository/usuario_repository_impl.dart';
import '../../../features/autenticacao/data/repository/usuario_storage_repository_impl.dart';
import '../../../features/autenticacao/domain/repositories/auth_repository.dart';
import '../../../features/autenticacao/domain/repositories/usuario_repository.dart';
import '../../../features/autenticacao/domain/repositories/usuario_storage_repository.dart';
import '../../../features/barril/data/datasource/barril_datasource.dart';
import '../../../features/barril/data/datasource/barrio_datasource_impl.dart';
import '../../../features/barril/data/repositories/barril_repository_impl.dart';
import '../../../features/barril/domain/repositories/tipo_barril_repository.dart';
import '../../../features/producoes/data/datasource/producao_datasource.dart';
import '../../../features/producoes/data/datasource/producao_datasource_impl.dart';
import '../../../features/producoes/data/repository/producao_repository_impl.dart';
import '../../../features/producoes/domain/repository/producao_repository.dart';
import '../../../features/produto/data/datasource/produto_datasource.dart';
import '../../../features/produto/data/datasource/produto_datasource_impl.dart';
import '../../../features/produto/data/repositories/produto_repository_impl.dart';
import '../../../features/produto/domain/repositories/produto_repository.dart';
// import '../../../features/configuracoes/data/datasource/local/configuracoes_local_datasource.dart';
// import '../../../features/configuracoes/data/datasource/local/configuracoes_local_datasource_impl.dart';
// import '../../../features/configuracoes/data/datasource/remote/configuracoes_remote_datasource.dart';
// import '../../../features/configuracoes/data/datasource/remote/configuracoes_remote_datasource_impl.dart';
// import '../../../features/configuracoes/data/repositories/configuracoes_repository_impl.dart';
// import '../../../features/configuracoes/domain/repositories/configuracoes_repository.dart';

part 'firebase_providers.g.dart';

// Firegase -------------------------------------------------------------------
@riverpod
FirebaseAuth firebaseAuth(Ref ref) {
  return FirebaseAuth.instance;
}

@riverpod
FirebaseFirestore firebaseFirestore(Ref ref) {
  return FirebaseFirestore.instance;
}

@riverpod
FirebaseStorage firebaseStorage(Ref ref) {
  return FirebaseStorage.instance;
}

// datasource ------------------------------------------------------------------
@riverpod
UsuarioDatasource usuarioDatasource(Ref ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  return UsuarioDatasourceImpl(firestore);
}

@riverpod
AuthRemoteDatasource authRemoteDatasource(Ref ref) {
  final auth = ref.watch(firebaseAuthProvider);
  return AuthRemoteDatasourceImpl(auth);
}

@riverpod
UsuarioStorageDatasource usuarioStorageDatasource(Ref ref) {
  final storage = ref.watch(firebaseStorageProvider);
  return UsuarioStorageDatasourceImpl(storage);
}

@riverpod
GradeDatasource gradeDatasource(Ref ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  return GradeDatasourceImpl(firestore);
}

@riverpod
ProducaoDatasource producaoDatasource(Ref ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  return ProducaoDatasourceImpl(firestore);
}

@riverpod
BarrilDatasource barrilDatasource(Ref ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  return BarrilDatasourceImpl(firestore);
}

@riverpod
ProdutoDatasource produtoDatasource(Ref ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  return ProdutoDatasourceImpl(firestore);
}

@riverpod
AnotacaoDatasource anotacaoDatasource(Ref ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  return AnotacaoDatasourceImpl(firestore);
}

// @riverpod
// ConfiguracoesLocalDatasource configuracoesLocalDatasource(Ref ref) {
//   final box = ref.watch(configuracoesBoxHiveProvider);
//   return ConfiguracoesLocalDatasourceImpl(box);
// }

// @riverpod
// ConfiguracoesRemoteDatasource configuracoesRemoteDatasource(Ref ref) {
//   final firestore = ref.watch(firebaseFirestoreProvider);
//   return ConfiguracoesRemoteDatasourceImpl(firestore);
// }

// @riverpod
// QuantidadeHorariaDatasource quantidadeHorariaDatasource(Ref ref) {
//   final firestore = ref.watch(firebaseFirestoreProvider);
//   return QuantidadeHorariaDatasourceImpl(firestore);
// }

// // repository ------------------------------------------------------------------
@riverpod
UsuarioRepository usuarioRepository(Ref ref) {
  final dataSouce = ref.watch(usuarioDatasourceProvider);
  return UsuarioRepositoryImpl(dataSouce);
}

@riverpod
AuthRepository authRepository(Ref ref) {
  final dataSource = ref.watch(authRemoteDatasourceProvider);
  return AuthRepositoryImpl(dataSource);
}

@riverpod
UsuarioStorageRepository usuarioStorageRepository(Ref ref) {
  final datasource = ref.watch(usuarioStorageDatasourceProvider);
  return UsuarioStorageRepositoryImpl(datasource);
}

@riverpod
GradeRepository gradeRepository(Ref ref) {
  final dataSource = ref.watch(gradeDatasourceProvider);
  final mapper = GradeMapper();
  return GradeRepositoryImpl(dataSource, mapper);
}

@riverpod
ProducaoRepository producaoRepository(Ref ref) {
  final dataSource = ref.watch(producaoDatasourceProvider);
  return ProducaoRepositoryImpl(dataSource);
}

@riverpod
BarrilRepository barrilRepository(Ref ref) {
  final dataSource = ref.watch(barrilDatasourceProvider);
  return BarrilRepositoryImpl(dataSource);
}

@riverpod
ProdutoRepository produtoRepository(Ref ref) {
  final dataSource = ref.watch(produtoDatasourceProvider);
  return ProdutoRepositoryImpl(dataSource);
}

@riverpod
AnotacaoRepository anotacaoRepository(Ref ref) {
  final datasource = ref.watch(anotacaoDatasourceProvider);
  return AnotacaoRepositoryImpl(datasource);
}

// @riverpod
// ConfiguracoesRepository configuracoesRepository(Ref ref) {
//   final remote = ref.watch(configuracoesRemoteDatasourceProvider);
//   final local = ref.watch(configuracoesLocalDatasourceProvider);
//   return ConfiguracoesRepositoryImpl(remote, local);
// }

// @riverpod
// QuantidadeHorariaRepository quantidadeHorariaRepository(Ref ref) {
//   final dataSource = ref.watch(quantidadeHorariaDatasourceProvider);
//   return QuantidadeHorariaRepositoryImpl(dataSource);
// }