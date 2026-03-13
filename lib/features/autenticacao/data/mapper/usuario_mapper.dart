import '../../domain/entities/usuario_entity.dart';
import '../model/usuario_model.dart';

extension UsuarioModelFromEntity on UsuarioModel {
  UsuarioEntity toEntity() {
    return UsuarioEntity(
      id: id,
      nome: nome,
      sobrenome: sobrenome,
      email: email,
      dataCriacao: dataCriacao,
      urlFotoPerfil: urlFotoPerfil,
    );
  }
}

extension UsuarioEntityFromModel on UsuarioEntity {
  UsuarioModel toModel() {
    return UsuarioModel(
      id: id,
      nome: nome,
      sobrenome: sobrenome,
      email: email,
      dataCriacao: dataCriacao,
      urlFotoPerfil: urlFotoPerfil,
    );
  }
}
