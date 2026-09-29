// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workshop_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkshopProjectItem {

 Product get product; bool get hasMaterialShortage;
/// Create a copy of WorkshopProjectItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkshopProjectItemCopyWith<WorkshopProjectItem> get copyWith => _$WorkshopProjectItemCopyWithImpl<WorkshopProjectItem>(this as WorkshopProjectItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkshopProjectItem&&(identical(other.product, product) || other.product == product)&&(identical(other.hasMaterialShortage, hasMaterialShortage) || other.hasMaterialShortage == hasMaterialShortage));
}


@override
int get hashCode => Object.hash(runtimeType,product,hasMaterialShortage);

@override
String toString() {
  return 'WorkshopProjectItem(product: $product, hasMaterialShortage: $hasMaterialShortage)';
}


}

/// @nodoc
abstract mixin class $WorkshopProjectItemCopyWith<$Res>  {
  factory $WorkshopProjectItemCopyWith(WorkshopProjectItem value, $Res Function(WorkshopProjectItem) _then) = _$WorkshopProjectItemCopyWithImpl;
@useResult
$Res call({
 Product product, bool hasMaterialShortage
});




}
/// @nodoc
class _$WorkshopProjectItemCopyWithImpl<$Res>
    implements $WorkshopProjectItemCopyWith<$Res> {
  _$WorkshopProjectItemCopyWithImpl(this._self, this._then);

  final WorkshopProjectItem _self;
  final $Res Function(WorkshopProjectItem) _then;

/// Create a copy of WorkshopProjectItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = null,Object? hasMaterialShortage = null,}) {
  return _then(_self.copyWith(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product,hasMaterialShortage: null == hasMaterialShortage ? _self.hasMaterialShortage : hasMaterialShortage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkshopProjectItem].
extension WorkshopProjectItemPatterns on WorkshopProjectItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkshopProjectItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkshopProjectItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkshopProjectItem value)  $default,){
final _that = this;
switch (_that) {
case _WorkshopProjectItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkshopProjectItem value)?  $default,){
final _that = this;
switch (_that) {
case _WorkshopProjectItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Product product,  bool hasMaterialShortage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkshopProjectItem() when $default != null:
return $default(_that.product,_that.hasMaterialShortage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Product product,  bool hasMaterialShortage)  $default,) {final _that = this;
switch (_that) {
case _WorkshopProjectItem():
return $default(_that.product,_that.hasMaterialShortage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Product product,  bool hasMaterialShortage)?  $default,) {final _that = this;
switch (_that) {
case _WorkshopProjectItem() when $default != null:
return $default(_that.product,_that.hasMaterialShortage);case _:
  return null;

}
}

}

/// @nodoc


class _WorkshopProjectItem extends WorkshopProjectItem {
  const _WorkshopProjectItem({required this.product, required this.hasMaterialShortage}): super._();
  

@override final  Product product;
@override final  bool hasMaterialShortage;

/// Create a copy of WorkshopProjectItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkshopProjectItemCopyWith<_WorkshopProjectItem> get copyWith => __$WorkshopProjectItemCopyWithImpl<_WorkshopProjectItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkshopProjectItem&&(identical(other.product, product) || other.product == product)&&(identical(other.hasMaterialShortage, hasMaterialShortage) || other.hasMaterialShortage == hasMaterialShortage));
}


@override
int get hashCode => Object.hash(runtimeType,product,hasMaterialShortage);

@override
String toString() {
  return 'WorkshopProjectItem(product: $product, hasMaterialShortage: $hasMaterialShortage)';
}


}

