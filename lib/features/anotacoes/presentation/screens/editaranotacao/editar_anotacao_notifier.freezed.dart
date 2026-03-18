// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'editar_anotacao_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EditarAnotacaoState {

 String get codigo; String get observacao; String? get erro; String? get codigoErro; String? get observacaoErro; bool get isLoading; bool get isSucess; bool get camposValidos;
/// Create a copy of EditarAnotacaoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditarAnotacaoStateCopyWith<EditarAnotacaoState> get copyWith => _$EditarAnotacaoStateCopyWithImpl<EditarAnotacaoState>(this as EditarAnotacaoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditarAnotacaoState&&(identical(other.codigo, codigo) || other.codigo == codigo)&&(identical(other.observacao, observacao) || other.observacao == observacao)&&(identical(other.erro, erro) || other.erro == erro)&&(identical(other.codigoErro, codigoErro) || other.codigoErro == codigoErro)&&(identical(other.observacaoErro, observacaoErro) || other.observacaoErro == observacaoErro)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSucess, isSucess) || other.isSucess == isSucess)&&(identical(other.camposValidos, camposValidos) || other.camposValidos == camposValidos));
}


@override
int get hashCode => Object.hash(runtimeType,codigo,observacao,erro,codigoErro,observacaoErro,isLoading,isSucess,camposValidos);

@override
String toString() {
  return 'EditarAnotacaoState(codigo: $codigo, observacao: $observacao, erro: $erro, codigoErro: $codigoErro, observacaoErro: $observacaoErro, isLoading: $isLoading, isSucess: $isSucess, camposValidos: $camposValidos)';
}


}

/// @nodoc
abstract mixin class $EditarAnotacaoStateCopyWith<$Res>  {
  factory $EditarAnotacaoStateCopyWith(EditarAnotacaoState value, $Res Function(EditarAnotacaoState) _then) = _$EditarAnotacaoStateCopyWithImpl;
@useResult
$Res call({
 String codigo, String observacao, String? erro, String? codigoErro, String? observacaoErro, bool isLoading, bool isSucess, bool camposValidos
});




}
/// @nodoc
class _$EditarAnotacaoStateCopyWithImpl<$Res>
    implements $EditarAnotacaoStateCopyWith<$Res> {
  _$EditarAnotacaoStateCopyWithImpl(this._self, this._then);

  final EditarAnotacaoState _self;
  final $Res Function(EditarAnotacaoState) _then;

/// Create a copy of EditarAnotacaoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? codigo = null,Object? observacao = null,Object? erro = freezed,Object? codigoErro = freezed,Object? observacaoErro = freezed,Object? isLoading = null,Object? isSucess = null,Object? camposValidos = null,}) {
  return _then(_self.copyWith(
codigo: null == codigo ? _self.codigo : codigo // ignore: cast_nullable_to_non_nullable
as String,observacao: null == observacao ? _self.observacao : observacao // ignore: cast_nullable_to_non_nullable
as String,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,codigoErro: freezed == codigoErro ? _self.codigoErro : codigoErro // ignore: cast_nullable_to_non_nullable
as String?,observacaoErro: freezed == observacaoErro ? _self.observacaoErro : observacaoErro // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSucess: null == isSucess ? _self.isSucess : isSucess // ignore: cast_nullable_to_non_nullable
as bool,camposValidos: null == camposValidos ? _self.camposValidos : camposValidos // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EditarAnotacaoState].
extension EditarAnotacaoStatePatterns on EditarAnotacaoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EditarAnotacaoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EditarAnotacaoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EditarAnotacaoState value)  $default,){
final _that = this;
switch (_that) {
case _EditarAnotacaoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EditarAnotacaoState value)?  $default,){
final _that = this;
switch (_that) {
case _EditarAnotacaoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String codigo,  String observacao,  String? erro,  String? codigoErro,  String? observacaoErro,  bool isLoading,  bool isSucess,  bool camposValidos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EditarAnotacaoState() when $default != null:
return $default(_that.codigo,_that.observacao,_that.erro,_that.codigoErro,_that.observacaoErro,_that.isLoading,_that.isSucess,_that.camposValidos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String codigo,  String observacao,  String? erro,  String? codigoErro,  String? observacaoErro,  bool isLoading,  bool isSucess,  bool camposValidos)  $default,) {final _that = this;
switch (_that) {
case _EditarAnotacaoState():
return $default(_that.codigo,_that.observacao,_that.erro,_that.codigoErro,_that.observacaoErro,_that.isLoading,_that.isSucess,_that.camposValidos);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String codigo,  String observacao,  String? erro,  String? codigoErro,  String? observacaoErro,  bool isLoading,  bool isSucess,  bool camposValidos)?  $default,) {final _that = this;
switch (_that) {
case _EditarAnotacaoState() when $default != null:
return $default(_that.codigo,_that.observacao,_that.erro,_that.codigoErro,_that.observacaoErro,_that.isLoading,_that.isSucess,_that.camposValidos);case _:
  return null;

}
}

}

/// @nodoc


class _EditarAnotacaoState implements EditarAnotacaoState {
  const _EditarAnotacaoState({this.codigo = '', this.observacao = '', this.erro, this.codigoErro, this.observacaoErro, this.isLoading = false, this.isSucess = false, this.camposValidos = false});
  

@override@JsonKey() final  String codigo;
@override@JsonKey() final  String observacao;
@override final  String? erro;
@override final  String? codigoErro;
@override final  String? observacaoErro;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSucess;
@override@JsonKey() final  bool camposValidos;

/// Create a copy of EditarAnotacaoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EditarAnotacaoStateCopyWith<_EditarAnotacaoState> get copyWith => __$EditarAnotacaoStateCopyWithImpl<_EditarAnotacaoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EditarAnotacaoState&&(identical(other.codigo, codigo) || other.codigo == codigo)&&(identical(other.observacao, observacao) || other.observacao == observacao)&&(identical(other.erro, erro) || other.erro == erro)&&(identical(other.codigoErro, codigoErro) || other.codigoErro == codigoErro)&&(identical(other.observacaoErro, observacaoErro) || other.observacaoErro == observacaoErro)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSucess, isSucess) || other.isSucess == isSucess)&&(identical(other.camposValidos, camposValidos) || other.camposValidos == camposValidos));
}


@override
int get hashCode => Object.hash(runtimeType,codigo,observacao,erro,codigoErro,observacaoErro,isLoading,isSucess,camposValidos);

@override
String toString() {
  return 'EditarAnotacaoState(codigo: $codigo, observacao: $observacao, erro: $erro, codigoErro: $codigoErro, observacaoErro: $observacaoErro, isLoading: $isLoading, isSucess: $isSucess, camposValidos: $camposValidos)';
}


}

