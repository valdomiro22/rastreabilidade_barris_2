import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../core/di/usecasesproviders/usuario_use_cases.dart';
import '../../../domain/entities/usuario_entity.dart';
import '../../buscarusuario/buscar_usuario_notifier.dart';

part 'atualizar_foto_notifier.g.dart';

@riverpod
class AtualizarFotoNotifier extends _$AtualizarFotoNotifier {
  @override
  AsyncValue build() => AsyncValue.data(null);

  Future<void> atualizar({required UsuarioEntity usuario}) async {
    final ImagePicker picker = ImagePicker();
    final XFile? fotoCapturada = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
      maxWidth: 1024,
      maxHeight: 1024,
    );

    if (fotoCapturada == null) return;

    final arquivoDaFoto = File(fotoCapturada.path);
    state = const AsyncLoading();

    final storageUseCase = ref.read(atualizarFotoPerfilUseCaseProvider);
    final atualizarUsuarioUseCase = ref.read(updateUsuarioUseCaseProvider);

    final storageResult = await storageUseCase(
      fotoNova: arquivoDaFoto,
      usuarioId: usuario.id!,
      fotoAntigaUrl: usuario.urlFotoPerfil,
    );

    storageResult.fold((failure) => failure, (novaUrl) async {
      if (novaUrl == null || novaUrl.isEmpty) return;

      final usuarioAtualizado = usuario.copyWith(urlFotoPerfil: novaUrl);

      final firestoreResult = await atualizarUsuarioUseCase(usuarioAtualizado);

      state = firestoreResult.fold((failure) => AsyncValue.error(failure, StackTrace.current), (_) {
        ref.invalidate(buscarUsuarioProvider);
        return AsyncValue.data(novaUrl);
      });
    });
  }
}