/// @nodoc
abstract mixin class _$WorkshopProjectItemCopyWith<$Res> implements $WorkshopProjectItemCopyWith<$Res> {
  factory _$WorkshopProjectItemCopyWith(_WorkshopProjectItem value, $Res Function(_WorkshopProjectItem) _then) = __$WorkshopProjectItemCopyWithImpl;
@override @useResult
$Res call({
 Product product, bool hasMaterialShortage
});




}
/// @nodoc
class __$WorkshopProjectItemCopyWithImpl<$Res>
    implements _$WorkshopProjectItemCopyWith<$Res> {
  __$WorkshopProjectItemCopyWithImpl(this._self, this._then);

  final _WorkshopProjectItem _self;
  final $Res Function(_WorkshopProjectItem) _then;

/// Create a copy of WorkshopProjectItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = null,Object? hasMaterialShortage = null,}) {
  return _then(_WorkshopProjectItem(
product: null == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as Product,hasMaterialShortage: null == hasMaterialShortage ? _self.hasMaterialShortage : hasMaterialShortage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$WorkshopState {

 WorkshopStatus get status; List<WorkshopProjectItem> get projects; String? get errorMessage;
/// Create a copy of WorkshopState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkshopStateCopyWith<WorkshopState> get copyWith => _$WorkshopStateCopyWithImpl<WorkshopState>(this as WorkshopState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkshopState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.projects, projects)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(projects),errorMessage);

@override
String toString() {
  return 'WorkshopState(status: $status, projects: $projects, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $WorkshopStateCopyWith<$Res>  {
  factory $WorkshopStateCopyWith(WorkshopState value, $Res Function(WorkshopState) _then) = _$WorkshopStateCopyWithImpl;
@useResult
$Res call({
 WorkshopStatus status, List<WorkshopProjectItem> projects, String? errorMessage
});




}
/// @nodoc
class _$WorkshopStateCopyWithImpl<$Res>
    implements $WorkshopStateCopyWith<$Res> {
  _$WorkshopStateCopyWithImpl(this._self, this._then);

  final WorkshopState _self;
  final $Res Function(WorkshopState) _then;

/// Create a copy of WorkshopState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? projects = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WorkshopStatus,projects: null == projects ? _self.projects : projects // ignore: cast_nullable_to_non_nullable
as List<WorkshopProjectItem>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkshopState].
extension WorkshopStatePatterns on WorkshopState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkshopState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkshopState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkshopState value)  $default,){
final _that = this;
switch (_that) {
case _WorkshopState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkshopState value)?  $default,){
final _that = this;
switch (_that) {
case _WorkshopState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WorkshopStatus status,  List<WorkshopProjectItem> projects,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkshopState() when $default != null:
return $default(_that.status,_that.projects,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WorkshopStatus status,  List<WorkshopProjectItem> projects,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _WorkshopState():
return $default(_that.status,_that.projects,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WorkshopStatus status,  List<WorkshopProjectItem> projects,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _WorkshopState() when $default != null:
return $default(_that.status,_that.projects,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _WorkshopState implements WorkshopState {
  const _WorkshopState({this.status = WorkshopStatus.initial, final  List<WorkshopProjectItem> projects = const [], this.errorMessage}): _projects = projects;
  

@override@JsonKey() final  WorkshopStatus status;
 final  List<WorkshopProjectItem> _projects;
@override@JsonKey() List<WorkshopProjectItem> get projects {
  if (_projects is EqualUnmodifiableListView) return _projects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_projects);
}

@override final  String? errorMessage;

/// Create a copy of WorkshopState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkshopStateCopyWith<_WorkshopState> get copyWith => __$WorkshopStateCopyWithImpl<_WorkshopState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkshopState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._projects, _projects)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_projects),errorMessage);

@override
String toString() {
  return 'WorkshopState(status: $status, projects: $projects, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$WorkshopStateCopyWith<$Res> implements $WorkshopStateCopyWith<$Res> {
  factory _$WorkshopStateCopyWith(_WorkshopState value, $Res Function(_WorkshopState) _then) = __$WorkshopStateCopyWithImpl;
@override @useResult
$Res call({
 WorkshopStatus status, List<WorkshopProjectItem> projects, String? errorMessage
});




}
/// @nodoc
class __$WorkshopStateCopyWithImpl<$Res>
    implements _$WorkshopStateCopyWith<$Res> {
  __$WorkshopStateCopyWithImpl(this._self, this._then);

  final _WorkshopState _self;
  final $Res Function(_WorkshopState) _then;

/// Create a copy of WorkshopState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? projects = null,Object? errorMessage = freezed,}) {
  return _then(_WorkshopState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as WorkshopStatus,projects: null == projects ? _self._projects : projects // ignore: cast_nullable_to_non_nullable
as List<WorkshopProjectItem>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
