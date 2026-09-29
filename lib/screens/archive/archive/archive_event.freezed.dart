// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archive_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ArchiveEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArchiveEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ArchiveEvent()';
}


}

/// @nodoc
class $ArchiveEventCopyWith<$Res>  {
$ArchiveEventCopyWith(ArchiveEvent _, $Res Function(ArchiveEvent) __);
}


/// Adds pattern-matching-related methods to [ArchiveEvent].
extension ArchiveEventPatterns on ArchiveEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ArchiveStarted value)?  started,TResult Function( ArchiveRefreshRequested value)?  refreshRequested,TResult Function( ArchiveStartDateChanged value)?  startDateChanged,TResult Function( ArchiveEndDateChanged value)?  endDateChanged,TResult Function( ArchiveBackTapped value)?  backTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ArchiveStarted() when started != null:
return started(_that);case ArchiveRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case ArchiveStartDateChanged() when startDateChanged != null:
return startDateChanged(_that);case ArchiveEndDateChanged() when endDateChanged != null:
return endDateChanged(_that);case ArchiveBackTapped() when backTapped != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ArchiveStarted value)  started,required TResult Function( ArchiveRefreshRequested value)  refreshRequested,required TResult Function( ArchiveStartDateChanged value)  startDateChanged,required TResult Function( ArchiveEndDateChanged value)  endDateChanged,required TResult Function( ArchiveBackTapped value)  backTapped,}){
final _that = this;
switch (_that) {
case ArchiveStarted():
return started(_that);case ArchiveRefreshRequested():
return refreshRequested(_that);case ArchiveStartDateChanged():
return startDateChanged(_that);case ArchiveEndDateChanged():
return endDateChanged(_that);case ArchiveBackTapped():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ArchiveStarted value)?  started,TResult? Function( ArchiveRefreshRequested value)?  refreshRequested,TResult? Function( ArchiveStartDateChanged value)?  startDateChanged,TResult? Function( ArchiveEndDateChanged value)?  endDateChanged,TResult? Function( ArchiveBackTapped value)?  backTapped,}){
final _that = this;
switch (_that) {
case ArchiveStarted() when started != null:
return started(_that);case ArchiveRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case ArchiveStartDateChanged() when startDateChanged != null:
return startDateChanged(_that);case ArchiveEndDateChanged() when endDateChanged != null:
return endDateChanged(_that);case ArchiveBackTapped() when backTapped != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshRequested,TResult Function( DateTime date)?  startDateChanged,TResult Function( DateTime date)?  endDateChanged,TResult Function()?  backTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ArchiveStarted() when started != null:
return started();case ArchiveRefreshRequested() when refreshRequested != null:
return refreshRequested();case ArchiveStartDateChanged() when startDateChanged != null:
return startDateChanged(_that.date);case ArchiveEndDateChanged() when endDateChanged != null:
return endDateChanged(_that.date);case ArchiveBackTapped() when backTapped != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshRequested,required TResult Function( DateTime date)  startDateChanged,required TResult Function( DateTime date)  endDateChanged,required TResult Function()  backTapped,}) {final _that = this;
switch (_that) {
case ArchiveStarted():
return started();case ArchiveRefreshRequested():
return refreshRequested();case ArchiveStartDateChanged():
return startDateChanged(_that.date);case ArchiveEndDateChanged():
return endDateChanged(_that.date);case ArchiveBackTapped():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshRequested,TResult? Function( DateTime date)?  startDateChanged,TResult? Function( DateTime date)?  endDateChanged,TResult? Function()?  backTapped,}) {final _that = this;
switch (_that) {
case ArchiveStarted() when started != null:
return started();case ArchiveRefreshRequested() when refreshRequested != null:
return refreshRequested();case ArchiveStartDateChanged() when startDateChanged != null:
return startDateChanged(_that.date);case ArchiveEndDateChanged() when endDateChanged != null:
return endDateChanged(_that.date);case ArchiveBackTapped() when backTapped != null:
return backTapped();case _:
  return null;

}
}

}

/// @nodoc


class ArchiveStarted implements ArchiveEvent {
  const ArchiveStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArchiveStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ArchiveEvent.started()';
}


}




/// @nodoc


class ArchiveRefreshRequested implements ArchiveEvent {
  const ArchiveRefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArchiveRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ArchiveEvent.refreshRequested()';
}


}




/// @nodoc


class ArchiveStartDateChanged implements ArchiveEvent {
  const ArchiveStartDateChanged(this.date);
  

 final  DateTime date;

/// Create a copy of ArchiveEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArchiveStartDateChangedCopyWith<ArchiveStartDateChanged> get copyWith => _$ArchiveStartDateChangedCopyWithImpl<ArchiveStartDateChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArchiveStartDateChanged&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'ArchiveEvent.startDateChanged(date: $date)';
}


}

/// @nodoc
abstract mixin class $ArchiveStartDateChangedCopyWith<$Res> implements $ArchiveEventCopyWith<$Res> {
  factory $ArchiveStartDateChangedCopyWith(ArchiveStartDateChanged value, $Res Function(ArchiveStartDateChanged) _then) = _$ArchiveStartDateChangedCopyWithImpl;
@useResult
$Res call({
 DateTime date
});




}
/// @nodoc
class _$ArchiveStartDateChangedCopyWithImpl<$Res>
    implements $ArchiveStartDateChangedCopyWith<$Res> {
  _$ArchiveStartDateChangedCopyWithImpl(this._self, this._then);

  final ArchiveStartDateChanged _self;
  final $Res Function(ArchiveStartDateChanged) _then;

/// Create a copy of ArchiveEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = null,}) {
  return _then(ArchiveStartDateChanged(
null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class ArchiveEndDateChanged implements ArchiveEvent {
  const ArchiveEndDateChanged(this.date);
  

 final  DateTime date;

/// Create a copy of ArchiveEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArchiveEndDateChangedCopyWith<ArchiveEndDateChanged> get copyWith => _$ArchiveEndDateChangedCopyWithImpl<ArchiveEndDateChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArchiveEndDateChanged&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,date);

@override
String toString() {
  return 'ArchiveEvent.endDateChanged(date: $date)';
}


}

/// @nodoc
abstract mixin class $ArchiveEndDateChangedCopyWith<$Res> implements $ArchiveEventCopyWith<$Res> {
  factory $ArchiveEndDateChangedCopyWith(ArchiveEndDateChanged value, $Res Function(ArchiveEndDateChanged) _then) = _$ArchiveEndDateChangedCopyWithImpl;
@useResult
$Res call({
 DateTime date
});




}
/// @nodoc
class _$ArchiveEndDateChangedCopyWithImpl<$Res>
    implements $ArchiveEndDateChangedCopyWith<$Res> {
  _$ArchiveEndDateChangedCopyWithImpl(this._self, this._then);

  final ArchiveEndDateChanged _self;
  final $Res Function(ArchiveEndDateChanged) _then;

/// Create a copy of ArchiveEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? date = null,}) {
  return _then(ArchiveEndDateChanged(
null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class ArchiveBackTapped implements ArchiveEvent {
  const ArchiveBackTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArchiveBackTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ArchiveEvent.backTapped()';
}


}




// dart format on
