// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailEvent()';
}


}

/// @nodoc
class $ProductDetailEventCopyWith<$Res>  {
$ProductDetailEventCopyWith(ProductDetailEvent _, $Res Function(ProductDetailEvent) __);
}


/// Adds pattern-matching-related methods to [ProductDetailEvent].
extension ProductDetailEventPatterns on ProductDetailEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProductDetailStarted value)?  started,TResult Function( ProductDetailProductUpdated value)?  productUpdated,TResult Function( ProductDetailQuantityChanged value)?  quantityChanged,TResult Function( ProductDetailMaterialAdded value)?  materialAdded,TResult Function( ProductDetailFinishRequested value)?  finishRequested,TResult Function( ProductDetailRemoveRequested value)?  removeRequested,TResult Function( ProductDetailBackTapped value)?  backTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProductDetailStarted() when started != null:
return started(_that);case ProductDetailProductUpdated() when productUpdated != null:
return productUpdated(_that);case ProductDetailQuantityChanged() when quantityChanged != null:
return quantityChanged(_that);case ProductDetailMaterialAdded() when materialAdded != null:
return materialAdded(_that);case ProductDetailFinishRequested() when finishRequested != null:
return finishRequested(_that);case ProductDetailRemoveRequested() when removeRequested != null:
return removeRequested(_that);case ProductDetailBackTapped() when backTapped != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProductDetailStarted value)  started,required TResult Function( ProductDetailProductUpdated value)  productUpdated,required TResult Function( ProductDetailQuantityChanged value)  quantityChanged,required TResult Function( ProductDetailMaterialAdded value)  materialAdded,required TResult Function( ProductDetailFinishRequested value)  finishRequested,required TResult Function( ProductDetailRemoveRequested value)  removeRequested,required TResult Function( ProductDetailBackTapped value)  backTapped,}){
final _that = this;
switch (_that) {
case ProductDetailStarted():
return started(_that);case ProductDetailProductUpdated():
return productUpdated(_that);case ProductDetailQuantityChanged():
return quantityChanged(_that);case ProductDetailMaterialAdded():
return materialAdded(_that);case ProductDetailFinishRequested():
return finishRequested(_that);case ProductDetailRemoveRequested():
return removeRequested(_that);case ProductDetailBackTapped():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProductDetailStarted value)?  started,TResult? Function( ProductDetailProductUpdated value)?  productUpdated,TResult? Function( ProductDetailQuantityChanged value)?  quantityChanged,TResult? Function( ProductDetailMaterialAdded value)?  materialAdded,TResult? Function( ProductDetailFinishRequested value)?  finishRequested,TResult? Function( ProductDetailRemoveRequested value)?  removeRequested,TResult? Function( ProductDetailBackTapped value)?  backTapped,}){
final _that = this;
switch (_that) {
case ProductDetailStarted() when started != null:
return started(_that);case ProductDetailProductUpdated() when productUpdated != null:
return productUpdated(_that);case ProductDetailQuantityChanged() when quantityChanged != null:
return quantityChanged(_that);case ProductDetailMaterialAdded() when materialAdded != null:
return materialAdded(_that);case ProductDetailFinishRequested() when finishRequested != null:
return finishRequested(_that);case ProductDetailRemoveRequested() when removeRequested != null:
return removeRequested(_that);case ProductDetailBackTapped() when backTapped != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String productId)?  started,TResult Function( String presetName,  String presetDescription,  String customer)?  productUpdated,TResult Function( String lineId,  double quantity)?  quantityChanged,TResult Function( String materialId)?  materialAdded,TResult Function()?  finishRequested,TResult Function()?  removeRequested,TResult Function()?  backTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProductDetailStarted() when started != null:
return started(_that.productId);case ProductDetailProductUpdated() when productUpdated != null:
return productUpdated(_that.presetName,_that.presetDescription,_that.customer);case ProductDetailQuantityChanged() when quantityChanged != null:
return quantityChanged(_that.lineId,_that.quantity);case ProductDetailMaterialAdded() when materialAdded != null:
return materialAdded(_that.materialId);case ProductDetailFinishRequested() when finishRequested != null:
return finishRequested();case ProductDetailRemoveRequested() when removeRequested != null:
return removeRequested();case ProductDetailBackTapped() when backTapped != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String productId)  started,required TResult Function( String presetName,  String presetDescription,  String customer)  productUpdated,required TResult Function( String lineId,  double quantity)  quantityChanged,required TResult Function( String materialId)  materialAdded,required TResult Function()  finishRequested,required TResult Function()  removeRequested,required TResult Function()  backTapped,}) {final _that = this;
switch (_that) {
case ProductDetailStarted():
return started(_that.productId);case ProductDetailProductUpdated():
return productUpdated(_that.presetName,_that.presetDescription,_that.customer);case ProductDetailQuantityChanged():
return quantityChanged(_that.lineId,_that.quantity);case ProductDetailMaterialAdded():
return materialAdded(_that.materialId);case ProductDetailFinishRequested():
return finishRequested();case ProductDetailRemoveRequested():
return removeRequested();case ProductDetailBackTapped():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String productId)?  started,TResult? Function( String presetName,  String presetDescription,  String customer)?  productUpdated,TResult? Function( String lineId,  double quantity)?  quantityChanged,TResult? Function( String materialId)?  materialAdded,TResult? Function()?  finishRequested,TResult? Function()?  removeRequested,TResult? Function()?  backTapped,}) {final _that = this;
switch (_that) {
case ProductDetailStarted() when started != null:
return started(_that.productId);case ProductDetailProductUpdated() when productUpdated != null:
return productUpdated(_that.presetName,_that.presetDescription,_that.customer);case ProductDetailQuantityChanged() when quantityChanged != null:
return quantityChanged(_that.lineId,_that.quantity);case ProductDetailMaterialAdded() when materialAdded != null:
return materialAdded(_that.materialId);case ProductDetailFinishRequested() when finishRequested != null:
return finishRequested();case ProductDetailRemoveRequested() when removeRequested != null:
return removeRequested();case ProductDetailBackTapped() when backTapped != null:
return backTapped();case _:
  return null;

}
}

}

