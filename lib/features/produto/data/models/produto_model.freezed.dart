// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'produto_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProdutoModel {

 String? get id; String get nome; int get prazoValidade;
/// Create a copy of ProdutoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProdutoModelCopyWith<ProdutoModel> get copyWith => _$ProdutoModelCopyWithImpl<ProdutoModel>(this as ProdutoModel, _$identity);

  /// Serializes this ProdutoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProdutoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.prazoValidade, prazoValidade) || other.prazoValidade == prazoValidade));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,prazoValidade);

@override
String toString() {
  return 'ProdutoModel(id: $id, nome: $nome, prazoValidade: $prazoValidade)';
}


}

/// @nodoc
abstract mixin class $ProdutoModelCopyWith<$Res>  {
  factory $ProdutoModelCopyWith(ProdutoModel value, $Res Function(ProdutoModel) _then) = _$ProdutoModelCopyWithImpl;
@useResult
$Res call({
 String? id, String nome, int prazoValidade
});




}
/// @nodoc
class _$ProdutoModelCopyWithImpl<$Res>
    implements $ProdutoModelCopyWith<$Res> {
  _$ProdutoModelCopyWithImpl(this._self, this._then);

  final ProdutoModel _self;
  final $Res Function(ProdutoModel) _then;

/// Create a copy of ProdutoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? nome = null,Object? prazoValidade = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,prazoValidade: null == prazoValidade ? _self.prazoValidade : prazoValidade // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProdutoModel].
extension ProdutoModelPatterns on ProdutoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProdutoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProdutoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProdutoModel value)  $default,){
final _that = this;
switch (_that) {
case _ProdutoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProdutoModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProdutoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String nome,  int prazoValidade)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProdutoModel() when $default != null:
return $default(_that.id,_that.nome,_that.prazoValidade);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String nome,  int prazoValidade)  $default,) {final _that = this;
switch (_that) {
case _ProdutoModel():
return $default(_that.id,_that.nome,_that.prazoValidade);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String nome,  int prazoValidade)?  $default,) {final _that = this;
switch (_that) {
case _ProdutoModel() when $default != null:
return $default(_that.id,_that.nome,_that.prazoValidade);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProdutoModel extends ProdutoModel {
  const _ProdutoModel({this.id, required this.nome, required this.prazoValidade}): super._();
  factory _ProdutoModel.fromJson(Map<String, dynamic> json) => _$ProdutoModelFromJson(json);

@override final  String? id;
@override final  String nome;
@override final  int prazoValidade;

/// Create a copy of ProdutoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProdutoModelCopyWith<_ProdutoModel> get copyWith => __$ProdutoModelCopyWithImpl<_ProdutoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProdutoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProdutoModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nome, nome) || other.nome == nome)&&(identical(other.prazoValidade, prazoValidade) || other.prazoValidade == prazoValidade));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nome,prazoValidade);

@override
String toString() {
  return 'ProdutoModel(id: $id, nome: $nome, prazoValidade: $prazoValidade)';
}


}

/// @nodoc
abstract mixin class _$ProdutoModelCopyWith<$Res> implements $ProdutoModelCopyWith<$Res> {
  factory _$ProdutoModelCopyWith(_ProdutoModel value, $Res Function(_ProdutoModel) _then) = __$ProdutoModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String nome, int prazoValidade
});




}
/// @nodoc
class __$ProdutoModelCopyWithImpl<$Res>
    implements _$ProdutoModelCopyWith<$Res> {
  __$ProdutoModelCopyWithImpl(this._self, this._then);

  final _ProdutoModel _self;
  final $Res Function(_ProdutoModel) _then;

/// Create a copy of ProdutoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? nome = null,Object? prazoValidade = null,}) {
  return _then(_ProdutoModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,nome: null == nome ? _self.nome : nome // ignore: cast_nullable_to_non_nullable
as String,prazoValidade: null == prazoValidade ? _self.prazoValidade : prazoValidade // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
