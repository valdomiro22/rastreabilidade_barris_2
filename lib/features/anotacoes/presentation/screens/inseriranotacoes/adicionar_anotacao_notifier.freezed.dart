// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adicionar_anotacao_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdicionarAnotacaoState {

 String get codigo; String? get erro; String? get codigoErro; bool get isLoading; bool get isSucess; bool get camposValidos;
/// Create a copy of AdicionarAnotacaoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdicionarAnotacaoStateCopyWith<AdicionarAnotacaoState> get copyWith => _$AdicionarAnotacaoStateCopyWithImpl<AdicionarAnotacaoState>(this as AdicionarAnotacaoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdicionarAnotacaoState&&(identical(other.codigo, codigo) || other.codigo == codigo)&&(identical(other.erro, erro) || other.erro == erro)&&(identical(other.codigoErro, codigoErro) || other.codigoErro == codigoErro)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSucess, isSucess) || other.isSucess == isSucess)&&(identical(other.camposValidos, camposValidos) || other.camposValidos == camposValidos));
}


@override
int get hashCode => Object.hash(runtimeType,codigo,erro,codigoErro,isLoading,isSucess,camposValidos);

@override
String toString() {
  return 'AdicionarAnotacaoState(codigo: $codigo, erro: $erro, codigoErro: $codigoErro, isLoading: $isLoading, isSucess: $isSucess, camposValidos: $camposValidos)';
}


}

/// @nodoc
abstract mixin class $AdicionarAnotacaoStateCopyWith<$Res>  {
  factory $AdicionarAnotacaoStateCopyWith(AdicionarAnotacaoState value, $Res Function(AdicionarAnotacaoState) _then) = _$AdicionarAnotacaoStateCopyWithImpl;
@useResult
$Res call({
 String codigo, String? erro, String? codigoErro, bool isLoading, bool isSucess, bool camposValidos
});




}
/// @nodoc
class _$AdicionarAnotacaoStateCopyWithImpl<$Res>
    implements $AdicionarAnotacaoStateCopyWith<$Res> {
  _$AdicionarAnotacaoStateCopyWithImpl(this._self, this._then);

  final AdicionarAnotacaoState _self;
  final $Res Function(AdicionarAnotacaoState) _then;

/// Create a copy of AdicionarAnotacaoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? codigo = null,Object? erro = freezed,Object? codigoErro = freezed,Object? isLoading = null,Object? isSucess = null,Object? camposValidos = null,}) {
  return _then(_self.copyWith(
codigo: null == codigo ? _self.codigo : codigo // ignore: cast_nullable_to_non_nullable
as String,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,codigoErro: freezed == codigoErro ? _self.codigoErro : codigoErro // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSucess: null == isSucess ? _self.isSucess : isSucess // ignore: cast_nullable_to_non_nullable
as bool,camposValidos: null == camposValidos ? _self.camposValidos : camposValidos // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AdicionarAnotacaoState].
extension AdicionarAnotacaoStatePatterns on AdicionarAnotacaoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdicionarAnotacaoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdicionarAnotacaoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdicionarAnotacaoState value)  $default,){
final _that = this;
switch (_that) {
case _AdicionarAnotacaoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdicionarAnotacaoState value)?  $default,){
final _that = this;
switch (_that) {
case _AdicionarAnotacaoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String codigo,  String? erro,  String? codigoErro,  bool isLoading,  bool isSucess,  bool camposValidos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdicionarAnotacaoState() when $default != null:
return $default(_that.codigo,_that.erro,_that.codigoErro,_that.isLoading,_that.isSucess,_that.camposValidos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String codigo,  String? erro,  String? codigoErro,  bool isLoading,  bool isSucess,  bool camposValidos)  $default,) {final _that = this;
switch (_that) {
case _AdicionarAnotacaoState():
return $default(_that.codigo,_that.erro,_that.codigoErro,_that.isLoading,_that.isSucess,_that.camposValidos);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String codigo,  String? erro,  String? codigoErro,  bool isLoading,  bool isSucess,  bool camposValidos)?  $default,) {final _that = this;
switch (_that) {
case _AdicionarAnotacaoState() when $default != null:
return $default(_that.codigo,_that.erro,_that.codigoErro,_that.isLoading,_that.isSucess,_that.camposValidos);case _:
  return null;

}
}

}

/// @nodoc


class _AdicionarAnotacaoState implements AdicionarAnotacaoState {
  const _AdicionarAnotacaoState({this.codigo = '', this.erro, this.codigoErro, this.isLoading = false, this.isSucess = false, this.camposValidos = false});
  

@override@JsonKey() final  String codigo;
@override final  String? erro;
@override final  String? codigoErro;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSucess;
@override@JsonKey() final  bool camposValidos;

/// Create a copy of AdicionarAnotacaoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdicionarAnotacaoStateCopyWith<_AdicionarAnotacaoState> get copyWith => __$AdicionarAnotacaoStateCopyWithImpl<_AdicionarAnotacaoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdicionarAnotacaoState&&(identical(other.codigo, codigo) || other.codigo == codigo)&&(identical(other.erro, erro) || other.erro == erro)&&(identical(other.codigoErro, codigoErro) || other.codigoErro == codigoErro)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSucess, isSucess) || other.isSucess == isSucess)&&(identical(other.camposValidos, camposValidos) || other.camposValidos == camposValidos));
}


@override
int get hashCode => Object.hash(runtimeType,codigo,erro,codigoErro,isLoading,isSucess,camposValidos);

@override
String toString() {
  return 'AdicionarAnotacaoState(codigo: $codigo, erro: $erro, codigoErro: $codigoErro, isLoading: $isLoading, isSucess: $isSucess, camposValidos: $camposValidos)';
}


}

/// @nodoc
abstract mixin class _$AdicionarAnotacaoStateCopyWith<$Res> implements $AdicionarAnotacaoStateCopyWith<$Res> {
  factory _$AdicionarAnotacaoStateCopyWith(_AdicionarAnotacaoState value, $Res Function(_AdicionarAnotacaoState) _then) = __$AdicionarAnotacaoStateCopyWithImpl;
@override @useResult
$Res call({
 String codigo, String? erro, String? codigoErro, bool isLoading, bool isSucess, bool camposValidos
});




}
/// @nodoc
class __$AdicionarAnotacaoStateCopyWithImpl<$Res>
    implements _$AdicionarAnotacaoStateCopyWith<$Res> {
  __$AdicionarAnotacaoStateCopyWithImpl(this._self, this._then);

  final _AdicionarAnotacaoState _self;
  final $Res Function(_AdicionarAnotacaoState) _then;

/// Create a copy of AdicionarAnotacaoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? codigo = null,Object? erro = freezed,Object? codigoErro = freezed,Object? isLoading = null,Object? isSucess = null,Object? camposValidos = null,}) {
  return _then(_AdicionarAnotacaoState(
codigo: null == codigo ? _self.codigo : codigo // ignore: cast_nullable_to_non_nullable
as String,erro: freezed == erro ? _self.erro : erro // ignore: cast_nullable_to_non_nullable
as String?,codigoErro: freezed == codigoErro ? _self.codigoErro : codigoErro // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSucess: null == isSucess ? _self.isSucess : isSucess // ignore: cast_nullable_to_non_nullable
as bool,camposValidos: null == camposValidos ? _self.camposValidos : camposValidos // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
