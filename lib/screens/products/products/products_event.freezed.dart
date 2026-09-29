// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'products_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProductsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsEvent()';
}


}

/// @nodoc
class $ProductsEventCopyWith<$Res>  {
$ProductsEventCopyWith(ProductsEvent _, $Res Function(ProductsEvent) __);
}


/// Adds pattern-matching-related methods to [ProductsEvent].
extension ProductsEventPatterns on ProductsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProductsStarted value)?  started,TResult Function( ProductsRefreshRequested value)?  refreshRequested,TResult Function( ProductsSearchChanged value)?  searchChanged,TResult Function( ProductsPresetSaved value)?  presetSaved,TResult Function( ProductsPresetDeleteRequested value)?  presetDeleteRequested,TResult Function( ProductsOpenPresetDetailTapped value)?  openPresetDetailTapped,TResult Function( ProductsCreateAndOpenPresetTapped value)?  createAndOpenPresetTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProductsStarted() when started != null:
return started(_that);case ProductsRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case ProductsSearchChanged() when searchChanged != null:
return searchChanged(_that);case ProductsPresetSaved() when presetSaved != null:
return presetSaved(_that);case ProductsPresetDeleteRequested() when presetDeleteRequested != null:
return presetDeleteRequested(_that);case ProductsOpenPresetDetailTapped() when openPresetDetailTapped != null:
return openPresetDetailTapped(_that);case ProductsCreateAndOpenPresetTapped() when createAndOpenPresetTapped != null:
return createAndOpenPresetTapped(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProductsStarted value)  started,required TResult Function( ProductsRefreshRequested value)  refreshRequested,required TResult Function( ProductsSearchChanged value)  searchChanged,required TResult Function( ProductsPresetSaved value)  presetSaved,required TResult Function( ProductsPresetDeleteRequested value)  presetDeleteRequested,required TResult Function( ProductsOpenPresetDetailTapped value)  openPresetDetailTapped,required TResult Function( ProductsCreateAndOpenPresetTapped value)  createAndOpenPresetTapped,}){
final _that = this;
switch (_that) {
case ProductsStarted():
return started(_that);case ProductsRefreshRequested():
return refreshRequested(_that);case ProductsSearchChanged():
return searchChanged(_that);case ProductsPresetSaved():
return presetSaved(_that);case ProductsPresetDeleteRequested():
return presetDeleteRequested(_that);case ProductsOpenPresetDetailTapped():
return openPresetDetailTapped(_that);case ProductsCreateAndOpenPresetTapped():
return createAndOpenPresetTapped(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProductsStarted value)?  started,TResult? Function( ProductsRefreshRequested value)?  refreshRequested,TResult? Function( ProductsSearchChanged value)?  searchChanged,TResult? Function( ProductsPresetSaved value)?  presetSaved,TResult? Function( ProductsPresetDeleteRequested value)?  presetDeleteRequested,TResult? Function( ProductsOpenPresetDetailTapped value)?  openPresetDetailTapped,TResult? Function( ProductsCreateAndOpenPresetTapped value)?  createAndOpenPresetTapped,}){
final _that = this;
switch (_that) {
case ProductsStarted() when started != null:
return started(_that);case ProductsRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case ProductsSearchChanged() when searchChanged != null:
return searchChanged(_that);case ProductsPresetSaved() when presetSaved != null:
return presetSaved(_that);case ProductsPresetDeleteRequested() when presetDeleteRequested != null:
return presetDeleteRequested(_that);case ProductsOpenPresetDetailTapped() when openPresetDetailTapped != null:
return openPresetDetailTapped(_that);case ProductsCreateAndOpenPresetTapped() when createAndOpenPresetTapped != null:
return createAndOpenPresetTapped(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshRequested,TResult Function( String query)?  searchChanged,TResult Function( String? id,  String name,  String description)?  presetSaved,TResult Function( String id)?  presetDeleteRequested,TResult Function( String presetId)?  openPresetDetailTapped,TResult Function( String defaultName)?  createAndOpenPresetTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProductsStarted() when started != null:
return started();case ProductsRefreshRequested() when refreshRequested != null:
return refreshRequested();case ProductsSearchChanged() when searchChanged != null:
return searchChanged(_that.query);case ProductsPresetSaved() when presetSaved != null:
return presetSaved(_that.id,_that.name,_that.description);case ProductsPresetDeleteRequested() when presetDeleteRequested != null:
return presetDeleteRequested(_that.id);case ProductsOpenPresetDetailTapped() when openPresetDetailTapped != null:
return openPresetDetailTapped(_that.presetId);case ProductsCreateAndOpenPresetTapped() when createAndOpenPresetTapped != null:
return createAndOpenPresetTapped(_that.defaultName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshRequested,required TResult Function( String query)  searchChanged,required TResult Function( String? id,  String name,  String description)  presetSaved,required TResult Function( String id)  presetDeleteRequested,required TResult Function( String presetId)  openPresetDetailTapped,required TResult Function( String defaultName)  createAndOpenPresetTapped,}) {final _that = this;
switch (_that) {
case ProductsStarted():
return started();case ProductsRefreshRequested():
return refreshRequested();case ProductsSearchChanged():
return searchChanged(_that.query);case ProductsPresetSaved():
return presetSaved(_that.id,_that.name,_that.description);case ProductsPresetDeleteRequested():
return presetDeleteRequested(_that.id);case ProductsOpenPresetDetailTapped():
return openPresetDetailTapped(_that.presetId);case ProductsCreateAndOpenPresetTapped():
return createAndOpenPresetTapped(_that.defaultName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshRequested,TResult? Function( String query)?  searchChanged,TResult? Function( String? id,  String name,  String description)?  presetSaved,TResult? Function( String id)?  presetDeleteRequested,TResult? Function( String presetId)?  openPresetDetailTapped,TResult? Function( String defaultName)?  createAndOpenPresetTapped,}) {final _that = this;
switch (_that) {
case ProductsStarted() when started != null:
return started();case ProductsRefreshRequested() when refreshRequested != null:
return refreshRequested();case ProductsSearchChanged() when searchChanged != null:
return searchChanged(_that.query);case ProductsPresetSaved() when presetSaved != null:
return presetSaved(_that.id,_that.name,_that.description);case ProductsPresetDeleteRequested() when presetDeleteRequested != null:
return presetDeleteRequested(_that.id);case ProductsOpenPresetDetailTapped() when openPresetDetailTapped != null:
return openPresetDetailTapped(_that.presetId);case ProductsCreateAndOpenPresetTapped() when createAndOpenPresetTapped != null:
return createAndOpenPresetTapped(_that.defaultName);case _:
  return null;

}
}

}

/// @nodoc


class ProductsStarted implements ProductsEvent {
  const ProductsStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsEvent.started()';
}


}




/// @nodoc


class ProductsRefreshRequested implements ProductsEvent {
  const ProductsRefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProductsEvent.refreshRequested()';
}


}




