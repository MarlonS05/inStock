// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inventory_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InventoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryEvent()';
}


}

/// @nodoc
class $InventoryEventCopyWith<$Res>  {
$InventoryEventCopyWith(InventoryEvent _, $Res Function(InventoryEvent) __);
}


/// Adds pattern-matching-related methods to [InventoryEvent].
extension InventoryEventPatterns on InventoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InventoryStarted value)?  started,TResult Function( InventoryRefreshRequested value)?  refreshRequested,TResult Function( InventorySearchChanged value)?  searchChanged,TResult Function( InventoryMaterialSaved value)?  materialSaved,TResult Function( InventoryMaterialImageSelected value)?  materialImageSelected,TResult Function( InventoryMaterialImagePickRequested value)?  materialImagePickRequested,TResult Function( InventoryPickedImagePreviewConsumed value)?  pickedImagePreviewConsumed,TResult Function( InventoryImagePickFailureConsumed value)?  imagePickFailureConsumed,TResult Function( InventoryMaterialDeleteRequested value)?  materialDeleteRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InventoryStarted() when started != null:
return started(_that);case InventoryRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case InventorySearchChanged() when searchChanged != null:
return searchChanged(_that);case InventoryMaterialSaved() when materialSaved != null:
return materialSaved(_that);case InventoryMaterialImageSelected() when materialImageSelected != null:
return materialImageSelected(_that);case InventoryMaterialImagePickRequested() when materialImagePickRequested != null:
return materialImagePickRequested(_that);case InventoryPickedImagePreviewConsumed() when pickedImagePreviewConsumed != null:
return pickedImagePreviewConsumed(_that);case InventoryImagePickFailureConsumed() when imagePickFailureConsumed != null:
return imagePickFailureConsumed(_that);case InventoryMaterialDeleteRequested() when materialDeleteRequested != null:
return materialDeleteRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InventoryStarted value)  started,required TResult Function( InventoryRefreshRequested value)  refreshRequested,required TResult Function( InventorySearchChanged value)  searchChanged,required TResult Function( InventoryMaterialSaved value)  materialSaved,required TResult Function( InventoryMaterialImageSelected value)  materialImageSelected,required TResult Function( InventoryMaterialImagePickRequested value)  materialImagePickRequested,required TResult Function( InventoryPickedImagePreviewConsumed value)  pickedImagePreviewConsumed,required TResult Function( InventoryImagePickFailureConsumed value)  imagePickFailureConsumed,required TResult Function( InventoryMaterialDeleteRequested value)  materialDeleteRequested,}){
final _that = this;
switch (_that) {
case InventoryStarted():
return started(_that);case InventoryRefreshRequested():
return refreshRequested(_that);case InventorySearchChanged():
return searchChanged(_that);case InventoryMaterialSaved():
return materialSaved(_that);case InventoryMaterialImageSelected():
return materialImageSelected(_that);case InventoryMaterialImagePickRequested():
return materialImagePickRequested(_that);case InventoryPickedImagePreviewConsumed():
return pickedImagePreviewConsumed(_that);case InventoryImagePickFailureConsumed():
return imagePickFailureConsumed(_that);case InventoryMaterialDeleteRequested():
return materialDeleteRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InventoryStarted value)?  started,TResult? Function( InventoryRefreshRequested value)?  refreshRequested,TResult? Function( InventorySearchChanged value)?  searchChanged,TResult? Function( InventoryMaterialSaved value)?  materialSaved,TResult? Function( InventoryMaterialImageSelected value)?  materialImageSelected,TResult? Function( InventoryMaterialImagePickRequested value)?  materialImagePickRequested,TResult? Function( InventoryPickedImagePreviewConsumed value)?  pickedImagePreviewConsumed,TResult? Function( InventoryImagePickFailureConsumed value)?  imagePickFailureConsumed,TResult? Function( InventoryMaterialDeleteRequested value)?  materialDeleteRequested,}){
final _that = this;
switch (_that) {
case InventoryStarted() when started != null:
return started(_that);case InventoryRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case InventorySearchChanged() when searchChanged != null:
return searchChanged(_that);case InventoryMaterialSaved() when materialSaved != null:
return materialSaved(_that);case InventoryMaterialImageSelected() when materialImageSelected != null:
return materialImageSelected(_that);case InventoryMaterialImagePickRequested() when materialImagePickRequested != null:
return materialImagePickRequested(_that);case InventoryPickedImagePreviewConsumed() when pickedImagePreviewConsumed != null:
return pickedImagePreviewConsumed(_that);case InventoryImagePickFailureConsumed() when imagePickFailureConsumed != null:
return imagePickFailureConsumed(_that);case InventoryMaterialDeleteRequested() when materialDeleteRequested != null:
return materialDeleteRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshRequested,TResult Function( String query)?  searchChanged,TResult Function( String? id,  String title,  String description,  double quantity)?  materialSaved,TResult Function( String materialId,  Uint8List bytes)?  materialImageSelected,TResult Function( String materialId)?  materialImagePickRequested,TResult Function()?  pickedImagePreviewConsumed,TResult Function()?  imagePickFailureConsumed,TResult Function( String id)?  materialDeleteRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InventoryStarted() when started != null:
return started();case InventoryRefreshRequested() when refreshRequested != null:
return refreshRequested();case InventorySearchChanged() when searchChanged != null:
return searchChanged(_that.query);case InventoryMaterialSaved() when materialSaved != null:
return materialSaved(_that.id,_that.title,_that.description,_that.quantity);case InventoryMaterialImageSelected() when materialImageSelected != null:
return materialImageSelected(_that.materialId,_that.bytes);case InventoryMaterialImagePickRequested() when materialImagePickRequested != null:
return materialImagePickRequested(_that.materialId);case InventoryPickedImagePreviewConsumed() when pickedImagePreviewConsumed != null:
return pickedImagePreviewConsumed();case InventoryImagePickFailureConsumed() when imagePickFailureConsumed != null:
return imagePickFailureConsumed();case InventoryMaterialDeleteRequested() when materialDeleteRequested != null:
return materialDeleteRequested(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshRequested,required TResult Function( String query)  searchChanged,required TResult Function( String? id,  String title,  String description,  double quantity)  materialSaved,required TResult Function( String materialId,  Uint8List bytes)  materialImageSelected,required TResult Function( String materialId)  materialImagePickRequested,required TResult Function()  pickedImagePreviewConsumed,required TResult Function()  imagePickFailureConsumed,required TResult Function( String id)  materialDeleteRequested,}) {final _that = this;
switch (_that) {
case InventoryStarted():
return started();case InventoryRefreshRequested():
return refreshRequested();case InventorySearchChanged():
return searchChanged(_that.query);case InventoryMaterialSaved():
return materialSaved(_that.id,_that.title,_that.description,_that.quantity);case InventoryMaterialImageSelected():
return materialImageSelected(_that.materialId,_that.bytes);case InventoryMaterialImagePickRequested():
return materialImagePickRequested(_that.materialId);case InventoryPickedImagePreviewConsumed():
return pickedImagePreviewConsumed();case InventoryImagePickFailureConsumed():
return imagePickFailureConsumed();case InventoryMaterialDeleteRequested():
return materialDeleteRequested(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshRequested,TResult? Function( String query)?  searchChanged,TResult? Function( String? id,  String title,  String description,  double quantity)?  materialSaved,TResult? Function( String materialId,  Uint8List bytes)?  materialImageSelected,TResult? Function( String materialId)?  materialImagePickRequested,TResult? Function()?  pickedImagePreviewConsumed,TResult? Function()?  imagePickFailureConsumed,TResult? Function( String id)?  materialDeleteRequested,}) {final _that = this;
switch (_that) {
case InventoryStarted() when started != null:
return started();case InventoryRefreshRequested() when refreshRequested != null:
return refreshRequested();case InventorySearchChanged() when searchChanged != null:
return searchChanged(_that.query);case InventoryMaterialSaved() when materialSaved != null:
return materialSaved(_that.id,_that.title,_that.description,_that.quantity);case InventoryMaterialImageSelected() when materialImageSelected != null:
return materialImageSelected(_that.materialId,_that.bytes);case InventoryMaterialImagePickRequested() when materialImagePickRequested != null:
return materialImagePickRequested(_that.materialId);case InventoryPickedImagePreviewConsumed() when pickedImagePreviewConsumed != null:
return pickedImagePreviewConsumed();case InventoryImagePickFailureConsumed() when imagePickFailureConsumed != null:
return imagePickFailureConsumed();case InventoryMaterialDeleteRequested() when materialDeleteRequested != null:
return materialDeleteRequested(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class InventoryStarted implements InventoryEvent {
  const InventoryStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryEvent.started()';
}


}




/// @nodoc


class InventoryRefreshRequested implements InventoryEvent {
  const InventoryRefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryEvent.refreshRequested()';
}


}




/// @nodoc


class InventorySearchChanged implements InventoryEvent {
  const InventorySearchChanged(this.query);
  

 final  String query;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventorySearchChangedCopyWith<InventorySearchChanged> get copyWith => _$InventorySearchChangedCopyWithImpl<InventorySearchChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventorySearchChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'InventoryEvent.searchChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $InventorySearchChangedCopyWith<$Res> implements $InventoryEventCopyWith<$Res> {
  factory $InventorySearchChangedCopyWith(InventorySearchChanged value, $Res Function(InventorySearchChanged) _then) = _$InventorySearchChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$InventorySearchChangedCopyWithImpl<$Res>
    implements $InventorySearchChangedCopyWith<$Res> {
  _$InventorySearchChangedCopyWithImpl(this._self, this._then);

  final InventorySearchChanged _self;
  final $Res Function(InventorySearchChanged) _then;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(InventorySearchChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InventoryMaterialSaved implements InventoryEvent {
  const InventoryMaterialSaved({this.id, required this.title, required this.description, required this.quantity});
  

 final  String? id;
 final  String title;
 final  String description;
 final  double quantity;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryMaterialSavedCopyWith<InventoryMaterialSaved> get copyWith => _$InventoryMaterialSavedCopyWithImpl<InventoryMaterialSaved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryMaterialSaved&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,quantity);

@override
String toString() {
  return 'InventoryEvent.materialSaved(id: $id, title: $title, description: $description, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $InventoryMaterialSavedCopyWith<$Res> implements $InventoryEventCopyWith<$Res> {
  factory $InventoryMaterialSavedCopyWith(InventoryMaterialSaved value, $Res Function(InventoryMaterialSaved) _then) = _$InventoryMaterialSavedCopyWithImpl;
@useResult
$Res call({
 String? id, String title, String description, double quantity
});




}
/// @nodoc
class _$InventoryMaterialSavedCopyWithImpl<$Res>
    implements $InventoryMaterialSavedCopyWith<$Res> {
  _$InventoryMaterialSavedCopyWithImpl(this._self, this._then);

  final InventoryMaterialSaved _self;
  final $Res Function(InventoryMaterialSaved) _then;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = null,Object? description = null,Object? quantity = null,}) {
  return _then(InventoryMaterialSaved(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class InventoryMaterialImageSelected implements InventoryEvent {
  const InventoryMaterialImageSelected({required this.materialId, required this.bytes});
  

 final  String materialId;
 final  Uint8List bytes;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryMaterialImageSelectedCopyWith<InventoryMaterialImageSelected> get copyWith => _$InventoryMaterialImageSelectedCopyWithImpl<InventoryMaterialImageSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryMaterialImageSelected&&(identical(other.materialId, materialId) || other.materialId == materialId)&&const DeepCollectionEquality().equals(other.bytes, bytes));
}


@override
int get hashCode => Object.hash(runtimeType,materialId,const DeepCollectionEquality().hash(bytes));

@override
String toString() {
  return 'InventoryEvent.materialImageSelected(materialId: $materialId, bytes: $bytes)';
}


}

/// @nodoc
abstract mixin class $InventoryMaterialImageSelectedCopyWith<$Res> implements $InventoryEventCopyWith<$Res> {
  factory $InventoryMaterialImageSelectedCopyWith(InventoryMaterialImageSelected value, $Res Function(InventoryMaterialImageSelected) _then) = _$InventoryMaterialImageSelectedCopyWithImpl;
@useResult
$Res call({
 String materialId, Uint8List bytes
});




}
/// @nodoc
class _$InventoryMaterialImageSelectedCopyWithImpl<$Res>
    implements $InventoryMaterialImageSelectedCopyWith<$Res> {
  _$InventoryMaterialImageSelectedCopyWithImpl(this._self, this._then);

  final InventoryMaterialImageSelected _self;
  final $Res Function(InventoryMaterialImageSelected) _then;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? materialId = null,Object? bytes = null,}) {
  return _then(InventoryMaterialImageSelected(
materialId: null == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String,bytes: null == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}


}

/// @nodoc


class InventoryMaterialImagePickRequested implements InventoryEvent {
  const InventoryMaterialImagePickRequested(this.materialId);
  

 final  String materialId;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryMaterialImagePickRequestedCopyWith<InventoryMaterialImagePickRequested> get copyWith => _$InventoryMaterialImagePickRequestedCopyWithImpl<InventoryMaterialImagePickRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryMaterialImagePickRequested&&(identical(other.materialId, materialId) || other.materialId == materialId));
}


@override
int get hashCode => Object.hash(runtimeType,materialId);

@override
String toString() {
  return 'InventoryEvent.materialImagePickRequested(materialId: $materialId)';
}


}

/// @nodoc
abstract mixin class $InventoryMaterialImagePickRequestedCopyWith<$Res> implements $InventoryEventCopyWith<$Res> {
  factory $InventoryMaterialImagePickRequestedCopyWith(InventoryMaterialImagePickRequested value, $Res Function(InventoryMaterialImagePickRequested) _then) = _$InventoryMaterialImagePickRequestedCopyWithImpl;
@useResult
$Res call({
 String materialId
});




}
/// @nodoc
class _$InventoryMaterialImagePickRequestedCopyWithImpl<$Res>
    implements $InventoryMaterialImagePickRequestedCopyWith<$Res> {
  _$InventoryMaterialImagePickRequestedCopyWithImpl(this._self, this._then);

  final InventoryMaterialImagePickRequested _self;
  final $Res Function(InventoryMaterialImagePickRequested) _then;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? materialId = null,}) {
  return _then(InventoryMaterialImagePickRequested(
null == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InventoryPickedImagePreviewConsumed implements InventoryEvent {
  const InventoryPickedImagePreviewConsumed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryPickedImagePreviewConsumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryEvent.pickedImagePreviewConsumed()';
}


}




/// @nodoc


class InventoryImagePickFailureConsumed implements InventoryEvent {
  const InventoryImagePickFailureConsumed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryImagePickFailureConsumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InventoryEvent.imagePickFailureConsumed()';
}


}




/// @nodoc


class InventoryMaterialDeleteRequested implements InventoryEvent {
  const InventoryMaterialDeleteRequested(this.id);
  

 final  String id;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InventoryMaterialDeleteRequestedCopyWith<InventoryMaterialDeleteRequested> get copyWith => _$InventoryMaterialDeleteRequestedCopyWithImpl<InventoryMaterialDeleteRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InventoryMaterialDeleteRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'InventoryEvent.materialDeleteRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class $InventoryMaterialDeleteRequestedCopyWith<$Res> implements $InventoryEventCopyWith<$Res> {
  factory $InventoryMaterialDeleteRequestedCopyWith(InventoryMaterialDeleteRequested value, $Res Function(InventoryMaterialDeleteRequested) _then) = _$InventoryMaterialDeleteRequestedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$InventoryMaterialDeleteRequestedCopyWithImpl<$Res>
    implements $InventoryMaterialDeleteRequestedCopyWith<$Res> {
  _$InventoryMaterialDeleteRequestedCopyWithImpl(this._self, this._then);

  final InventoryMaterialDeleteRequested _self;
  final $Res Function(InventoryMaterialDeleteRequested) _then;

/// Create a copy of InventoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(InventoryMaterialDeleteRequested(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
