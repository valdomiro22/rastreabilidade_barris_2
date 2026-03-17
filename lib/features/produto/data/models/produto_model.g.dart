// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProdutoModel _$ProdutoModelFromJson(Map<String, dynamic> json) =>
    _ProdutoModel(
      id: json['id'] as String?,
      nome: json['nome'] as String,
      prazoValidade: (json['prazoValidade'] as num).toInt(),
    );

Map<String, dynamic> _$ProdutoModelToJson(_ProdutoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'prazoValidade': instance.prazoValidade,
    };