/// @nodoc


class ProductDetailStarted implements ProductDetailEvent {
  const ProductDetailStarted(this.productId);
  

 final  String productId;

/// Create a copy of ProductDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailStartedCopyWith<ProductDetailStarted> get copyWith => _$ProductDetailStartedCopyWithImpl<ProductDetailStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailStarted&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'ProductDetailEvent.started(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $ProductDetailStartedCopyWith<$Res> implements $ProductDetailEventCopyWith<$Res> {
  factory $ProductDetailStartedCopyWith(ProductDetailStarted value, $Res Function(ProductDetailStarted) _then) = _$ProductDetailStartedCopyWithImpl;
@useResult
$Res call({
 String productId
});




}
/// @nodoc
class _$ProductDetailStartedCopyWithImpl<$Res>
    implements $ProductDetailStartedCopyWith<$Res> {
  _$ProductDetailStartedCopyWithImpl(this._self, this._then);

  final ProductDetailStarted _self;
  final $Res Function(ProductDetailStarted) _then;

/// Create a copy of ProductDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(ProductDetailStarted(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProductDetailProductUpdated implements ProductDetailEvent {
  const ProductDetailProductUpdated({required this.presetName, required this.presetDescription, required this.customer});
  

 final  String presetName;
 final  String presetDescription;
 final  String customer;

/// Create a copy of ProductDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailProductUpdatedCopyWith<ProductDetailProductUpdated> get copyWith => _$ProductDetailProductUpdatedCopyWithImpl<ProductDetailProductUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailProductUpdated&&(identical(other.presetName, presetName) || other.presetName == presetName)&&(identical(other.presetDescription, presetDescription) || other.presetDescription == presetDescription)&&(identical(other.customer, customer) || other.customer == customer));
}


@override
int get hashCode => Object.hash(runtimeType,presetName,presetDescription,customer);

@override
String toString() {
  return 'ProductDetailEvent.productUpdated(presetName: $presetName, presetDescription: $presetDescription, customer: $customer)';
}


}

