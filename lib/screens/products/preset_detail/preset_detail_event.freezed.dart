// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preset_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PresetDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresetDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PresetDetailEvent()';
}


}

/// @nodoc
class $PresetDetailEventCopyWith<$Res>  {
$PresetDetailEventCopyWith(PresetDetailEvent _, $Res Function(PresetDetailEvent) __);
}


/// Adds pattern-matching-related methods to [PresetDetailEvent].
extension PresetDetailEventPatterns on PresetDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PresetDetailStarted value)?  started,TResult Function( PresetDetailQuantityChanged value)?  quantityChanged,TResult Function( PresetDetailPresetUpdated value)?  presetUpdated,TResult Function( PresetDetailDeleteRequested value)?  deleteRequested,TResult Function( PresetDetailImageSelected value)?  imageSelected,TResult Function( PresetDetailImagePickRequested value)?  imagePickRequested,TResult Function( PresetDetailImagePickFailureConsumed value)?  imagePickFailureConsumed,TResult Function( PresetDetailMaterialAdded value)?  materialAdded,TResult Function( PresetDetailCreateProductRequested value)?  createProductRequested,TResult Function( PresetDetailBackTapped value)?  backTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PresetDetailStarted() when started != null:
return started(_that);case PresetDetailQuantityChanged() when quantityChanged != null:
return quantityChanged(_that);case PresetDetailPresetUpdated() when presetUpdated != null:
return presetUpdated(_that);case PresetDetailDeleteRequested() when deleteRequested != null:
return deleteRequested(_that);case PresetDetailImageSelected() when imageSelected != null:
return imageSelected(_that);case PresetDetailImagePickRequested() when imagePickRequested != null:
return imagePickRequested(_that);case PresetDetailImagePickFailureConsumed() when imagePickFailureConsumed != null:
return imagePickFailureConsumed(_that);case PresetDetailMaterialAdded() when materialAdded != null:
return materialAdded(_that);case PresetDetailCreateProductRequested() when createProductRequested != null:
return createProductRequested(_that);case PresetDetailBackTapped() when backTapped != null:
return backTapped(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PresetDetailStarted value)  started,required TResult Function( PresetDetailQuantityChanged value)  quantityChanged,required TResult Function( PresetDetailPresetUpdated value)  presetUpdated,required TResult Function( PresetDetailDeleteRequested value)  deleteRequested,required TResult Function( PresetDetailImageSelected value)  imageSelected,required TResult Function( PresetDetailImagePickRequested value)  imagePickRequested,required TResult Function( PresetDetailImagePickFailureConsumed value)  imagePickFailureConsumed,required TResult Function( PresetDetailMaterialAdded value)  materialAdded,required TResult Function( PresetDetailCreateProductRequested value)  createProductRequested,required TResult Function( PresetDetailBackTapped value)  backTapped,}){
final _that = this;
switch (_that) {
case PresetDetailStarted():
return started(_that);case PresetDetailQuantityChanged():
return quantityChanged(_that);case PresetDetailPresetUpdated():
return presetUpdated(_that);case PresetDetailDeleteRequested():
return deleteRequested(_that);case PresetDetailImageSelected():
return imageSelected(_that);case PresetDetailImagePickRequested():
return imagePickRequested(_that);case PresetDetailImagePickFailureConsumed():
return imagePickFailureConsumed(_that);case PresetDetailMaterialAdded():
return materialAdded(_that);case PresetDetailCreateProductRequested():
return createProductRequested(_that);case PresetDetailBackTapped():
return backTapped(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PresetDetailStarted value)?  started,TResult? Function( PresetDetailQuantityChanged value)?  quantityChanged,TResult? Function( PresetDetailPresetUpdated value)?  presetUpdated,TResult? Function( PresetDetailDeleteRequested value)?  deleteRequested,TResult? Function( PresetDetailImageSelected value)?  imageSelected,TResult? Function( PresetDetailImagePickRequested value)?  imagePickRequested,TResult? Function( PresetDetailImagePickFailureConsumed value)?  imagePickFailureConsumed,TResult? Function( PresetDetailMaterialAdded value)?  materialAdded,TResult? Function( PresetDetailCreateProductRequested value)?  createProductRequested,TResult? Function( PresetDetailBackTapped value)?  backTapped,}){
final _that = this;
switch (_that) {
case PresetDetailStarted() when started != null:
return started(_that);case PresetDetailQuantityChanged() when quantityChanged != null:
return quantityChanged(_that);case PresetDetailPresetUpdated() when presetUpdated != null:
return presetUpdated(_that);case PresetDetailDeleteRequested() when deleteRequested != null:
return deleteRequested(_that);case PresetDetailImageSelected() when imageSelected != null:
return imageSelected(_that);case PresetDetailImagePickRequested() when imagePickRequested != null:
return imagePickRequested(_that);case PresetDetailImagePickFailureConsumed() when imagePickFailureConsumed != null:
return imagePickFailureConsumed(_that);case PresetDetailMaterialAdded() when materialAdded != null:
return materialAdded(_that);case PresetDetailCreateProductRequested() when createProductRequested != null:
return createProductRequested(_that);case PresetDetailBackTapped() when backTapped != null:
return backTapped(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String presetId,  String? untouchedDraftDefaultName)?  started,TResult Function( String lineId,  double quantity)?  quantityChanged,TResult Function( String name,  String description)?  presetUpdated,TResult Function()?  deleteRequested,TResult Function( Uint8List bytes)?  imageSelected,TResult Function()?  imagePickRequested,TResult Function()?  imagePickFailureConsumed,TResult Function( String materialId)?  materialAdded,TResult Function()?  createProductRequested,TResult Function()?  backTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PresetDetailStarted() when started != null:
return started(_that.presetId,_that.untouchedDraftDefaultName);case PresetDetailQuantityChanged() when quantityChanged != null:
return quantityChanged(_that.lineId,_that.quantity);case PresetDetailPresetUpdated() when presetUpdated != null:
return presetUpdated(_that.name,_that.description);case PresetDetailDeleteRequested() when deleteRequested != null:
return deleteRequested();case PresetDetailImageSelected() when imageSelected != null:
return imageSelected(_that.bytes);case PresetDetailImagePickRequested() when imagePickRequested != null:
return imagePickRequested();case PresetDetailImagePickFailureConsumed() when imagePickFailureConsumed != null:
return imagePickFailureConsumed();case PresetDetailMaterialAdded() when materialAdded != null:
return materialAdded(_that.materialId);case PresetDetailCreateProductRequested() when createProductRequested != null:
return createProductRequested();case PresetDetailBackTapped() when backTapped != null:
return backTapped();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String presetId,  String? untouchedDraftDefaultName)  started,required TResult Function( String lineId,  double quantity)  quantityChanged,required TResult Function( String name,  String description)  presetUpdated,required TResult Function()  deleteRequested,required TResult Function( Uint8List bytes)  imageSelected,required TResult Function()  imagePickRequested,required TResult Function()  imagePickFailureConsumed,required TResult Function( String materialId)  materialAdded,required TResult Function()  createProductRequested,required TResult Function()  backTapped,}) {final _that = this;
switch (_that) {
case PresetDetailStarted():
return started(_that.presetId,_that.untouchedDraftDefaultName);case PresetDetailQuantityChanged():
return quantityChanged(_that.lineId,_that.quantity);case PresetDetailPresetUpdated():
return presetUpdated(_that.name,_that.description);case PresetDetailDeleteRequested():
return deleteRequested();case PresetDetailImageSelected():
return imageSelected(_that.bytes);case PresetDetailImagePickRequested():
return imagePickRequested();case PresetDetailImagePickFailureConsumed():
return imagePickFailureConsumed();case PresetDetailMaterialAdded():
return materialAdded(_that.materialId);case PresetDetailCreateProductRequested():
return createProductRequested();case PresetDetailBackTapped():
return backTapped();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String presetId,  String? untouchedDraftDefaultName)?  started,TResult? Function( String lineId,  double quantity)?  quantityChanged,TResult? Function( String name,  String description)?  presetUpdated,TResult? Function()?  deleteRequested,TResult? Function( Uint8List bytes)?  imageSelected,TResult? Function()?  imagePickRequested,TResult? Function()?  imagePickFailureConsumed,TResult? Function( String materialId)?  materialAdded,TResult? Function()?  createProductRequested,TResult? Function()?  backTapped,}) {final _that = this;
switch (_that) {
case PresetDetailStarted() when started != null:
return started(_that.presetId,_that.untouchedDraftDefaultName);case PresetDetailQuantityChanged() when quantityChanged != null:
return quantityChanged(_that.lineId,_that.quantity);case PresetDetailPresetUpdated() when presetUpdated != null:
return presetUpdated(_that.name,_that.description);case PresetDetailDeleteRequested() when deleteRequested != null:
return deleteRequested();case PresetDetailImageSelected() when imageSelected != null:
return imageSelected(_that.bytes);case PresetDetailImagePickRequested() when imagePickRequested != null:
return imagePickRequested();case PresetDetailImagePickFailureConsumed() when imagePickFailureConsumed != null:
return imagePickFailureConsumed();case PresetDetailMaterialAdded() when materialAdded != null:
return materialAdded(_that.materialId);case PresetDetailCreateProductRequested() when createProductRequested != null:
return createProductRequested();case PresetDetailBackTapped() when backTapped != null:
return backTapped();case _:
  return null;

}
}

}

