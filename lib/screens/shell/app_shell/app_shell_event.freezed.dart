// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_shell_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppShellEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppShellEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppShellEvent()';
}


}

/// @nodoc
class $AppShellEventCopyWith<$Res>  {
$AppShellEventCopyWith(AppShellEvent _, $Res Function(AppShellEvent) __);
}


/// Adds pattern-matching-related methods to [AppShellEvent].
extension AppShellEventPatterns on AppShellEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AppShellStarted value)?  started,TResult Function( AppShellTabSelected value)?  tabSelected,TResult Function( AppShellPageChanged value)?  pageChanged,TResult Function( AppShellRouteChanged value)?  routeChanged,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AppShellStarted() when started != null:
return started(_that);case AppShellTabSelected() when tabSelected != null:
return tabSelected(_that);case AppShellPageChanged() when pageChanged != null:
return pageChanged(_that);case AppShellRouteChanged() when routeChanged != null:
return routeChanged(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AppShellStarted value)  started,required TResult Function( AppShellTabSelected value)  tabSelected,required TResult Function( AppShellPageChanged value)  pageChanged,required TResult Function( AppShellRouteChanged value)  routeChanged,}){
final _that = this;
switch (_that) {
case AppShellStarted():
return started(_that);case AppShellTabSelected():
return tabSelected(_that);case AppShellPageChanged():
return pageChanged(_that);case AppShellRouteChanged():
return routeChanged(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AppShellStarted value)?  started,TResult? Function( AppShellTabSelected value)?  tabSelected,TResult? Function( AppShellPageChanged value)?  pageChanged,TResult? Function( AppShellRouteChanged value)?  routeChanged,}){
final _that = this;
switch (_that) {
case AppShellStarted() when started != null:
return started(_that);case AppShellTabSelected() when tabSelected != null:
return tabSelected(_that);case AppShellPageChanged() when pageChanged != null:
return pageChanged(_that);case AppShellRouteChanged() when routeChanged != null:
return routeChanged(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int initialIndex)?  started,TResult Function( int index)?  tabSelected,TResult Function( int index)?  pageChanged,TResult Function( int index)?  routeChanged,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AppShellStarted() when started != null:
return started(_that.initialIndex);case AppShellTabSelected() when tabSelected != null:
return tabSelected(_that.index);case AppShellPageChanged() when pageChanged != null:
return pageChanged(_that.index);case AppShellRouteChanged() when routeChanged != null:
return routeChanged(_that.index);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int initialIndex)  started,required TResult Function( int index)  tabSelected,required TResult Function( int index)  pageChanged,required TResult Function( int index)  routeChanged,}) {final _that = this;
switch (_that) {
case AppShellStarted():
return started(_that.initialIndex);case AppShellTabSelected():
return tabSelected(_that.index);case AppShellPageChanged():
return pageChanged(_that.index);case AppShellRouteChanged():
return routeChanged(_that.index);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int initialIndex)?  started,TResult? Function( int index)?  tabSelected,TResult? Function( int index)?  pageChanged,TResult? Function( int index)?  routeChanged,}) {final _that = this;
switch (_that) {
case AppShellStarted() when started != null:
return started(_that.initialIndex);case AppShellTabSelected() when tabSelected != null:
return tabSelected(_that.index);case AppShellPageChanged() when pageChanged != null:
return pageChanged(_that.index);case AppShellRouteChanged() when routeChanged != null:
return routeChanged(_that.index);case _:
  return null;

}
}

}

/// @nodoc


class AppShellStarted implements AppShellEvent {
  const AppShellStarted(this.initialIndex);
  

 final  int initialIndex;

/// Create a copy of AppShellEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppShellStartedCopyWith<AppShellStarted> get copyWith => _$AppShellStartedCopyWithImpl<AppShellStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppShellStarted&&(identical(other.initialIndex, initialIndex) || other.initialIndex == initialIndex));
}


@override
int get hashCode => Object.hash(runtimeType,initialIndex);

@override
String toString() {
  return 'AppShellEvent.started(initialIndex: $initialIndex)';
}


}

