// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MaterialListItem {

 Material get material; double get availableQuantity;
/// Create a copy of MaterialListItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaterialListItemCopyWith<MaterialListItem> get copyWith => _$MaterialListItemCopyWithImpl<MaterialListItem>(this as MaterialListItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialListItem&&(identical(other.material, material) || other.material == material)&&(identical(other.availableQuantity, availableQuantity) || other.availableQuantity == availableQuantity));
}


@override
int get hashCode => Object.hash(runtimeType,material,availableQuantity);

@override
String toString() {
  return 'MaterialListItem(material: $material, availableQuantity: $availableQuantity)';
}


}

/// @nodoc
abstract mixin class $MaterialListItemCopyWith<$Res>  {
  factory $MaterialListItemCopyWith(MaterialListItem value, $Res Function(MaterialListItem) _then) = _$MaterialListItemCopyWithImpl;
@useResult
$Res call({
 Material material, double availableQuantity
});




}
/// @nodoc
class _$MaterialListItemCopyWithImpl<$Res>
    implements $MaterialListItemCopyWith<$Res> {
  _$MaterialListItemCopyWithImpl(this._self, this._then);

  final MaterialListItem _self;
  final $Res Function(MaterialListItem) _then;

/// Create a copy of MaterialListItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? material = null,Object? availableQuantity = null,}) {
  return _then(_self.copyWith(
material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as Material,availableQuantity: null == availableQuantity ? _self.availableQuantity : availableQuantity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [MaterialListItem].
extension MaterialListItemPatterns on MaterialListItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaterialListItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaterialListItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaterialListItem value)  $default,){
final _that = this;
switch (_that) {
case _MaterialListItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaterialListItem value)?  $default,){
final _that = this;
switch (_that) {
case _MaterialListItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Material material,  double availableQuantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaterialListItem() when $default != null:
return $default(_that.material,_that.availableQuantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Material material,  double availableQuantity)  $default,) {final _that = this;
switch (_that) {
case _MaterialListItem():
return $default(_that.material,_that.availableQuantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Material material,  double availableQuantity)?  $default,) {final _that = this;
switch (_that) {
case _MaterialListItem() when $default != null:
return $default(_that.material,_that.availableQuantity);case _:
  return null;

}
}

}

/// @nodoc


class _MaterialListItem extends MaterialListItem {
  const _MaterialListItem({required this.material, required this.availableQuantity}): super._();
  

@override final  Material material;
@override final  double availableQuantity;

/// Create a copy of MaterialListItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaterialListItemCopyWith<_MaterialListItem> get copyWith => __$MaterialListItemCopyWithImpl<_MaterialListItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaterialListItem&&(identical(other.material, material) || other.material == material)&&(identical(other.availableQuantity, availableQuantity) || other.availableQuantity == availableQuantity));
}


@override
int get hashCode => Object.hash(runtimeType,material,availableQuantity);

@override
String toString() {
  return 'MaterialListItem(material: $material, availableQuantity: $availableQuantity)';
}


}

/// @nodoc
abstract mixin class _$MaterialListItemCopyWith<$Res> implements $MaterialListItemCopyWith<$Res> {
  factory _$MaterialListItemCopyWith(_MaterialListItem value, $Res Function(_MaterialListItem) _then) = __$MaterialListItemCopyWithImpl;
@override @useResult
$Res call({
 Material material, double availableQuantity
});




}
/// @nodoc
class __$MaterialListItemCopyWithImpl<$Res>
    implements _$MaterialListItemCopyWith<$Res> {
  __$MaterialListItemCopyWithImpl(this._self, this._then);

  final _MaterialListItem _self;
  final $Res Function(_MaterialListItem) _then;

/// Create a copy of MaterialListItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? material = null,Object? availableQuantity = null,}) {
  return _then(_MaterialListItem(
material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as Material,availableQuantity: null == availableQuantity ? _self.availableQuantity : availableQuantity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$InventoryState {

 InventoryStatus get status; List<MaterialListItem> get items; String get searchQuery; String? get errorMessage; bool get isMaterialInUse; String? get pickedImageMaterialId; Uint8List? get pickedImageBytes; bool get imagePickFailed;
/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryStateCopyWith<InventoryState> get copyWith => _$InventoryStateCopyWithImpl<InventoryState>(this as InventoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isMaterialInUse, isMaterialInUse) || other.isMaterialInUse == isMaterialInUse)&&(identical(other.pickedImageMaterialId, pickedImageMaterialId) || other.pickedImageMaterialId == pickedImageMaterialId)&&const DeepCollectionEquality().equals(other.pickedImageBytes, pickedImageBytes)&&(identical(other.imagePickFailed, imagePickFailed) || other.imagePickFailed == imagePickFailed));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(items),searchQuery,errorMessage,isMaterialInUse,pickedImageMaterialId,const DeepCollectionEquality().hash(pickedImageBytes),imagePickFailed);

@override
String toString() {
  return 'InventoryState(status: $status, items: $items, searchQuery: $searchQuery, errorMessage: $errorMessage, isMaterialInUse: $isMaterialInUse, pickedImageMaterialId: $pickedImageMaterialId, pickedImageBytes: $pickedImageBytes, imagePickFailed: $imagePickFailed)';
}


}

/// @nodoc
abstract mixin class $InventoryStateCopyWith<$Res>  {
  factory $InventoryStateCopyWith(InventoryState value, $Res Function(InventoryState) _then) = _$InventoryStateCopyWithImpl;
@useResult
$Res call({
 InventoryStatus status, List<MaterialListItem> items, String searchQuery, String? errorMessage, bool isMaterialInUse, String? pickedImageMaterialId, Uint8List? pickedImageBytes, bool imagePickFailed
});




}
/// @nodoc
class _$InventoryStateCopyWithImpl<$Res>
    implements $InventoryStateCopyWith<$Res> {
  _$InventoryStateCopyWithImpl(this._self, this._then);

  final InventoryState _self;
  final $Res Function(InventoryState) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? items = null,Object? searchQuery = null,Object? errorMessage = freezed,Object? isMaterialInUse = null,Object? pickedImageMaterialId = freezed,Object? pickedImageBytes = freezed,Object? imagePickFailed = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InventoryStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<MaterialListItem>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isMaterialInUse: null == isMaterialInUse ? _self.isMaterialInUse : isMaterialInUse // ignore: cast_nullable_to_non_nullable
as bool,pickedImageMaterialId: freezed == pickedImageMaterialId ? _self.pickedImageMaterialId : pickedImageMaterialId // ignore: cast_nullable_to_non_nullable
as String?,pickedImageBytes: freezed == pickedImageBytes ? _self.pickedImageBytes : pickedImageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,imagePickFailed: null == imagePickFailed ? _self.imagePickFailed : imagePickFailed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [InventoryState].
extension InventoryStatePatterns on InventoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InventoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InventoryState value)  $default,){
final _that = this;
switch (_that) {
case _InventoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InventoryState value)?  $default,){
final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( InventoryStatus status,  List<MaterialListItem> items,  String searchQuery,  String? errorMessage,  bool isMaterialInUse,  String? pickedImageMaterialId,  Uint8List? pickedImageBytes,  bool imagePickFailed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
return $default(_that.status,_that.items,_that.searchQuery,_that.errorMessage,_that.isMaterialInUse,_that.pickedImageMaterialId,_that.pickedImageBytes,_that.imagePickFailed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( InventoryStatus status,  List<MaterialListItem> items,  String searchQuery,  String? errorMessage,  bool isMaterialInUse,  String? pickedImageMaterialId,  Uint8List? pickedImageBytes,  bool imagePickFailed)  $default,) {final _that = this;
switch (_that) {
case _InventoryState():
return $default(_that.status,_that.items,_that.searchQuery,_that.errorMessage,_that.isMaterialInUse,_that.pickedImageMaterialId,_that.pickedImageBytes,_that.imagePickFailed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( InventoryStatus status,  List<MaterialListItem> items,  String searchQuery,  String? errorMessage,  bool isMaterialInUse,  String? pickedImageMaterialId,  Uint8List? pickedImageBytes,  bool imagePickFailed)?  $default,) {final _that = this;
switch (_that) {
case _InventoryState() when $default != null:
return $default(_that.status,_that.items,_that.searchQuery,_that.errorMessage,_that.isMaterialInUse,_that.pickedImageMaterialId,_that.pickedImageBytes,_that.imagePickFailed);case _:
  return null;

}
}

}

/// @nodoc


class _InventoryState extends InventoryState {
  const _InventoryState({this.status = InventoryStatus.initial, final  List<MaterialListItem> items = const [], this.searchQuery = '', this.errorMessage, this.isMaterialInUse = false, this.pickedImageMaterialId, this.pickedImageBytes, this.imagePickFailed = false}): _items = items,super._();
  

@override@JsonKey() final  InventoryStatus status;
 final  List<MaterialListItem> _items;
@override@JsonKey() List<MaterialListItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  String searchQuery;
@override final  String? errorMessage;
@override@JsonKey() final  bool isMaterialInUse;
@override final  String? pickedImageMaterialId;
@override final  Uint8List? pickedImageBytes;
@override@JsonKey() final  bool imagePickFailed;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InventoryStateCopyWith<_InventoryState> get copyWith => __$InventoryStateCopyWithImpl<_InventoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InventoryState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isMaterialInUse, isMaterialInUse) || other.isMaterialInUse == isMaterialInUse)&&(identical(other.pickedImageMaterialId, pickedImageMaterialId) || other.pickedImageMaterialId == pickedImageMaterialId)&&const DeepCollectionEquality().equals(other.pickedImageBytes, pickedImageBytes)&&(identical(other.imagePickFailed, imagePickFailed) || other.imagePickFailed == imagePickFailed));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_items),searchQuery,errorMessage,isMaterialInUse,pickedImageMaterialId,const DeepCollectionEquality().hash(pickedImageBytes),imagePickFailed);

