// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selecionar_turno_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelecionarTurnoState {

 Turno get turno; String? get quantidade;
/// Create a copy of SelecionarTurnoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelecionarTurnoStateCopyWith<SelecionarTurnoState> get copyWith => _$SelecionarTurnoStateCopyWithImpl<SelecionarTurnoState>(this as SelecionarTurnoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelecionarTurnoState&&(identical(other.turno, turno) || other.turno == turno)&&(identical(other.quantidade, quantidade) || other.quantidade == quantidade));
}


@override
int get hashCode => Object.hash(runtimeType,turno,quantidade);

@override
String toString() {
  return 'SelecionarTurnoState(turno: $turno, quantidade: $quantidade)';
}


}

/// @nodoc
abstract mixin class $SelecionarTurnoStateCopyWith<$Res>  {
  factory $SelecionarTurnoStateCopyWith(SelecionarTurnoState value, $Res Function(SelecionarTurnoState) _then) = _$SelecionarTurnoStateCopyWithImpl;
@useResult
$Res call({
 Turno turno, String? quantidade
});




}
/// @nodoc
class _$SelecionarTurnoStateCopyWithImpl<$Res>
    implements $SelecionarTurnoStateCopyWith<$Res> {
  _$SelecionarTurnoStateCopyWithImpl(this._self, this._then);

  final SelecionarTurnoState _self;
  final $Res Function(SelecionarTurnoState) _then;

/// Create a copy of SelecionarTurnoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? turno = null,Object? quantidade = freezed,}) {
  return _then(_self.copyWith(
turno: null == turno ? _self.turno : turno // ignore: cast_nullable_to_non_nullable
as Turno,quantidade: freezed == quantidade ? _self.quantidade : quantidade // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SelecionarTurnoState].
extension SelecionarTurnoStatePatterns on SelecionarTurnoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelecionarTurnoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelecionarTurnoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelecionarTurnoState value)  $default,){
final _that = this;
switch (_that) {
case _SelecionarTurnoState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelecionarTurnoState value)?  $default,){
final _that = this;
switch (_that) {
case _SelecionarTurnoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Turno turno,  String? quantidade)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelecionarTurnoState() when $default != null:
return $default(_that.turno,_that.quantidade);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Turno turno,  String? quantidade)  $default,) {final _that = this;
switch (_that) {
case _SelecionarTurnoState():
return $default(_that.turno,_that.quantidade);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Turno turno,  String? quantidade)?  $default,) {final _that = this;
switch (_that) {
case _SelecionarTurnoState() when $default != null:
return $default(_that.turno,_that.quantidade);case _:
  return null;

}
}

}

/// @nodoc


class _SelecionarTurnoState extends SelecionarTurnoState {
  const _SelecionarTurnoState({this.turno = Turno.turnoA, this.quantidade}): super._();
  

@override@JsonKey() final  Turno turno;
@override final  String? quantidade;

/// Create a copy of SelecionarTurnoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelecionarTurnoStateCopyWith<_SelecionarTurnoState> get copyWith => __$SelecionarTurnoStateCopyWithImpl<_SelecionarTurnoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelecionarTurnoState&&(identical(other.turno, turno) || other.turno == turno)&&(identical(other.quantidade, quantidade) || other.quantidade == quantidade));
}


@override
int get hashCode => Object.hash(runtimeType,turno,quantidade);

@override
String toString() {
  return 'SelecionarTurnoState(turno: $turno, quantidade: $quantidade)';
}


}

/// @nodoc
abstract mixin class _$SelecionarTurnoStateCopyWith<$Res> implements $SelecionarTurnoStateCopyWith<$Res> {
  factory _$SelecionarTurnoStateCopyWith(_SelecionarTurnoState value, $Res Function(_SelecionarTurnoState) _then) = __$SelecionarTurnoStateCopyWithImpl;
@override @useResult
$Res call({
 Turno turno, String? quantidade
});




}
/// @nodoc
class __$SelecionarTurnoStateCopyWithImpl<$Res>
    implements _$SelecionarTurnoStateCopyWith<$Res> {
  __$SelecionarTurnoStateCopyWithImpl(this._self, this._then);

  final _SelecionarTurnoState _self;
  final $Res Function(_SelecionarTurnoState) _then;

/// Create a copy of SelecionarTurnoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? turno = null,Object? quantidade = freezed,}) {
  return _then(_SelecionarTurnoState(
turno: null == turno ? _self.turno : turno // ignore: cast_nullable_to_non_nullable
as Turno,quantidade: freezed == quantidade ? _self.quantidade : quantidade // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