/// @nodoc
abstract mixin class _$EditarAnotacaoStateCopyWith<$Res> implements $EditarAnotacaoStateCopyWith<$Res> {
  factory _$EditarAnotacaoStateCopyWith(_EditarAnotacaoState value, $Res Function(_EditarAnotacaoState) _then) = __$EditarAnotacaoStateCopyWithImpl;
@override @useResult
$Res call({
 String codigo, String observacao, String? erro, String? codigoErro, String? observacaoErro, bool isLoading, bool isSucess, bool camposValidos
});




}
/// @nodoc
class __$EditarAnotacaoStateCopyWithImpl<$Res>
    implements _$EditarAnotacaoStateCopyWith<$Res> {
  __$EditarAnotacaoStateCopyWithImpl(this._self, this._then);

  final _EditarAnotacaoState _self;
  final $Res Function(_EditarAnotacaoState) _then;

/// Create a copy of EditarAnotacaoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? codigo = null,Object? observacao = null,Object? erro = freezed,Object? codigoErro = freezed,Object? observacaoErro = freezed,Object? isLoading = null,Object? isSucess = null,Object? camposValidos = null,}) {
  return _then(_EditarAnotacaoState(
codigo: null == codigo ? _self.codigo : codigo // ignore: cast_nullable_to_non_nullable
as String,observacao: null == observacao ? _self.observacao : observacao // ignore: cast_nullable_to_non_nullable
as String,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,codigoErro: freezed == codigoErro ? _self.codigoErro : codigoErro // ignore: cast_nullable_to_non_nullable
as String?,observacaoErro: freezed == observacaoErro ? _self.observacaoErro : observacaoErro // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSucess: null == isSucess ? _self.isSucess : isSucess // ignore: cast_nullable_to_non_nullable
as bool,camposValidos: null == camposValidos ? _self.camposValidos : camposValidos // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
