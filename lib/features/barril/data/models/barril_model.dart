import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'barril_model.freezed.dart';
part 'barril_model.g.dart';

@freezed
sealed class BarrilModel with _$BarrilModel {
  const factory BarrilModel({
    String? id,
    required String nome,
    required int volume,
    required bool isDescartavel,
  }) = _BarrilModel;

  factory BarrilModel.fromJson(Map<String, dynamic> json) => _$BarrilModelFromJson(json);

  const BarrilModel._();
}
