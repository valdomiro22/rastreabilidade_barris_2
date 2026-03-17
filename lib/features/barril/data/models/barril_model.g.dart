// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barril_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BarrilModel _$BarrilModelFromJson(Map<String, dynamic> json) => _BarrilModel(
  id: json['id'] as String?,
  nome: json['nome'] as String,
  volume: (json['volume'] as num).toInt(),
  isDescartavel: json['isDescartavel'] as bool,
);

Map<String, dynamic> _$BarrilModelToJson(_BarrilModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'volume': instance.volume,
      'isDescartavel': instance.isDescartavel,
    };
