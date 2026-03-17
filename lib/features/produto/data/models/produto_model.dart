import 'package:freezed_annotation/freezed_annotation.dart';

part 'produto_model.freezed.dart';
part 'produto_model.g.dart';

@freezed
sealed class ProdutoModel with _$ProdutoModel {
  const factory ProdutoModel({
    String? id,
    required String nome,
    required int prazoValidade,
}) = _ProdutoModel;

  factory ProdutoModel.fromJson(Map<String, dynamic> json) => _$ProdutoModelFromJson(json);

  const ProdutoModel._();

}