/// @nodoc
abstract mixin class $ProductDetailProductUpdatedCopyWith<$Res> implements $ProductDetailEventCopyWith<$Res> {
  factory $ProductDetailProductUpdatedCopyWith(ProductDetailProductUpdated value, $Res Function(ProductDetailProductUpdated) _then) = _$ProductDetailProductUpdatedCopyWithImpl;
@useResult
$Res call({
 String presetName, String presetDescription, String customer
});




}
/// @nodoc
class _$ProductDetailProductUpdatedCopyWithImpl<$Res>
    implements $ProductDetailProductUpdatedCopyWith<$Res> {
  _$ProductDetailProductUpdatedCopyWithImpl(this._self, this._then);

  final ProductDetailProductUpdated _self;
  final $Res Function(ProductDetailProductUpdated) _then;

/// Create a copy of ProductDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? presetName = null,Object? presetDescription = null,Object? customer = null,}) {
  return _then(ProductDetailProductUpdated(
presetName: null == presetName ? _self.presetName : presetName // ignore: cast_nullable_to_non_nullable
as String,presetDescription: null == presetDescription ? _self.presetDescription : presetDescription // ignore: cast_nullable_to_non_nullable
as String,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProductDetailQuantityChanged implements ProductDetailEvent {
  const ProductDetailQuantityChanged({required this.lineId, required this.quantity});
  

 final  String lineId;
 final  double quantity;

/// Create a copy of ProductDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailQuantityChangedCopyWith<ProductDetailQuantityChanged> get copyWith => _$ProductDetailQuantityChangedCopyWithImpl<ProductDetailQuantityChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailQuantityChanged&&(identical(other.lineId, lineId) || other.lineId == lineId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,lineId,quantity);

@override
String toString() {
  return 'ProductDetailEvent.quantityChanged(lineId: $lineId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $ProductDetailQuantityChangedCopyWith<$Res> implements $ProductDetailEventCopyWith<$Res> {
  factory $ProductDetailQuantityChangedCopyWith(ProductDetailQuantityChanged value, $Res Function(ProductDetailQuantityChanged) _then) = _$ProductDetailQuantityChangedCopyWithImpl;
@useResult
$Res call({
 String lineId, double quantity
});




}
/// @nodoc
class _$ProductDetailQuantityChangedCopyWithImpl<$Res>
    implements $ProductDetailQuantityChangedCopyWith<$Res> {
  _$ProductDetailQuantityChangedCopyWithImpl(this._self, this._then);

  final ProductDetailQuantityChanged _self;
  final $Res Function(ProductDetailQuantityChanged) _then;

/// Create a copy of ProductDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? lineId = null,Object? quantity = null,}) {
  return _then(ProductDetailQuantityChanged(
lineId: null == lineId ? _self.lineId : lineId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class ProductDetailMaterialAdded implements ProductDetailEvent {
  const ProductDetailMaterialAdded(this.materialId);
  

 final  String materialId;

/// Create a copy of ProductDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailMaterialAddedCopyWith<ProductDetailMaterialAdded> get copyWith => _$ProductDetailMaterialAddedCopyWithImpl<ProductDetailMaterialAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailMaterialAdded&&(identical(other.materialId, materialId) || other.materialId == materialId));
}


@override
int get hashCode => Object.hash(runtimeType,materialId);

@override
String toString() {
  return 'ProductDetailEvent.materialAdded(materialId: $materialId)';
}


}

/// @nodoc
abstract mixin class $ProductDetailMaterialAddedCopyWith<$Res> implements $ProductDetailEventCopyWith<$Res> {
  factory $ProductDetailMaterialAddedCopyWith(ProductDetailMaterialAdded value, $Res Function(ProductDetailMaterialAdded) _then) = _$ProductDetailMaterialAddedCopyWithImpl;
@useResult
$Res call({
 String materialId
});




}
/// @nodoc
class _$ProductDetailMaterialAddedCopyWithImpl<$Res>
    implements $ProductDetailMaterialAddedCopyWith<$Res> {
  _$ProductDetailMaterialAddedCopyWithImpl(this._self, this._then);

  final ProductDetailMaterialAdded _self;
  final $Res Function(ProductDetailMaterialAdded) _then;

/// Create a copy of ProductDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? materialId = null,}) {
  return _then(ProductDetailMaterialAdded(
null == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProductDetailFinishRequested implements ProductDetailEvent {
  const ProductDetailFinishRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailFinishRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailEvent.finishRequested()';
}


}




/// @nodoc


class ProductDetailRemoveRequested implements ProductDetailEvent {
  const ProductDetailRemoveRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailRemoveRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailEvent.removeRequested()';
}


}




/// @nodoc


class ProductDetailBackTapped implements ProductDetailEvent {
  const ProductDetailBackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailBackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductDetailEvent.backTapped()';
}


}




// dart format on
