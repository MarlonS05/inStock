// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductMaterialLine {

 UsedMaterial get line; String get materialTitle; double get onHandQuantity; double get globalReservedQuantity;
/// Create a copy of ProductMaterialLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductMaterialLineCopyWith<ProductMaterialLine> get copyWith => _$ProductMaterialLineCopyWithImpl<ProductMaterialLine>(this as ProductMaterialLine, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductMaterialLine&&(identical(other.line, line) || other.line == line)&&(identical(other.materialTitle, materialTitle) || other.materialTitle == materialTitle)&&(identical(other.onHandQuantity, onHandQuantity) || other.onHandQuantity == onHandQuantity)&&(identical(other.globalReservedQuantity, globalReservedQuantity) || other.globalReservedQuantity == globalReservedQuantity));
}


@override
int get hashCode => Object.hash(runtimeType,line,materialTitle,onHandQuantity,globalReservedQuantity);

@override
String toString() {
  return 'ProductMaterialLine(line: $line, materialTitle: $materialTitle, onHandQuantity: $onHandQuantity, globalReservedQuantity: $globalReservedQuantity)';
}


}

/// @nodoc
abstract mixin class $ProductMaterialLineCopyWith<$Res>  {
  factory $ProductMaterialLineCopyWith(ProductMaterialLine value, $Res Function(ProductMaterialLine) _then) = _$ProductMaterialLineCopyWithImpl;
@useResult
$Res call({
 UsedMaterial line, String materialTitle, double onHandQuantity, double globalReservedQuantity
});




}
/// @nodoc
class _$ProductMaterialLineCopyWithImpl<$Res>
    implements $ProductMaterialLineCopyWith<$Res> {
  _$ProductMaterialLineCopyWithImpl(this._self, this._then);

  final ProductMaterialLine _self;
  final $Res Function(ProductMaterialLine) _then;

/// Create a copy of ProductMaterialLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? line = null,Object? materialTitle = null,Object? onHandQuantity = null,Object? globalReservedQuantity = null,}) {
  return _then(_self.copyWith(
line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as UsedMaterial,materialTitle: null == materialTitle ? _self.materialTitle : materialTitle // ignore: cast_nullable_to_non_nullable
as String,onHandQuantity: null == onHandQuantity ? _self.onHandQuantity : onHandQuantity // ignore: cast_nullable_to_non_nullable
as double,globalReservedQuantity: null == globalReservedQuantity ? _self.globalReservedQuantity : globalReservedQuantity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductMaterialLine].
extension ProductMaterialLinePatterns on ProductMaterialLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductMaterialLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductMaterialLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductMaterialLine value)  $default,){
final _that = this;
switch (_that) {
case _ProductMaterialLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductMaterialLine value)?  $default,){
final _that = this;
switch (_that) {
case _ProductMaterialLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UsedMaterial line,  String materialTitle,  double onHandQuantity,  double globalReservedQuantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductMaterialLine() when $default != null:
return $default(_that.line,_that.materialTitle,_that.onHandQuantity,_that.globalReservedQuantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UsedMaterial line,  String materialTitle,  double onHandQuantity,  double globalReservedQuantity)  $default,) {final _that = this;
switch (_that) {
case _ProductMaterialLine():
return $default(_that.line,_that.materialTitle,_that.onHandQuantity,_that.globalReservedQuantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UsedMaterial line,  String materialTitle,  double onHandQuantity,  double globalReservedQuantity)?  $default,) {final _that = this;
switch (_that) {
case _ProductMaterialLine() when $default != null:
return $default(_that.line,_that.materialTitle,_that.onHandQuantity,_that.globalReservedQuantity);case _:
  return null;

}
}

}

/// @nodoc


class _ProductMaterialLine extends ProductMaterialLine {
  const _ProductMaterialLine({required this.line, required this.materialTitle, required this.onHandQuantity, required this.globalReservedQuantity}): super._();
  

@override final  UsedMaterial line;
@override final  String materialTitle;
@override final  double onHandQuantity;
@override final  double globalReservedQuantity;

/// Create a copy of ProductMaterialLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductMaterialLineCopyWith<_ProductMaterialLine> get copyWith => __$ProductMaterialLineCopyWithImpl<_ProductMaterialLine>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductMaterialLine&&(identical(other.line, line) || other.line == line)&&(identical(other.materialTitle, materialTitle) || other.materialTitle == materialTitle)&&(identical(other.onHandQuantity, onHandQuantity) || other.onHandQuantity == onHandQuantity)&&(identical(other.globalReservedQuantity, globalReservedQuantity) || other.globalReservedQuantity == globalReservedQuantity));
}


@override
int get hashCode => Object.hash(runtimeType,line,materialTitle,onHandQuantity,globalReservedQuantity);

@override
String toString() {
  return 'ProductMaterialLine(line: $line, materialTitle: $materialTitle, onHandQuantity: $onHandQuantity, globalReservedQuantity: $globalReservedQuantity)';
}


}

