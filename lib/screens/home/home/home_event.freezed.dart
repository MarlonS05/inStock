// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeStarted value)?  started,TResult Function( HomeRefreshRequested value)?  refreshRequested,TResult Function( HomeMaterialPurchased value)?  materialPurchased,TResult Function( HomeDatabaseRetryRequested value)?  databaseRetryRequested,TResult Function( HomeDatabaseWipeRequested value)?  databaseWipeRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeStarted() when started != null:
return started(_that);case HomeRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case HomeMaterialPurchased() when materialPurchased != null:
return materialPurchased(_that);case HomeDatabaseRetryRequested() when databaseRetryRequested != null:
return databaseRetryRequested(_that);case HomeDatabaseWipeRequested() when databaseWipeRequested != null:
return databaseWipeRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeStarted value)  started,required TResult Function( HomeRefreshRequested value)  refreshRequested,required TResult Function( HomeMaterialPurchased value)  materialPurchased,required TResult Function( HomeDatabaseRetryRequested value)  databaseRetryRequested,required TResult Function( HomeDatabaseWipeRequested value)  databaseWipeRequested,}){
final _that = this;
switch (_that) {
case HomeStarted():
return started(_that);case HomeRefreshRequested():
return refreshRequested(_that);case HomeMaterialPurchased():
return materialPurchased(_that);case HomeDatabaseRetryRequested():
return databaseRetryRequested(_that);case HomeDatabaseWipeRequested():
return databaseWipeRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeStarted value)?  started,TResult? Function( HomeRefreshRequested value)?  refreshRequested,TResult? Function( HomeMaterialPurchased value)?  materialPurchased,TResult? Function( HomeDatabaseRetryRequested value)?  databaseRetryRequested,TResult? Function( HomeDatabaseWipeRequested value)?  databaseWipeRequested,}){
final _that = this;
switch (_that) {
case HomeStarted() when started != null:
return started(_that);case HomeRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case HomeMaterialPurchased() when materialPurchased != null:
return materialPurchased(_that);case HomeDatabaseRetryRequested() when databaseRetryRequested != null:
return databaseRetryRequested(_that);case HomeDatabaseWipeRequested() when databaseWipeRequested != null:
return databaseWipeRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshRequested,TResult Function( String materialId,  double quantity)?  materialPurchased,TResult Function()?  databaseRetryRequested,TResult Function()?  databaseWipeRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeStarted() when started != null:
return started();case HomeRefreshRequested() when refreshRequested != null:
return refreshRequested();case HomeMaterialPurchased() when materialPurchased != null:
return materialPurchased(_that.materialId,_that.quantity);case HomeDatabaseRetryRequested() when databaseRetryRequested != null:
return databaseRetryRequested();case HomeDatabaseWipeRequested() when databaseWipeRequested != null:
return databaseWipeRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshRequested,required TResult Function( String materialId,  double quantity)  materialPurchased,required TResult Function()  databaseRetryRequested,required TResult Function()  databaseWipeRequested,}) {final _that = this;
switch (_that) {
case HomeStarted():
return started();case HomeRefreshRequested():
return refreshRequested();case HomeMaterialPurchased():
return materialPurchased(_that.materialId,_that.quantity);case HomeDatabaseRetryRequested():
return databaseRetryRequested();case HomeDatabaseWipeRequested():
return databaseWipeRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshRequested,TResult? Function( String materialId,  double quantity)?  materialPurchased,TResult? Function()?  databaseRetryRequested,TResult? Function()?  databaseWipeRequested,}) {final _that = this;
switch (_that) {
case HomeStarted() when started != null:
return started();case HomeRefreshRequested() when refreshRequested != null:
return refreshRequested();case HomeMaterialPurchased() when materialPurchased != null:
return materialPurchased(_that.materialId,_that.quantity);case HomeDatabaseRetryRequested() when databaseRetryRequested != null:
return databaseRetryRequested();case HomeDatabaseWipeRequested() when databaseWipeRequested != null:
return databaseWipeRequested();case _:
  return null;

}
}

}

/// @nodoc


class HomeStarted implements HomeEvent {
  const HomeStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.started()';
}


}




/// @nodoc


class HomeRefreshRequested implements HomeEvent {
  const HomeRefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.refreshRequested()';
}


}




/// @nodoc


class HomeMaterialPurchased implements HomeEvent {
  const HomeMaterialPurchased({required this.materialId, required this.quantity});
  

 final  String materialId;
 final  double quantity;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeMaterialPurchasedCopyWith<HomeMaterialPurchased> get copyWith => _$HomeMaterialPurchasedCopyWithImpl<HomeMaterialPurchased>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeMaterialPurchased&&(identical(other.materialId, materialId) || other.materialId == materialId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}


@override
int get hashCode => Object.hash(runtimeType,materialId,quantity);

@override
String toString() {
  return 'HomeEvent.materialPurchased(materialId: $materialId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $HomeMaterialPurchasedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeMaterialPurchasedCopyWith(HomeMaterialPurchased value, $Res Function(HomeMaterialPurchased) _then) = _$HomeMaterialPurchasedCopyWithImpl;
@useResult
$Res call({
 String materialId, double quantity
});




}
/// @nodoc
class _$HomeMaterialPurchasedCopyWithImpl<$Res>
    implements $HomeMaterialPurchasedCopyWith<$Res> {
  _$HomeMaterialPurchasedCopyWithImpl(this._self, this._then);

  final HomeMaterialPurchased _self;
  final $Res Function(HomeMaterialPurchased) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? materialId = null,Object? quantity = null,}) {
  return _then(HomeMaterialPurchased(
materialId: null == materialId ? _self.materialId : materialId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

/// @nodoc


class HomeDatabaseRetryRequested implements HomeEvent {
  const HomeDatabaseRetryRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDatabaseRetryRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.databaseRetryRequested()';
}


}




/// @nodoc


class HomeDatabaseWipeRequested implements HomeEvent {
  const HomeDatabaseWipeRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeDatabaseWipeRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.databaseWipeRequested()';
}


}




// dart format on
