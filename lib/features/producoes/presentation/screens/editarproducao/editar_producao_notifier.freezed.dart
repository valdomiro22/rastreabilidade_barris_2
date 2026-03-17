// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editar_producao_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EditarProducaoState {

 String? get produtoId; String? get barrilId; String? get quantidade; int get ordem; int get codigo; String get horarioReferente; DateTime? get data; String? get erro; String? get erroProduto; String? get erroBarril; String? get erroQuantidade; String? get erroOrdem; String? get erroCodigo; String? get erroGeral; String? get erroData; bool get isLoading; bool get isSucess; bool get camposValidos;
/// Create a copy of EditarProducaoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditarProducaoStateCopyWith<EditarProducaoState> get copyWith => _$EditarProducaoStateCopyWithImpl<EditarProducaoState>(this as EditarProducaoState, _$identity);

  /// Serializes this EditarProducaoState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditarProducaoState&&(identical(other.produtoId, produtoId) || other.produtoId == produtoId)&&(identical(other.barrilId, barrilId) || other.barrilId == barrilId)&&(identical(other.quantidade, quantidade) || other.quantidade == quantidade)&&(identical(other.ordem, ordem) || other.ordem == ordem)&&(identical(other.codigo, codigo) || other.codigo == codigo)&&(identical(other.horarioReferente, horarioReferente) || other.horarioReferente == horarioReferente)&&(identical(other.data, data) || other.data == data)&&(identical(other.erro, erro) || other.erro == erro)&&(identical(other.erroProduto, erroProduto) || other.erroProduto == erroProduto)&&(identical(other.erroBarril, erroBarril) || other.erroBarril == erroBarril)&&(identical(other.erroQuantidade, erroQuantidade) || other.erroQuantidade == erroQuantidade)&&(identical(other.erroOrdem, erroOrdem) || other.erroOrdem == erroOrdem)&&(identical(other.erroCodigo, erroCodigo) || other.erroCodigo == erroCodigo)&&(identical(other.erroGeral, erroGeral) || other.erroGeral == erroGeral)&&(identical(other.erroData, erroData) || other.erroData == erroData)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSucess, isSucess) || other.isSucess == isSucess)&&(identical(other.camposValidos, camposValidos) || other.camposValidos == camposValidos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,produtoId,barrilId,quantidade,ordem,codigo,horarioReferente,data,erro,erroProduto,erroBarril,erroQuantidade,erroOrdem,erroCodigo,erroGeral,erroData,isLoading,isSucess,camposValidos);

@override
String toString() {
  return 'EditarProducaoState(produtoId: $produtoId, barrilId: $barrilId, quantidade: $quantidade, ordem: $ordem, codigo: $codigo, horarioReferente: $horarioReferente, data: $data, erro: $erro, erroProduto: $erroProduto, erroBarril: $erroBarril, erroQuantidade: $erroQuantidade, erroOrdem: $erroOrdem, erroCodigo: $erroCodigo, erroGeral: $erroGeral, erroData: $erroData, isLoading: $isLoading, isSucess: $isSucess, camposValidos: $camposValidos)';
}


}

