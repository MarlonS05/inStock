// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workshop_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkshopEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkshopEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkshopEvent()';
}


}

/// @nodoc
class $WorkshopEventCopyWith<$Res>  {
$WorkshopEventCopyWith(WorkshopEvent _, $Res Function(WorkshopEvent) __);
}


/// Adds pattern-matching-related methods to [WorkshopEvent].
extension WorkshopEventPatterns on WorkshopEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WorkshopStarted value)?  started,TResult Function( WorkshopRefreshRequested value)?  refreshRequested,TResult Function( WorkshopOpenArchiveTapped value)?  openArchiveTapped,TResult Function( WorkshopOpenProductDetailTapped value)?  openProductDetailTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WorkshopStarted() when started != null:
return started(_that);case WorkshopRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case WorkshopOpenArchiveTapped() when openArchiveTapped != null:
return openArchiveTapped(_that);case WorkshopOpenProductDetailTapped() when openProductDetailTapped != null:
return openProductDetailTapped(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WorkshopStarted value)  started,required TResult Function( WorkshopRefreshRequested value)  refreshRequested,required TResult Function( WorkshopOpenArchiveTapped value)  openArchiveTapped,required TResult Function( WorkshopOpenProductDetailTapped value)  openProductDetailTapped,}){
final _that = this;
switch (_that) {
case WorkshopStarted():
return started(_that);case WorkshopRefreshRequested():
return refreshRequested(_that);case WorkshopOpenArchiveTapped():
return openArchiveTapped(_that);case WorkshopOpenProductDetailTapped():
return openProductDetailTapped(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WorkshopStarted value)?  started,TResult? Function( WorkshopRefreshRequested value)?  refreshRequested,TResult? Function( WorkshopOpenArchiveTapped value)?  openArchiveTapped,TResult? Function( WorkshopOpenProductDetailTapped value)?  openProductDetailTapped,}){
final _that = this;
switch (_that) {
case WorkshopStarted() when started != null:
return started(_that);case WorkshopRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case WorkshopOpenArchiveTapped() when openArchiveTapped != null:
return openArchiveTapped(_that);case WorkshopOpenProductDetailTapped() when openProductDetailTapped != null:
return openProductDetailTapped(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshRequested,TResult Function()?  openArchiveTapped,TResult Function( String productId)?  openProductDetailTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WorkshopStarted() when started != null:
return started();case WorkshopRefreshRequested() when refreshRequested != null:
return refreshRequested();case WorkshopOpenArchiveTapped() when openArchiveTapped != null:
return openArchiveTapped();case WorkshopOpenProductDetailTapped() when openProductDetailTapped != null:
return openProductDetailTapped(_that.productId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshRequested,required TResult Function()  openArchiveTapped,required TResult Function( String productId)  openProductDetailTapped,}) {final _that = this;
switch (_that) {
case WorkshopStarted():
return started();case WorkshopRefreshRequested():
return refreshRequested();case WorkshopOpenArchiveTapped():
return openArchiveTapped();case WorkshopOpenProductDetailTapped():
return openProductDetailTapped(_that.productId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshRequested,TResult? Function()?  openArchiveTapped,TResult? Function( String productId)?  openProductDetailTapped,}) {final _that = this;
switch (_that) {
case WorkshopStarted() when started != null:
return started();case WorkshopRefreshRequested() when refreshRequested != null:
return refreshRequested();case WorkshopOpenArchiveTapped() when openArchiveTapped != null:
return openArchiveTapped();case WorkshopOpenProductDetailTapped() when openProductDetailTapped != null:
return openProductDetailTapped(_that.productId);case _:
  return null;

}
}

}

/// @nodoc


class WorkshopStarted implements WorkshopEvent {
  const WorkshopStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkshopStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkshopEvent.started()';
}


}




/// @nodoc


class WorkshopRefreshRequested implements WorkshopEvent {
  const WorkshopRefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkshopRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkshopEvent.refreshRequested()';
}


}




/// @nodoc


class WorkshopOpenArchiveTapped implements WorkshopEvent {
  const WorkshopOpenArchiveTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkshopOpenArchiveTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkshopEvent.openArchiveTapped()';
}


}




/// @nodoc


class WorkshopOpenProductDetailTapped implements WorkshopEvent {
  const WorkshopOpenProductDetailTapped(this.productId);
  

 final  String productId;

/// Create a copy of WorkshopEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkshopOpenProductDetailTappedCopyWith<WorkshopOpenProductDetailTapped> get copyWith => _$WorkshopOpenProductDetailTappedCopyWithImpl<WorkshopOpenProductDetailTapped>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkshopOpenProductDetailTapped&&(identical(other.productId, productId) || other.productId == productId));
}


@override
int get hashCode => Object.hash(runtimeType,productId);

@override
String toString() {
  return 'WorkshopEvent.openProductDetailTapped(productId: $productId)';
}


}

/// @nodoc
abstract mixin class $WorkshopOpenProductDetailTappedCopyWith<$Res> implements $WorkshopEventCopyWith<$Res> {
  factory $WorkshopOpenProductDetailTappedCopyWith(WorkshopOpenProductDetailTapped value, $Res Function(WorkshopOpenProductDetailTapped) _then) = _$WorkshopOpenProductDetailTappedCopyWithImpl;
@useResult
$Res call({
 String productId
});




}
/// @nodoc
class _$WorkshopOpenProductDetailTappedCopyWithImpl<$Res>
    implements $WorkshopOpenProductDetailTappedCopyWith<$Res> {
  _$WorkshopOpenProductDetailTappedCopyWithImpl(this._self, this._then);

  final WorkshopOpenProductDetailTapped _self;
  final $Res Function(WorkshopOpenProductDetailTapped) _then;

/// Create a copy of WorkshopEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? productId = null,}) {
  return _then(WorkshopOpenProductDetailTapped(
null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
