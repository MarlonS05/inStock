// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShoppingListItem {

 Material get material; double get availableQuantity; double get requiredQuantity;
/// Create a copy of ShoppingListItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShoppingListItemCopyWith<ShoppingListItem> get copyWith => _$ShoppingListItemCopyWithImpl<ShoppingListItem>(this as ShoppingListItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShoppingListItem&&(identical(other.material, material) || other.material == material)&&(identical(other.availableQuantity, availableQuantity) || other.availableQuantity == availableQuantity)&&(identical(other.requiredQuantity, requiredQuantity) || other.requiredQuantity == requiredQuantity));
}


@override
int get hashCode => Object.hash(runtimeType,material,availableQuantity,requiredQuantity);

@override
String toString() {
  return 'ShoppingListItem(material: $material, availableQuantity: $availableQuantity, requiredQuantity: $requiredQuantity)';
}


}

/// @nodoc
abstract mixin class $ShoppingListItemCopyWith<$Res>  {
  factory $ShoppingListItemCopyWith(ShoppingListItem value, $Res Function(ShoppingListItem) _then) = _$ShoppingListItemCopyWithImpl;
@useResult
$Res call({
 Material material, double availableQuantity, double requiredQuantity
});




}
/// @nodoc
class _$ShoppingListItemCopyWithImpl<$Res>
    implements $ShoppingListItemCopyWith<$Res> {
  _$ShoppingListItemCopyWithImpl(this._self, this._then);

  final ShoppingListItem _self;
  final $Res Function(ShoppingListItem) _then;

/// Create a copy of ShoppingListItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? material = null,Object? availableQuantity = null,Object? requiredQuantity = null,}) {
  return _then(_self.copyWith(
material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as Material,availableQuantity: null == availableQuantity ? _self.availableQuantity : availableQuantity // ignore: cast_nullable_to_non_nullable
as double,requiredQuantity: null == requiredQuantity ? _self.requiredQuantity : requiredQuantity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ShoppingListItem].
extension ShoppingListItemPatterns on ShoppingListItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShoppingListItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShoppingListItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShoppingListItem value)  $default,){
final _that = this;
switch (_that) {
case _ShoppingListItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShoppingListItem value)?  $default,){
final _that = this;
switch (_that) {
case _ShoppingListItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Material material,  double availableQuantity,  double requiredQuantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShoppingListItem() when $default != null:
return $default(_that.material,_that.availableQuantity,_that.requiredQuantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Material material,  double availableQuantity,  double requiredQuantity)  $default,) {final _that = this;
switch (_that) {
case _ShoppingListItem():
return $default(_that.material,_that.availableQuantity,_that.requiredQuantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Material material,  double availableQuantity,  double requiredQuantity)?  $default,) {final _that = this;
switch (_that) {
case _ShoppingListItem() when $default != null:
return $default(_that.material,_that.availableQuantity,_that.requiredQuantity);case _:
  return null;

}
}

}

/// @nodoc


class _ShoppingListItem implements ShoppingListItem {
  const _ShoppingListItem({required this.material, required this.availableQuantity, required this.requiredQuantity});
  

@override final  Material material;
@override final  double availableQuantity;
@override final  double requiredQuantity;

/// Create a copy of ShoppingListItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShoppingListItemCopyWith<_ShoppingListItem> get copyWith => __$ShoppingListItemCopyWithImpl<_ShoppingListItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShoppingListItem&&(identical(other.material, material) || other.material == material)&&(identical(other.availableQuantity, availableQuantity) || other.availableQuantity == availableQuantity)&&(identical(other.requiredQuantity, requiredQuantity) || other.requiredQuantity == requiredQuantity));
}


@override
int get hashCode => Object.hash(runtimeType,material,availableQuantity,requiredQuantity);

@override
String toString() {
  return 'ShoppingListItem(material: $material, availableQuantity: $availableQuantity, requiredQuantity: $requiredQuantity)';
}


}

