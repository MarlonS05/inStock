// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archive_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ArchiveState {

 ArchiveStatus get status; List<Product> get products; DateTime get startDate; DateTime get endDate; String? get errorMessage;
/// Create a copy of ArchiveState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArchiveStateCopyWith<ArchiveState> get copyWith => _$ArchiveStateCopyWithImpl<ArchiveState>(this as ArchiveState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArchiveState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(products),startDate,endDate,errorMessage);

@override
String toString() {
  return 'ArchiveState(status: $status, products: $products, startDate: $startDate, endDate: $endDate, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ArchiveStateCopyWith<$Res>  {
  factory $ArchiveStateCopyWith(ArchiveState value, $Res Function(ArchiveState) _then) = _$ArchiveStateCopyWithImpl;
@useResult
$Res call({
 ArchiveStatus status, List<Product> products, DateTime startDate, DateTime endDate, String? errorMessage
});




}
/// @nodoc
class _$ArchiveStateCopyWithImpl<$Res>
    implements $ArchiveStateCopyWith<$Res> {
  _$ArchiveStateCopyWithImpl(this._self, this._then);

  final ArchiveState _self;
  final $Res Function(ArchiveState) _then;

/// Create a copy of ArchiveState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? products = null,Object? startDate = null,Object? endDate = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ArchiveStatus,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ArchiveState].
extension ArchiveStatePatterns on ArchiveState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArchiveState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArchiveState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArchiveState value)  $default,){
final _that = this;
switch (_that) {
case _ArchiveState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArchiveState value)?  $default,){
final _that = this;
switch (_that) {
case _ArchiveState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ArchiveStatus status,  List<Product> products,  DateTime startDate,  DateTime endDate,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArchiveState() when $default != null:
return $default(_that.status,_that.products,_that.startDate,_that.endDate,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ArchiveStatus status,  List<Product> products,  DateTime startDate,  DateTime endDate,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ArchiveState():
return $default(_that.status,_that.products,_that.startDate,_that.endDate,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ArchiveStatus status,  List<Product> products,  DateTime startDate,  DateTime endDate,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ArchiveState() when $default != null:
return $default(_that.status,_that.products,_that.startDate,_that.endDate,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ArchiveState implements ArchiveState {
  const _ArchiveState({this.status = ArchiveStatus.initial, final  List<Product> products = const [], required this.startDate, required this.endDate, this.errorMessage}): _products = products;
  

@override@JsonKey() final  ArchiveStatus status;
 final  List<Product> _products;
@override@JsonKey() List<Product> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  DateTime startDate;
@override final  DateTime endDate;
@override final  String? errorMessage;

/// Create a copy of ArchiveState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArchiveStateCopyWith<_ArchiveState> get copyWith => __$ArchiveStateCopyWithImpl<_ArchiveState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArchiveState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_products),startDate,endDate,errorMessage);

@override
String toString() {
  return 'ArchiveState(status: $status, products: $products, startDate: $startDate, endDate: $endDate, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ArchiveStateCopyWith<$Res> implements $ArchiveStateCopyWith<$Res> {
  factory _$ArchiveStateCopyWith(_ArchiveState value, $Res Function(_ArchiveState) _then) = __$ArchiveStateCopyWithImpl;
@override @useResult
$Res call({
 ArchiveStatus status, List<Product> products, DateTime startDate, DateTime endDate, String? errorMessage
});




}
/// @nodoc
class __$ArchiveStateCopyWithImpl<$Res>
    implements _$ArchiveStateCopyWith<$Res> {
  __$ArchiveStateCopyWithImpl(this._self, this._then);

  final _ArchiveState _self;
  final $Res Function(_ArchiveState) _then;

/// Create a copy of ArchiveState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? products = null,Object? startDate = null,Object? endDate = null,Object? errorMessage = freezed,}) {
  return _then(_ArchiveState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ArchiveStatus,products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<Product>,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