/// @nodoc
abstract mixin class _$ProductMaterialLineCopyWith<$Res> implements $ProductMaterialLineCopyWith<$Res> {
  factory _$ProductMaterialLineCopyWith(_ProductMaterialLine value, $Res Function(_ProductMaterialLine) _then) = __$ProductMaterialLineCopyWithImpl;
@override @useResult
$Res call({
 UsedMaterial line, String materialTitle, double onHandQuantity, double globalReservedQuantity
});




}
/// @nodoc
class __$ProductMaterialLineCopyWithImpl<$Res>
    implements _$ProductMaterialLineCopyWith<$Res> {
  __$ProductMaterialLineCopyWithImpl(this._self, this._then);

  final _ProductMaterialLine _self;
  final $Res Function(_ProductMaterialLine) _then;

/// Create a copy of ProductMaterialLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? line = null,Object? materialTitle = null,Object? onHandQuantity = null,Object? globalReservedQuantity = null,}) {
  return _then(_ProductMaterialLine(
line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as UsedMaterial,materialTitle: null == materialTitle ? _self.materialTitle : materialTitle // ignore: cast_nullable_to_non_nullable
as String,onHandQuantity: null == onHandQuantity ? _self.onHandQuantity : onHandQuantity // ignore: cast_nullable_to_non_nullable
as double,globalReservedQuantity: null == globalReservedQuantity ? _self.globalReservedQuantity : globalReservedQuantity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc
mixin _$ProductDetailState {

 ProductDetailStatus get status; Product? get product; List<ProductMaterialLine> get materialLines; List<Material> get allMaterials; String? get errorMessage; bool get isFinishFailure;
/// Create a copy of ProductDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductDetailStateCopyWith<ProductDetailState> get copyWith => _$ProductDetailStateCopyWithImpl<ProductDetailState>(this as ProductDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.product, product) || other.product == product)&&const DeepCollectionEquality().equals(other.materialLines, materialLines)&&const DeepCollectionEquality().equals(other.allMaterials, allMaterials)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isFinishFailure, isFinishFailure) || other.isFinishFailure == isFinishFailure));
}


@override
int get hashCode => Object.hash(runtimeType,status,product,const DeepCollectionEquality().hash(materialLines),const DeepCollectionEquality().hash(allMaterials),errorMessage,isFinishFailure);

@override
String toString() {
  return 'ProductDetailState(status: $status, product: $product, materialLines: $materialLines, allMaterials: $allMaterials, errorMessage: $errorMessage, isFinishFailure: $isFinishFailure)';
}


}

/// @nodoc
abstract mixin class $ProductDetailStateCopyWith<$Res>  {
  factory $ProductDetailStateCopyWith(ProductDetailState value, $Res Function(ProductDetailState) _then) = _$ProductDetailStateCopyWithImpl;
@useResult
$Res call({
 ProductDetailStatus status, Product? product, List<ProductMaterialLine> materialLines, List<Material> allMaterials, String? errorMessage, bool isFinishFailure
});




}
/// @nodoc
class _$ProductDetailStateCopyWithImpl<$Res>
    implements $ProductDetailStateCopyWith<$Res> {
  _$ProductDetailStateCopyWithImpl(this._self, this._then);

  final ProductDetailState _self;
  final $Res Function(ProductDetailState) _then;

/// Create a copy of ProductDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? product = freezed,Object? materialLines = null,Object? allMaterials = null,Object? errorMessage = freezed,Object? isFinishFailure = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProductDetailStatus,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product?,materialLines: null == materialLines ? _self.materialLines : materialLines // ignore: cast_nullable_to_non_nullable
as List<ProductMaterialLine>,allMaterials: null == allMaterials ? _self.allMaterials : allMaterials // ignore: cast_nullable_to_non_nullable
as List<Material>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isFinishFailure: null == isFinishFailure ? _self.isFinishFailure : isFinishFailure // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductDetailState].
extension ProductDetailStatePatterns on ProductDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductDetailState value)  $default,){
final _that = this;
switch (_that) {
case _ProductDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _ProductDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductDetailStatus status,  Product? product,  List<ProductMaterialLine> materialLines,  List<Material> allMaterials,  String? errorMessage,  bool isFinishFailure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductDetailState() when $default != null:
return $default(_that.status,_that.product,_that.materialLines,_that.allMaterials,_that.errorMessage,_that.isFinishFailure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductDetailStatus status,  Product? product,  List<ProductMaterialLine> materialLines,  List<Material> allMaterials,  String? errorMessage,  bool isFinishFailure)  $default,) {final _that = this;
switch (_that) {
case _ProductDetailState():
return $default(_that.status,_that.product,_that.materialLines,_that.allMaterials,_that.errorMessage,_that.isFinishFailure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductDetailStatus status,  Product? product,  List<ProductMaterialLine> materialLines,  List<Material> allMaterials,  String? errorMessage,  bool isFinishFailure)?  $default,) {final _that = this;
switch (_that) {
case _ProductDetailState() when $default != null:
return $default(_that.status,_that.product,_that.materialLines,_that.allMaterials,_that.errorMessage,_that.isFinishFailure);case _:
  return null;

}
}

}

/// @nodoc


class _ProductDetailState extends ProductDetailState {
  const _ProductDetailState({this.status = ProductDetailStatus.initial, this.product, final  List<ProductMaterialLine> materialLines = const [], final  List<Material> allMaterials = const [], this.errorMessage, this.isFinishFailure = false}): _materialLines = materialLines,_allMaterials = allMaterials,super._();
  

@override@JsonKey() final  ProductDetailStatus status;
@override final  Product? product;
 final  List<ProductMaterialLine> _materialLines;
@override@JsonKey() List<ProductMaterialLine> get materialLines {
  if (_materialLines is EqualUnmodifiableListView) return _materialLines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_materialLines);
}

 final  List<Material> _allMaterials;
@override@JsonKey() List<Material> get allMaterials {
  if (_allMaterials is EqualUnmodifiableListView) return _allMaterials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allMaterials);
}

@override final  String? errorMessage;
@override@JsonKey() final  bool isFinishFailure;

/// Create a copy of ProductDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailStateCopyWith<_ProductDetailState> get copyWith => __$ProductDetailStateCopyWithImpl<_ProductDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.product, product) || other.product == product)&&const DeepCollectionEquality().equals(other._materialLines, _materialLines)&&const DeepCollectionEquality().equals(other._allMaterials, _allMaterials)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isFinishFailure, isFinishFailure) || other.isFinishFailure == isFinishFailure));
}