/// @nodoc
abstract mixin class $EditarProducaoStateCopyWith<$Res>  {
  factory $EditarProducaoStateCopyWith(EditarProducaoState value, $Res Function(EditarProducaoState) _then) = _$EditarProducaoStateCopyWithImpl;
@useResult
$Res call({
 String? produtoId, String? barrilId, String? quantidade, int ordem, int codigo, String horarioReferente, DateTime? data, String? erro, String? erroProduto, String? erroBarril, String? erroQuantidade, String? erroOrdem, String? erroCodigo, String? erroGeral, String? erroData, bool isLoading, bool isSucess, bool camposValidos
});




}
/// @nodoc
class _$EditarProducaoStateCopyWithImpl<$Res>
    implements $EditarProducaoStateCopyWith<$Res> {
  _$EditarProducaoStateCopyWithImpl(this._self, this._then);

  final EditarProducaoState _self;
  final $Res Function(EditarProducaoState) _then;

/// Create a copy of EditarProducaoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? produtoId = freezed,Object? barrilId = freezed,Object? quantidade = freezed,Object? ordem = null,Object? codigo = null,Object? horarioReferente = null,Object? data = freezed,Object? erro = freezed,Object? erroProduto = freezed,Object? erroBarril = freezed,Object? erroQuantidade = freezed,Object? erroOrdem = freezed,Object? erroCodigo = freezed,Object? erroGeral = freezed,Object? erroData = freezed,Object? isLoading = null,Object? isSucess = null,Object? camposValidos = null,}) {
  return _then(_self.copyWith(
produtoId: freezed == produtoId ? _self.produtoId : produtoId // ignore: cast_nullable_to_non_nullable
as String?,barrilId: freezed == barrilId ? _self.barrilId : barrilId // ignore: cast_nullable_to_non_nullable
as String?,quantidade: freezed == quantidade ? _self.quantidade : quantidade // ignore: cast_nullable_to_non_nullable
as String?,ordem: null == ordem ? _self.ordem : ordem // ignore: cast_nullable_to_non_nullable
as int,codigo: null == codigo ? _self.codigo : codigo // ignore: cast_nullable_to_non_nullable
as int,horarioReferente: null == horarioReferente ? _self.horarioReferente : horarioReferente // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DateTime?,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,erroProduto: freezed == erroProduto ? _self.erroProduto : erroProduto // ignore: cast_nullable_to_non_nullable
as String?,erroBarril: freezed == erroBarril ? _self.erroBarril : erroBarril // ignore: cast_nullable_to_non_nullable
as String?,erroQuantidade: freezed == erroQuantidade ? _self.erroQuantidade : erroQuantidade // ignore: cast_nullable_to_non_nullable
as String?,erroOrdem: freezed == erroOrdem ? _self.erroOrdem : erroOrdem // ignore: cast_nullable_to_non_nullable
as String?,erroCodigo: freezed == erroCodigo ? _self.erroCodigo : erroCodigo // ignore: cast_nullable_to_non_nullable
as String?,erroGeral: freezed == erroGeral ? _self.erroGeral : erroGeral // ignore: cast_nullable_to_non_nullable
as String?,erroData: freezed == erroData ? _self.erroData : erroData // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSucess: null == isSucess ? _self.isSucess : isSucess // ignore: cast_nullable_to_non_nullable
as bool,camposValidos: null == camposValidos ? _self.camposValidos : camposValidos // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EditarProducaoState].
extension EditarProducaoStatePatterns on EditarProducaoState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditarProducaoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditarProducaoState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditarProducaoState value)  $default,){
final _that = this;
switch (_that) {
case _EditarProducaoState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditarProducaoState value)?  $default,){
final _that = this;
switch (_that) {
case _EditarProducaoState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? produtoId,  String? barrilId,  String? quantidade,  int ordem,  int codigo,  String horarioReferente,  DateTime? data,  String? erro,  String? erroProduto,  String? erroBarril,  String? erroQuantidade,  String? erroOrdem,  String? erroCodigo,  String? erroGeral,  String? erroData,  bool isLoading,  bool isSucess,  bool camposValidos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditarProducaoState() when $default != null:
return $default(_that.produtoId,_that.barrilId,_that.quantidade,_that.ordem,_that.codigo,_that.horarioReferente,_that.data,_that.erro,_that.erroProduto,_that.erroBarril,_that.erroQuantidade,_that.erroOrdem,_that.erroCodigo,_that.erroGeral,_that.erroData,_that.isLoading,_that.isSucess,_that.camposValidos);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? produtoId,  String? barrilId,  String? quantidade,  int ordem,  int codigo,  String horarioReferente,  DateTime? data,  String? erro,  String? erroProduto,  String? erroBarril,  String? erroQuantidade,  String? erroOrdem,  String? erroCodigo,  String? erroGeral,  String? erroData,  bool isLoading,  bool isSucess,  bool camposValidos)  $default,) {final _that = this;
switch (_that) {
case _EditarProducaoState():
return $default(_that.produtoId,_that.barrilId,_that.quantidade,_that.ordem,_that.codigo,_that.horarioReferente,_that.data,_that.erro,_that.erroProduto,_that.erroBarril,_that.erroQuantidade,_that.erroOrdem,_that.erroCodigo,_that.erroGeral,_that.erroData,_that.isLoading,_that.isSucess,_that.camposValidos);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? produtoId,  String? barrilId,  String? quantidade,  int ordem,  int codigo,  String horarioReferente,  DateTime? data,  String? erro,  String? erroProduto,  String? erroBarril,  String? erroQuantidade,  String? erroOrdem,  String? erroCodigo,  String? erroGeral,  String? erroData,  bool isLoading,  bool isSucess,  bool camposValidos)?  $default,) {final _that = this;
switch (_that) {
case _EditarProducaoState() when $default != null:
return $default(_that.produtoId,_that.barrilId,_that.quantidade,_that.ordem,_that.codigo,_that.horarioReferente,_that.data,_that.erro,_that.erroProduto,_that.erroBarril,_that.erroQuantidade,_that.erroOrdem,_that.erroCodigo,_that.erroGeral,_that.erroData,_that.isLoading,_that.isSucess,_that.camposValidos);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EditarProducaoState implements EditarProducaoState {
  const _EditarProducaoState({this.produtoId, this.barrilId, this.quantidade, this.ordem = -1, this.codigo = -1, this.horarioReferente = '', this.data, this.erro, this.erroProduto, this.erroBarril, this.erroQuantidade, this.erroOrdem, this.erroCodigo, this.erroGeral, this.erroData, this.isLoading = false, this.isSucess = false, this.camposValidos = false});
  factory _EditarProducaoState.fromJson(Map<String, dynamic> json) => _$EditarProducaoStateFromJson(json);

@override final  String? produtoId;
@override final  String? barrilId;
@override final  String? quantidade;
@override@JsonKey() final  int ordem;
@override@JsonKey() final  int codigo;
@override@JsonKey() final  String horarioReferente;
@override final  DateTime? data;
@override final  String? erro;
@override final  String? erroProduto;
@override final  String? erroBarril;
@override final  String? erroQuantidade;
@override final  String? erroOrdem;
@override final  String? erroCodigo;
@override final  String? erroGeral;
@override final  String? erroData;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSucess;
@override@JsonKey() final  bool camposValidos;

/// Create a copy of EditarProducaoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditarProducaoStateCopyWith<_EditarProducaoState> get copyWith => __$EditarProducaoStateCopyWithImpl<_EditarProducaoState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EditarProducaoStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditarProducaoState&&(identical(other.produtoId, produtoId) || other.produtoId == produtoId)&&(identical(other.barrilId, barrilId) || other.barrilId == barrilId)&&(identical(other.quantidade, quantidade) || other.quantidade == quantidade)&&(identical(other.ordem, ordem) || other.ordem == ordem)&&(identical(other.codigo, codigo) || other.codigo == codigo)&&(identical(other.horarioReferente, horarioReferente) || other.horarioReferente == horarioReferente)&&(identical(other.data, data) || other.data == data)&&(identical(other.erro, erro) || other.erro == erro)&&(identical(other.erroProduto, erroProduto) || other.erroProduto == erroProduto)&&(identical(other.erroBarril, erroBarril) || other.erroBarril == erroBarril)&&(identical(other.erroQuantidade, erroQuantidade) || other.erroQuantidade == erroQuantidade)&&(identical(other.erroOrdem, erroOrdem) || other.erroOrdem == erroOrdem)&&(identical(other.erroCodigo, erroCodigo) || other.erroCodigo == erroCodigo)&&(identical(other.erroGeral, erroGeral) || other.erroGeral == erroGeral)&&(identical(other.erroData, erroData) || other.erroData == erroData)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSucess, isSucess) || other.isSucess == isSucess)&&(identical(other.camposValidos, camposValidos) || other.camposValidos == camposValidos));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,produtoId,barrilId,quantidade,ordem,codigo,horarioReferente,data,erro,erroProduto,erroBarril,erroQuantidade,erroOrdem,erroCodigo,erroGeral,erroData,isLoading,isSucess,camposValidos);

@override
String toString() {
  return 'EditarProducaoState(produtoId: $produtoId, barrilId: $barrilId, quantidade: $quantidade, ordem: $ordem, codigo: $codigo, horarioReferente: $horarioReferente, data: $data, erro: $erro, erroProduto: $erroProduto, erroBarril: $erroBarril, erroQuantidade: $erroQuantidade, erroOrdem: $erroOrdem, erroCodigo: $erroCodigo, erroGeral: $erroGeral, erroData: $erroData, isLoading: $isLoading, isSucess: $isSucess, camposValidos: $camposValidos)';
}


}

/// @nodoc
abstract mixin class _$EditarProducaoStateCopyWith<$Res> implements $EditarProducaoStateCopyWith<$Res> {
  factory _$EditarProducaoStateCopyWith(_EditarProducaoState value, $Res Function(_EditarProducaoState) _then) = __$EditarProducaoStateCopyWithImpl;
@override @useResult
$Res call({
 String? produtoId, String? barrilId, String? quantidade, int ordem, int codigo, String horarioReferente, DateTime? data, String? erro, String? erroProduto, String? erroBarril, String? erroQuantidade, String? erroOrdem, String? erroCodigo, String? erroGeral, String? erroData, bool isLoading, bool isSucess, bool camposValidos
});




}
/// @nodoc
class __$EditarProducaoStateCopyWithImpl<$Res>
    implements _$EditarProducaoStateCopyWith<$Res> {
  __$EditarProducaoStateCopyWithImpl(this._self, this._then);

  final _EditarProducaoState _self;
  final $Res Function(_EditarProducaoState) _then;

/// Create a copy of EditarProducaoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? produtoId = freezed,Object? barrilId = freezed,Object? quantidade = freezed,Object? ordem = null,Object? codigo = null,Object? horarioReferente = null,Object? data = freezed,Object? erro = freezed,Object? erroProduto = freezed,Object? erroBarril = freezed,Object? erroQuantidade = freezed,Object? erroOrdem = freezed,Object? erroCodigo = freezed,Object? erroGeral = freezed,Object? erroData = freezed,Object? isLoading = null,Object? isSucess = null,Object? camposValidos = null,}) {
  return _then(_EditarProducaoState(
produtoId: freezed == produtoId ? _self.produtoId : produtoId // ignore: cast_nullable_to_non_nullable
as String?,barrilId: freezed == barrilId ? _self.barrilId : barrilId // ignore: cast_nullable_to_non_nullable
as String?,quantidade: freezed == quantidade ? _self.quantidade : quantidade // ignore: cast_nullable_to_non_nullable
as String?,ordem: null == ordem ? _self.ordem : ordem // ignore: cast_nullable_to_non_nullable
as int,codigo: null == codigo ? _self.codigo : codigo // ignore: cast_nullable_to_non_nullable
as int,horarioReferente: null == horarioReferente ? _self.horarioReferente : horarioReferente // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as DateTime?,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,erroProduto: freezed == erroProduto ? _self.erroProduto : erroProduto // ignore: cast_nullable_to_non_nullable
as String?,erroBarril: freezed == erroBarril ? _self.erroBarril : erroBarril // ignore: cast_nullable_to_non_nullable
as String?,erroQuantidade: freezed == erroQuantidade ? _self.erroQuantidade : erroQuantidade // ignore: cast_nullable_to_non_nullable
as String?,erroOrdem: freezed == erroOrdem ? _self.erroOrdem : erroOrdem // ignore: cast_nullable_to_non_nullable
as String?,erroCodigo: freezed == erroCodigo ? _self.erroCodigo : erroCodigo // ignore: cast_nullable_to_non_nullable
as String?,erroGeral: freezed == erroGeral ? _self.erroGeral : erroGeral // ignore: cast_nullable_to_non_nullable
as String?,erroData: freezed == erroData ? _self.erroData : erroData // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSucess: null == isSucess ? _self.isSucess : isSucess // ignore: cast_nullable_to_non_nullable
as bool,camposValidos: null == camposValidos ? _self.camposValidos : camposValidos // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