/// @nodoc


class ProductsSearchChanged implements ProductsEvent {
  const ProductsSearchChanged(this.query);
  

 final  String query;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsSearchChangedCopyWith<ProductsSearchChanged> get copyWith => _$ProductsSearchChangedCopyWithImpl<ProductsSearchChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsSearchChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'ProductsEvent.searchChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $ProductsSearchChangedCopyWith<$Res> implements $ProductsEventCopyWith<$Res> {
  factory $ProductsSearchChangedCopyWith(ProductsSearchChanged value, $Res Function(ProductsSearchChanged) _then) = _$ProductsSearchChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$ProductsSearchChangedCopyWithImpl<$Res>
    implements $ProductsSearchChangedCopyWith<$Res> {
  _$ProductsSearchChangedCopyWithImpl(this._self, this._then);

  final ProductsSearchChanged _self;
  final $Res Function(ProductsSearchChanged) _then;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(ProductsSearchChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProductsPresetSaved implements ProductsEvent {
  const ProductsPresetSaved({this.id, required this.name, required this.description});
  

 final  String? id;
 final  String name;
 final  String description;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsPresetSavedCopyWith<ProductsPresetSaved> get copyWith => _$ProductsPresetSavedCopyWithImpl<ProductsPresetSaved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsPresetSaved&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description);

@override
String toString() {
  return 'ProductsEvent.presetSaved(id: $id, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $ProductsPresetSavedCopyWith<$Res> implements $ProductsEventCopyWith<$Res> {
  factory $ProductsPresetSavedCopyWith(ProductsPresetSaved value, $Res Function(ProductsPresetSaved) _then) = _$ProductsPresetSavedCopyWithImpl;
@useResult
$Res call({
 String? id, String name, String description
});




}
/// @nodoc
class _$ProductsPresetSavedCopyWithImpl<$Res>
    implements $ProductsPresetSavedCopyWith<$Res> {
  _$ProductsPresetSavedCopyWithImpl(this._self, this._then);

  final ProductsPresetSaved _self;
  final $Res Function(ProductsPresetSaved) _then;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? description = null,}) {
  return _then(ProductsPresetSaved(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProductsPresetDeleteRequested implements ProductsEvent {
  const ProductsPresetDeleteRequested(this.id);
  

 final  String id;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsPresetDeleteRequestedCopyWith<ProductsPresetDeleteRequested> get copyWith => _$ProductsPresetDeleteRequestedCopyWithImpl<ProductsPresetDeleteRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsPresetDeleteRequested&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'ProductsEvent.presetDeleteRequested(id: $id)';
}


}

/// @nodoc
abstract mixin class $ProductsPresetDeleteRequestedCopyWith<$Res> implements $ProductsEventCopyWith<$Res> {
  factory $ProductsPresetDeleteRequestedCopyWith(ProductsPresetDeleteRequested value, $Res Function(ProductsPresetDeleteRequested) _then) = _$ProductsPresetDeleteRequestedCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$ProductsPresetDeleteRequestedCopyWithImpl<$Res>
    implements $ProductsPresetDeleteRequestedCopyWith<$Res> {
  _$ProductsPresetDeleteRequestedCopyWithImpl(this._self, this._then);

  final ProductsPresetDeleteRequested _self;
  final $Res Function(ProductsPresetDeleteRequested) _then;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(ProductsPresetDeleteRequested(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProductsOpenPresetDetailTapped implements ProductsEvent {
  const ProductsOpenPresetDetailTapped(this.presetId);
  

 final  String presetId;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsOpenPresetDetailTappedCopyWith<ProductsOpenPresetDetailTapped> get copyWith => _$ProductsOpenPresetDetailTappedCopyWithImpl<ProductsOpenPresetDetailTapped>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsOpenPresetDetailTapped&&(identical(other.presetId, presetId) || other.presetId == presetId));
}


@override
int get hashCode => Object.hash(runtimeType,presetId);

@override
String toString() {
  return 'ProductsEvent.openPresetDetailTapped(presetId: $presetId)';
}


}

/// @nodoc
abstract mixin class $ProductsOpenPresetDetailTappedCopyWith<$Res> implements $ProductsEventCopyWith<$Res> {
  factory $ProductsOpenPresetDetailTappedCopyWith(ProductsOpenPresetDetailTapped value, $Res Function(ProductsOpenPresetDetailTapped) _then) = _$ProductsOpenPresetDetailTappedCopyWithImpl;
@useResult
$Res call({
 String presetId
});




}
/// @nodoc
class _$ProductsOpenPresetDetailTappedCopyWithImpl<$Res>
    implements $ProductsOpenPresetDetailTappedCopyWith<$Res> {
  _$ProductsOpenPresetDetailTappedCopyWithImpl(this._self, this._then);

  final ProductsOpenPresetDetailTapped _self;
  final $Res Function(ProductsOpenPresetDetailTapped) _then;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? presetId = null,}) {
  return _then(ProductsOpenPresetDetailTapped(
null == presetId ? _self.presetId : presetId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProductsCreateAndOpenPresetTapped implements ProductsEvent {
  const ProductsCreateAndOpenPresetTapped({required this.defaultName});
  

 final  String defaultName;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductsCreateAndOpenPresetTappedCopyWith<ProductsCreateAndOpenPresetTapped> get copyWith => _$ProductsCreateAndOpenPresetTappedCopyWithImpl<ProductsCreateAndOpenPresetTapped>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductsCreateAndOpenPresetTapped&&(identical(other.defaultName, defaultName) || other.defaultName == defaultName));
}


@override
int get hashCode => Object.hash(runtimeType,defaultName);

@override
String toString() {
  return 'ProductsEvent.createAndOpenPresetTapped(defaultName: $defaultName)';
}


}

/// @nodoc
abstract mixin class $ProductsCreateAndOpenPresetTappedCopyWith<$Res> implements $ProductsEventCopyWith<$Res> {
  factory $ProductsCreateAndOpenPresetTappedCopyWith(ProductsCreateAndOpenPresetTapped value, $Res Function(ProductsCreateAndOpenPresetTapped) _then) = _$ProductsCreateAndOpenPresetTappedCopyWithImpl;
@useResult
$Res call({
 String defaultName
});




}
/// @nodoc
class _$ProductsCreateAndOpenPresetTappedCopyWithImpl<$Res>
    implements $ProductsCreateAndOpenPresetTappedCopyWith<$Res> {
  _$ProductsCreateAndOpenPresetTappedCopyWithImpl(this._self, this._then);

  final ProductsCreateAndOpenPresetTapped _self;
  final $Res Function(ProductsCreateAndOpenPresetTapped) _then;

/// Create a copy of ProductsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? defaultName = null,}) {
  return _then(ProductsCreateAndOpenPresetTapped(
defaultName: null == defaultName ? _self.defaultName : defaultName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