@override
int get hashCode => Object.hash(runtimeType,status,product,const DeepCollectionEquality().hash(_materialLines),const DeepCollectionEquality().hash(_allMaterials),errorMessage,isFinishFailure);

@override
String toString() {
  return 'ProductDetailState(status: $status, product: $product, materialLines: $materialLines, allMaterials: $allMaterials, errorMessage: $errorMessage, isFinishFailure: $isFinishFailure)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailStateCopyWith<$Res> implements $ProductDetailStateCopyWith<$Res> {
  factory _$ProductDetailStateCopyWith(_ProductDetailState value, $Res Function(_ProductDetailState) _then) = __$ProductDetailStateCopyWithImpl;
@override @useResult
$Res call({
 ProductDetailStatus status, Product? product, List<ProductMaterialLine> materialLines, List<Material> allMaterials, String? errorMessage, bool isFinishFailure
});




}
/// @nodoc
class __$ProductDetailStateCopyWithImpl<$Res>
    implements _$ProductDetailStateCopyWith<$Res> {
  __$ProductDetailStateCopyWithImpl(this._self, this._then);

  final _ProductDetailState _self;
  final $Res Function(_ProductDetailState) _then;

/// Create a copy of ProductDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? product = freezed,Object? materialLines = null,Object? allMaterials = null,Object? errorMessage = freezed,Object? isFinishFailure = null,}) {
  return _then(_ProductDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ProductDetailStatus,product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product?,materialLines: null == materialLines ? _self._materialLines : materialLines // ignore: cast_nullable_to_non_nullable
as List<ProductMaterialLine>,allMaterials: null == allMaterials ? _self._allMaterials : allMaterials // ignore: cast_nullable_to_non_nullable
as List<Material>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isFinishFailure: null == isFinishFailure ? _self.isFinishFailure : isFinishFailure // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