@override
String toString() {
  return 'InventoryState(status: $status, items: $items, searchQuery: $searchQuery, errorMessage: $errorMessage, isMaterialInUse: $isMaterialInUse, pickedImageMaterialId: $pickedImageMaterialId, pickedImageBytes: $pickedImageBytes, imagePickFailed: $imagePickFailed)';
}


}

/// @nodoc
abstract mixin class _$InventoryStateCopyWith<$Res> implements $InventoryStateCopyWith<$Res> {
  factory _$InventoryStateCopyWith(_InventoryState value, $Res Function(_InventoryState) _then) = __$InventoryStateCopyWithImpl;
@override @useResult
$Res call({
 InventoryStatus status, List<MaterialListItem> items, String searchQuery, String? errorMessage, bool isMaterialInUse, String? pickedImageMaterialId, Uint8List? pickedImageBytes, bool imagePickFailed
});




}
/// @nodoc
class __$InventoryStateCopyWithImpl<$Res>
    implements _$InventoryStateCopyWith<$Res> {
  __$InventoryStateCopyWithImpl(this._self, this._then);

  final _InventoryState _self;
  final $Res Function(_InventoryState) _then;

/// Create a copy of InventoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? items = null,Object? searchQuery = null,Object? errorMessage = freezed,Object? isMaterialInUse = null,Object? pickedImageMaterialId = freezed,Object? pickedImageBytes = freezed,Object? imagePickFailed = null,}) {
  return _then(_InventoryState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as InventoryStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<MaterialListItem>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isMaterialInUse: null == isMaterialInUse ? _self.isMaterialInUse : isMaterialInUse // ignore: cast_nullable_to_non_nullable
as bool,pickedImageMaterialId: freezed == pickedImageMaterialId ? _self.pickedImageMaterialId : pickedImageMaterialId // ignore: cast_nullable_to_non_nullable
as String?,pickedImageBytes: freezed == pickedImageBytes ? _self.pickedImageBytes : pickedImageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,imagePickFailed: null == imagePickFailed ? _self.imagePickFailed : imagePickFailed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