/// @nodoc


class PresetDetailStarted implements PresetDetailEvent {
  const PresetDetailStarted(this.presetId, {this.untouchedDraftDefaultName});
  

 final  String presetId;
 final  String? untouchedDraftDefaultName;

/// Create a copy of PresetDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresetDetailStartedCopyWith<PresetDetailStarted> get copyWith => _$PresetDetailStartedCopyWithImpl<PresetDetailStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresetDetailStarted&&(identical(other.presetId, presetId) || other.presetId == presetId)&&(identical(other.untouchedDraftDefaultName, untouchedDraftDefaultName) || other.untouchedDraftDefaultName == untouchedDraftDefaultName));
}


@override
int get hashCode => Object.hash(runtimeType,presetId,untouchedDraftDefaultName);

@override
String toString() {
  return 'PresetDetailEvent.started(presetId: $presetId, untouchedDraftDefaultName: $untouchedDraftDefaultName)';
}


}

/// @nodoc
abstract mixin class $PresetDetailStartedCopyWith<$Res> implements $PresetDetailEventCopyWith<$Res> {
  factory $PresetDetailStartedCopyWith(PresetDetailStarted value, $Res Function(PresetDetailStarted) _then) = _$PresetDetailStartedCopyWithImpl;
@useResult
$Res call({
 String presetId, String? untouchedDraftDefaultName
});




}
/// @nodoc
class _$PresetDetailStartedCopyWithImpl<$Res>
    implements $PresetDetailStartedCopyWith<$Res> {
  _$PresetDetailStartedCopyWithImpl(this._self, this._then);

  final PresetDetailStarted _self;
  final $Res Function(PresetDetailStarted) _then;

/// Create a copy of PresetDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? presetId = null,Object? untouchedDraftDefaultName = freezed,}) {
  return _then(PresetDetailStarted(
null == presetId ? _self.presetId : presetId // ignore: cast_nullable_to_non_nullable
as String,untouchedDraftDefaultName: freezed == untouchedDraftDefaultName ? _self.untouchedDraftDefaultName : untouchedDraftDefaultName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class PresetDetailQuantityChanged implements PresetDetailEvent {
  const PresetDetailQuantityChanged({required this.lineId, required this.quantity});
  

 final  String lineId;
 final  double quantity;

/// Create a copy of PresetDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresetDetailQuantityChangedCopyWith<PresetDetailQuantityChanged> get copyWith => _$PresetDetailQuantityChangedCopyWithImpl<PresetDetailQuantityChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresetDetailQuantityChanged&&(identical(other.lineId, lineId) || other.lineId == lineId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,lineId,quantity);

@override
String toString() {
  return 'PresetDetailEvent.quantityChanged(lineId: $lineId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $PresetDetailQuantityChangedCopyWith<$Res> implements $PresetDetailEventCopyWith<$Res> {
  factory $PresetDetailQuantityChangedCopyWith(PresetDetailQuantityChanged value, $Res Function(PresetDetailQuantityChanged) _then) = _$PresetDetailQuantityChangedCopyWithImpl;
@useResult
$Res call({
 String lineId, double quantity
});




}
/// @nodoc
class _$PresetDetailQuantityChangedCopyWithImpl<$Res>
    implements $PresetDetailQuantityChangedCopyWith<$Res> {
  _$PresetDetailQuantityChangedCopyWithImpl(this._self, this._then);

  final PresetDetailQuantityChanged _self;
  final $Res Function(PresetDetailQuantityChanged) _then;

/// Create a copy of PresetDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lineId = null,Object? quantity = null,}) {
  return _then(PresetDetailQuantityChanged(
lineId: null == lineId ? _self.lineId : lineId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class PresetDetailPresetUpdated implements PresetDetailEvent {
  const PresetDetailPresetUpdated({required this.name, required this.description});
  

 final  String name;
 final  String description;

/// Create a copy of PresetDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresetDetailPresetUpdatedCopyWith<PresetDetailPresetUpdated> get copyWith => _$PresetDetailPresetUpdatedCopyWithImpl<PresetDetailPresetUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresetDetailPresetUpdated&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,name,description);

@override
String toString() {
  return 'PresetDetailEvent.presetUpdated(name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $PresetDetailPresetUpdatedCopyWith<$Res> implements $PresetDetailEventCopyWith<$Res> {
  factory $PresetDetailPresetUpdatedCopyWith(PresetDetailPresetUpdated value, $Res Function(PresetDetailPresetUpdated) _then) = _$PresetDetailPresetUpdatedCopyWithImpl;
@useResult
$Res call({
 String name, String description
});




}
/// @nodoc
class _$PresetDetailPresetUpdatedCopyWithImpl<$Res>
    implements $PresetDetailPresetUpdatedCopyWith<$Res> {
  _$PresetDetailPresetUpdatedCopyWithImpl(this._self, this._then);

  final PresetDetailPresetUpdated _self;
  final $Res Function(PresetDetailPresetUpdated) _then;

/// Create a copy of PresetDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,}) {
  return _then(PresetDetailPresetUpdated(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PresetDetailDeleteRequested implements PresetDetailEvent {
  const PresetDetailDeleteRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresetDetailDeleteRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PresetDetailEvent.deleteRequested()';
}


}




/// @nodoc


class PresetDetailImageSelected implements PresetDetailEvent {
  const PresetDetailImageSelected(this.bytes);
  

 final  Uint8List bytes;

/// Create a copy of PresetDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresetDetailImageSelectedCopyWith<PresetDetailImageSelected> get copyWith => _$PresetDetailImageSelectedCopyWithImpl<PresetDetailImageSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresetDetailImageSelected&&const DeepCollectionEquality().equals(other.bytes, bytes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(bytes));

@override
String toString() {
  return 'PresetDetailEvent.imageSelected(bytes: $bytes)';
}


}

/// @nodoc
abstract mixin class $PresetDetailImageSelectedCopyWith<$Res> implements $PresetDetailEventCopyWith<$Res> {
  factory $PresetDetailImageSelectedCopyWith(PresetDetailImageSelected value, $Res Function(PresetDetailImageSelected) _then) = _$PresetDetailImageSelectedCopyWithImpl;
@useResult
$Res call({
 Uint8List bytes
});




}
/// @nodoc
class _$PresetDetailImageSelectedCopyWithImpl<$Res>
    implements $PresetDetailImageSelectedCopyWith<$Res> {
  _$PresetDetailImageSelectedCopyWithImpl(this._self, this._then);

  final PresetDetailImageSelected _self;
  final $Res Function(PresetDetailImageSelected) _then;

/// Create a copy of PresetDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? bytes = null,}) {
  return _then(PresetDetailImageSelected(
null == bytes ? _self.bytes : bytes // ignore: cast_nullable_to_non_nullable
as Uint8List,
  ));
}


}

/// @nodoc


class PresetDetailImagePickRequested implements PresetDetailEvent {
  const PresetDetailImagePickRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresetDetailImagePickRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PresetDetailEvent.imagePickRequested()';
}


}




/// @nodoc


class PresetDetailImagePickFailureConsumed implements PresetDetailEvent {
  const PresetDetailImagePickFailureConsumed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresetDetailImagePickFailureConsumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PresetDetailEvent.imagePickFailureConsumed()';
}


}




/// @nodoc


class PresetDetailMaterialAdded implements PresetDetailEvent {
  const PresetDetailMaterialAdded(this.materialId);
  

 final  String materialId;

/// Create a copy of PresetDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresetDetailMaterialAddedCopyWith<PresetDetailMaterialAdded> get copyWith => _$PresetDetailMaterialAddedCopyWithImpl<PresetDetailMaterialAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresetDetailMaterialAdded&&(identical(other.materialId, materialId) || other.materialId == materialId));
}


@override
int get hashCode => Object.hash(runtimeType,materialId);

@override
String toString() {
  return 'PresetDetailEvent.materialAdded(materialId: $materialId)';
}


}

/// @nodoc
abstract mixin class $PresetDetailMaterialAddedCopyWith<$Res> implements $PresetDetailEventCopyWith<$Res> {
  factory $PresetDetailMaterialAddedCopyWith(PresetDetailMaterialAdded value, $Res Function(PresetDetailMaterialAdded) _then) = _$PresetDetailMaterialAddedCopyWithImpl;
@useResult
$Res call({
 String materialId
});




}
/// @nodoc
class _$PresetDetailMaterialAddedCopyWithImpl<$Res>
    implements $PresetDetailMaterialAddedCopyWith<$Res> {
  _$PresetDetailMaterialAddedCopyWithImpl(this._self, this._then);

  final PresetDetailMaterialAdded _self;
  final $Res Function(PresetDetailMaterialAdded) _then;

/// Create a copy of PresetDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? materialId = null,}) {
  return _then(PresetDetailMaterialAdded(
null == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class PresetDetailCreateProductRequested implements PresetDetailEvent {
  const PresetDetailCreateProductRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresetDetailCreateProductRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PresetDetailEvent.createProductRequested()';
}


}




/// @nodoc


class PresetDetailBackTapped implements PresetDetailEvent {
  const PresetDetailBackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresetDetailBackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PresetDetailEvent.backTapped()';
}


}




// dart format on