/// @nodoc
abstract mixin class $AppShellStartedCopyWith<$Res> implements $AppShellEventCopyWith<$Res> {
  factory $AppShellStartedCopyWith(AppShellStarted value, $Res Function(AppShellStarted) _then) = _$AppShellStartedCopyWithImpl;
@useResult
$Res call({
 int initialIndex
});




}
/// @nodoc
class _$AppShellStartedCopyWithImpl<$Res>
    implements $AppShellStartedCopyWith<$Res> {
  _$AppShellStartedCopyWithImpl(this._self, this._then);

  final AppShellStarted _self;
  final $Res Function(AppShellStarted) _then;

/// Create a copy of AppShellEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? initialIndex = null,}) {
  return _then(AppShellStarted(
null == initialIndex ? _self.initialIndex : initialIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class AppShellTabSelected implements AppShellEvent {
  const AppShellTabSelected(this.index);
  

 final  int index;

/// Create a copy of AppShellEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppShellTabSelectedCopyWith<AppShellTabSelected> get copyWith => _$AppShellTabSelectedCopyWithImpl<AppShellTabSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppShellTabSelected&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'AppShellEvent.tabSelected(index: $index)';
}


}

/// @nodoc
abstract mixin class $AppShellTabSelectedCopyWith<$Res> implements $AppShellEventCopyWith<$Res> {
  factory $AppShellTabSelectedCopyWith(AppShellTabSelected value, $Res Function(AppShellTabSelected) _then) = _$AppShellTabSelectedCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class _$AppShellTabSelectedCopyWithImpl<$Res>
    implements $AppShellTabSelectedCopyWith<$Res> {
  _$AppShellTabSelectedCopyWithImpl(this._self, this._then);

  final AppShellTabSelected _self;
  final $Res Function(AppShellTabSelected) _then;

/// Create a copy of AppShellEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(AppShellTabSelected(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class AppShellPageChanged implements AppShellEvent {
  const AppShellPageChanged(this.index);
  

 final  int index;

/// Create a copy of AppShellEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppShellPageChangedCopyWith<AppShellPageChanged> get copyWith => _$AppShellPageChangedCopyWithImpl<AppShellPageChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppShellPageChanged&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'AppShellEvent.pageChanged(index: $index)';
}


}

/// @nodoc
abstract mixin class $AppShellPageChangedCopyWith<$Res> implements $AppShellEventCopyWith<$Res> {
  factory $AppShellPageChangedCopyWith(AppShellPageChanged value, $Res Function(AppShellPageChanged) _then) = _$AppShellPageChangedCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class _$AppShellPageChangedCopyWithImpl<$Res>
    implements $AppShellPageChangedCopyWith<$Res> {
  _$AppShellPageChangedCopyWithImpl(this._self, this._then);

  final AppShellPageChanged _self;
  final $Res Function(AppShellPageChanged) _then;

/// Create a copy of AppShellEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(AppShellPageChanged(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class AppShellRouteChanged implements AppShellEvent {
  const AppShellRouteChanged(this.index);
  

 final  int index;

/// Create a copy of AppShellEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppShellRouteChangedCopyWith<AppShellRouteChanged> get copyWith => _$AppShellRouteChangedCopyWithImpl<AppShellRouteChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppShellRouteChanged&&(identical(other.index, index) || other.index == index));
}


@override
int get hashCode => Object.hash(runtimeType,index);

@override
String toString() {
  return 'AppShellEvent.routeChanged(index: $index)';
}


}

/// @nodoc
abstract mixin class $AppShellRouteChangedCopyWith<$Res> implements $AppShellEventCopyWith<$Res> {
  factory $AppShellRouteChangedCopyWith(AppShellRouteChanged value, $Res Function(AppShellRouteChanged) _then) = _$AppShellRouteChangedCopyWithImpl;
@useResult
$Res call({
 int index
});




}
/// @nodoc
class _$AppShellRouteChangedCopyWithImpl<$Res>
    implements $AppShellRouteChangedCopyWith<$Res> {
  _$AppShellRouteChangedCopyWithImpl(this._self, this._then);

  final AppShellRouteChanged _self;
  final $Res Function(AppShellRouteChanged) _then;

/// Create a copy of AppShellEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? index = null,}) {
  return _then(AppShellRouteChanged(
null == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