/// @nodoc
abstract mixin class _$ShoppingListItemCopyWith<$Res> implements $ShoppingListItemCopyWith<$Res> {
  factory _$ShoppingListItemCopyWith(_ShoppingListItem value, $Res Function(_ShoppingListItem) _then) = __$ShoppingListItemCopyWithImpl;
@override @useResult
$Res call({
 Material material, double availableQuantity, double requiredQuantity
});




}
/// @nodoc
class __$ShoppingListItemCopyWithImpl<$Res>
    implements _$ShoppingListItemCopyWith<$Res> {
  __$ShoppingListItemCopyWithImpl(this._self, this._then);

  final _ShoppingListItem _self;
  final $Res Function(_ShoppingListItem) _then;

/// Create a copy of ShoppingListItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? material = null,Object? availableQuantity = null,Object? requiredQuantity = null,}) {
  return _then(_ShoppingListItem(
material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as Material,availableQuantity: null == availableQuantity ? _self.availableQuantity : availableQuantity // ignore: cast_nullable_to_non_nullable
as double,requiredQuantity: null == requiredQuantity ? _self.requiredQuantity : requiredQuantity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$HomeState {

 HomeStatus get status; int? get quoteIndex; List<ShoppingListItem> get shoppingList; String? get errorMessage;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.status, status) || other.status == status)&&(identical(other.quoteIndex, quoteIndex) || other.quoteIndex == quoteIndex)&&const DeepCollectionEquality().equals(other.shoppingList, shoppingList)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,quoteIndex,const DeepCollectionEquality().hash(shoppingList),errorMessage);

@override
String toString() {
  return 'HomeState(status: $status, quoteIndex: $quoteIndex, shoppingList: $shoppingList, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 HomeStatus status, int? quoteIndex, List<ShoppingListItem> shoppingList, String? errorMessage
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? quoteIndex = freezed,Object? shoppingList = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeStatus,quoteIndex: freezed == quoteIndex ? _self.quoteIndex : quoteIndex // ignore: cast_nullable_to_non_nullable
as int?,shoppingList: null == shoppingList ? _self.shoppingList : shoppingList // ignore: cast_nullable_to_non_nullable
as List<ShoppingListItem>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HomeStatus status,  int? quoteIndex,  List<ShoppingListItem> shoppingList,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.status,_that.quoteIndex,_that.shoppingList,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HomeStatus status,  int? quoteIndex,  List<ShoppingListItem> shoppingList,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.status,_that.quoteIndex,_that.shoppingList,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HomeStatus status,  int? quoteIndex,  List<ShoppingListItem> shoppingList,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.status,_that.quoteIndex,_that.shoppingList,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.status = HomeStatus.initial, this.quoteIndex, final  List<ShoppingListItem> shoppingList = const [], this.errorMessage}): _shoppingList = shoppingList;
  

@override@JsonKey() final  HomeStatus status;
@override final  int? quoteIndex;
 final  List<ShoppingListItem> _shoppingList;
@override@JsonKey() List<ShoppingListItem> get shoppingList {
  if (_shoppingList is EqualUnmodifiableListView) return _shoppingList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shoppingList);
}

@override final  String? errorMessage;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.status, status) || other.status == status)&&(identical(other.quoteIndex, quoteIndex) || other.quoteIndex == quoteIndex)&&const DeepCollectionEquality().equals(other._shoppingList, _shoppingList)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,quoteIndex,const DeepCollectionEquality().hash(_shoppingList),errorMessage);

@override
String toString() {
  return 'HomeState(status: $status, quoteIndex: $quoteIndex, shoppingList: $shoppingList, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 HomeStatus status, int? quoteIndex, List<ShoppingListItem> shoppingList, String? errorMessage
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? quoteIndex = freezed,Object? shoppingList = null,Object? errorMessage = freezed,}) {
  return _then(_HomeState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HomeStatus,quoteIndex: freezed == quoteIndex ? _self.quoteIndex : quoteIndex // ignore: cast_nullable_to_non_nullable
as int?,shoppingList: null == shoppingList ? _self._shoppingList : shoppingList // ignore: cast_nullable_to_non_nullable
as List<ShoppingListItem>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
