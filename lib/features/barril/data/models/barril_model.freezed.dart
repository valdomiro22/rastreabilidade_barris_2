// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'barril_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BarrilModel implements DiagnosticableTreeMixin {

 String? get id; String get nome; int get volume; bool get isDescartavel;
/// Create a copy of BarrilModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BarrilModelCopyWith<BarrilModel> get copyWith => _$BarrilModelCopyWithImpl<BarrilModel>(this as BarrilModel, _$identity);

  /// Serializes this BarrilModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BarrilModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('nome', nome))..add(DiagnosticsProperty('volume', volume))..add(DiagnosticsProperty('isDescartavel', isDescartavel));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BarrilModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.isDescartavel, isDescartavel) || other.isDescartavel == isDescartavel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,volume,isDescartavel);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BarrilModel(id: $id, nome: $nome, volume: $volume, isDescartavel: $isDescartavel)';
}


}

/// @nodoc
abstract mixin class $BarrilModelCopyWith<$Res>  {
  factory $BarrilModelCopyWith(BarrilModel value, $Res Function(BarrilModel) _then) = _$BarrilModelCopyWithImpl;
@useResult
$Res call({
 String? id, String nome, int volume, bool isDescartavel
});




}
/// @nodoc
class _$BarrilModelCopyWithImpl<$Res>
    implements $BarrilModelCopyWith<$Res> {
  _$BarrilModelCopyWithImpl(this._self, this._then);

  final BarrilModel _self;
  final $Res Function(BarrilModel) _then;

/// Create a copy of BarrilModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? nome = null,Object? volume = null,Object? isDescartavel = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as int,isDescartavel: null == isDescartavel ? _self.isDescartavel : isDescartavel // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BarrilModel].
extension BarrilModelPatterns on BarrilModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BarrilModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BarrilModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BarrilModel value)  $default,){
final _that = this;
switch (_that) {
case _BarrilModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BarrilModel value)?  $default,){
final _that = this;
switch (_that) {
case _BarrilModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String nome,  int volume,  bool isDescartavel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BarrilModel() when $default != null:
return $default(_that.id,_that.nome,_that.volume,_that.isDescartavel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String nome,  int volume,  bool isDescartavel)  $default,) {final _that = this;
switch (_that) {
case _BarrilModel():
return $default(_that.id,_that.nome,_that.volume,_that.isDescartavel);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String nome,  int volume,  bool isDescartavel)?  $default,) {final _that = this;
switch (_that) {
case _BarrilModel() when $default != null:
return $default(_that.id,_that.nome,_that.volume,_that.isDescartavel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BarrilModel extends BarrilModel with DiagnosticableTreeMixin {
  const _BarrilModel({this.id, required this.nome, required this.volume, required this.isDescartavel}): super._();
  factory _BarrilModel.fromJson(Map<String, dynamic> json) => _$BarrilModelFromJson(json);

@override final  String? id;
@override final  String nome;
@override final  int volume;
@override final  bool isDescartavel;

/// Create a copy of BarrilModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BarrilModelCopyWith<_BarrilModel> get copyWith => __$BarrilModelCopyWithImpl<_BarrilModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BarrilModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'BarrilModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('nome', nome))..add(DiagnosticsProperty('volume', volume))..add(DiagnosticsProperty('isDescartavel', isDescartavel));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BarrilModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.volume, volume) || other.volume == volume)&&(identical(other.isDescartavel, isDescartavel) || other.isDescartavel == isDescartavel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,volume,isDescartavel);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'BarrilModel(id: $id, nome: $nome, volume: $volume, isDescartavel: $isDescartavel)';
}


}

/// @nodoc
abstract mixin class _$BarrilModelCopyWith<$Res> implements $BarrilModelCopyWith<$Res> {
  factory _$BarrilModelCopyWith(_BarrilModel value, $Res Function(_BarrilModel) _then) = __$BarrilModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String nome, int volume, bool isDescartavel
});




}
/// @nodoc
class __$BarrilModelCopyWithImpl<$Res>
    implements _$BarrilModelCopyWith<$Res> {
  __$BarrilModelCopyWithImpl(this._self, this._then);

  final _BarrilModel _self;
  final $Res Function(_BarrilModel) _then;

/// Create a copy of BarrilModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? nome = null,Object? volume = null,Object? isDescartavel = null,}) {
  return _then(_BarrilModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,volume: null == volume ? _self.volume : volume // ignore: cast_nullable_to_non_nullable
as int,isDescartavel: null == isDescartavel ? _self.isDescartavel : isDescartavel // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
