// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductListItem {

 Preset get preset; int get materialCount;
/// Create a copy of ProductListItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductListItemCopyWith<ProductListItem> get copyWith => _$ProductListItemCopyWithImpl<ProductListItem>(this as ProductListItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductListItem&&(identical(other.preset, preset) || other.preset == preset)&&(identical(other.materialCount, materialCount) || other.materialCount == materialCount));
}


@override
int get hashCode => Object.hash(runtimeType,preset,materialCount);

@override
String toString() {
  return 'ProductListItem(preset: $preset, materialCount: $materialCount)';
}


}

/// @nodoc
abstract mixin class $ProductListItemCopyWith<$Res>  {
  factory $ProductListItemCopyWith(ProductListItem value, $Res Function(ProductListItem) _then) = _$ProductListItemCopyWithImpl;
@useResult
$Res call({
 Preset preset, int materialCount
});




}
/// @nodoc
class _$ProductListItemCopyWithImpl<$Res>
    implements $ProductListItemCopyWith<$Res> {
  _$ProductListItemCopyWithImpl(this._self, this._then);

  final ProductListItem _self;
  final $Res Function(ProductListItem) _then;

/// Create a copy of ProductListItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? preset = null,Object? materialCount = null,}) {
  return _then(_self.copyWith(
preset: null == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as Preset,materialCount: null == materialCount ? _self.materialCount : materialCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductListItem].
extension ProductListItemPatterns on ProductListItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductListItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductListItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductListItem value)  $default,){
final _that = this;
switch (_that) {
case _ProductListItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductListItem value)?  $default,){
final _that = this;
switch (_that) {
case _ProductListItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Preset preset,  int materialCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductListItem() when $default != null:
return $default(_that.preset,_that.materialCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Preset preset,  int materialCount)  $default,) {final _that = this;
switch (_that) {
case _ProductListItem():
return $default(_that.preset,_that.materialCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Preset preset,  int materialCount)?  $default,) {final _that = this;
switch (_that) {
case _ProductListItem() when $default != null:
return $default(_that.preset,_that.materialCount);case _:
  return null;

}
}

}

/// @nodoc


class _ProductListItem implements ProductListItem {
  const _ProductListItem({required this.preset, required this.materialCount});
  

@override final  Preset preset;
@override final  int materialCount;

/// Create a copy of ProductListItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductListItemCopyWith<_ProductListItem> get copyWith => __$ProductListItemCopyWithImpl<_ProductListItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductListItem&&(identical(other.preset, preset) || other.preset == preset)&&(identical(other.materialCount, materialCount) || other.materialCount == materialCount));
}


@override
int get hashCode => Object.hash(runtimeType,preset,materialCount);

@override
String toString() {
  return 'ProductListItem(preset: $preset, materialCount: $materialCount)';
}


}

/// @nodoc
abstract mixin class _$ProductListItemCopyWith<$Res> implements $ProductListItemCopyWith<$Res> {
  factory _$ProductListItemCopyWith(_ProductListItem value, $Res Function(_ProductListItem) _then) = __$ProductListItemCopyWithImpl;
@override @useResult
$Res call({
 Preset preset, int materialCount
});




}
/// @nodoc
class __$ProductListItemCopyWithImpl<$Res>
    implements _$ProductListItemCopyWith<$Res> {
  __$ProductListItemCopyWithImpl(this._self, this._then);

  final _ProductListItem _self;
  final $Res Function(_ProductListItem) _then;

/// Create a copy of ProductListItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? preset = null,Object? materialCount = null,}) {
  return _then(_ProductListItem(
preset: null == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as Preset,materialCount: null == materialCount ? _self.materialCount : materialCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ProductsState {

 ProductsStatus get status; List<ProductListItem> get items; String get searchQuery; String? get errorMessage; bool get isCreateFailure;
/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsStateCopyWith<ProductsState> get copyWith => _$ProductsStateCopyWithImpl<ProductsState>(this as ProductsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isCreateFailure, isCreateFailure) || other.isCreateFailure == isCreateFailure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(items),searchQuery,errorMessage,isCreateFailure);

@override
String toString() {
  return 'ProductsState(status: $status, items: $items, searchQuery: $searchQuery, errorMessage: $errorMessage, isCreateFailure: $isCreateFailure)';
}


}

/// @nodoc
abstract mixin class $ProductsStateCopyWith<$Res>  {
  factory $ProductsStateCopyWith(ProductsState value, $Res Function(ProductsState) _then) = _$ProductsStateCopyWithImpl;
@useResult
$Res call({
 ProductsStatus status, List<ProductListItem> items, String searchQuery, String? errorMessage, bool isCreateFailure
});




}
/// @nodoc
class _$ProductsStateCopyWithImpl<$Res>
    implements $ProductsStateCopyWith<$Res> {
  _$ProductsStateCopyWithImpl(this._self, this._then);

  final ProductsState _self;
  final $Res Function(ProductsState) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? items = null,Object? searchQuery = null,Object? errorMessage = freezed,Object? isCreateFailure = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProductsStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ProductListItem>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isCreateFailure: null == isCreateFailure ? _self.isCreateFailure : isCreateFailure // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductsState].
extension ProductsStatePatterns on ProductsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductsState value)  $default,){
final _that = this;
switch (_that) {
case _ProductsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductsState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductsStatus status,  List<ProductListItem> items,  String searchQuery,  String? errorMessage,  bool isCreateFailure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductsState() when $default != null:
return $default(_that.status,_that.items,_that.searchQuery,_that.errorMessage,_that.isCreateFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductsStatus status,  List<ProductListItem> items,  String searchQuery,  String? errorMessage,  bool isCreateFailure)  $default,) {final _that = this;
switch (_that) {
case _ProductsState():
return $default(_that.status,_that.items,_that.searchQuery,_that.errorMessage,_that.isCreateFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductsStatus status,  List<ProductListItem> items,  String searchQuery,  String? errorMessage,  bool isCreateFailure)?  $default,) {final _that = this;
switch (_that) {
case _ProductsState() when $default != null:
return $default(_that.status,_that.items,_that.searchQuery,_that.errorMessage,_that.isCreateFailure);case _:
  return null;

}
}

}

/// @nodoc


class _ProductsState extends ProductsState {
  const _ProductsState({this.status = ProductsStatus.initial, final  List<ProductListItem> items = const [], this.searchQuery = '', this.errorMessage, this.isCreateFailure = false}): _items = items,super._();
  

@override@JsonKey() final  ProductsStatus status;
 final  List<ProductListItem> _items;
@override@JsonKey() List<ProductListItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  String searchQuery;
@override final  String? errorMessage;
@override@JsonKey() final  bool isCreateFailure;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductsStateCopyWith<_ProductsState> get copyWith => __$ProductsStateCopyWithImpl<_ProductsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isCreateFailure, isCreateFailure) || other.isCreateFailure == isCreateFailure));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_items),searchQuery,errorMessage,isCreateFailure);

@override
String toString() {
  return 'ProductsState(status: $status, items: $items, searchQuery: $searchQuery, errorMessage: $errorMessage, isCreateFailure: $isCreateFailure)';
}


}

/// @nodoc
abstract mixin class _$ProductsStateCopyWith<$Res> implements $ProductsStateCopyWith<$Res> {
  factory _$ProductsStateCopyWith(_ProductsState value, $Res Function(_ProductsState) _then) = __$ProductsStateCopyWithImpl;
@override @useResult
$Res call({
 ProductsStatus status, List<ProductListItem> items, String searchQuery, String? errorMessage, bool isCreateFailure
});




}
/// @nodoc
class __$ProductsStateCopyWithImpl<$Res>
    implements _$ProductsStateCopyWith<$Res> {
  __$ProductsStateCopyWithImpl(this._self, this._then);

  final _ProductsState _self;
  final $Res Function(_ProductsState) _then;

/// Create a copy of ProductsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? items = null,Object? searchQuery = null,Object? errorMessage = freezed,Object? isCreateFailure = null,}) {
  return _then(_ProductsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProductsStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ProductListItem>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isCreateFailure: null == isCreateFailure ? _self.isCreateFailure : isCreateFailure // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
