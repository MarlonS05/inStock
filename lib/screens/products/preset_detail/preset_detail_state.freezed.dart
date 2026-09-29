// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preset_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PresetMaterialLine {

 PresetMaterial get line; String get materialTitle;
/// Create a copy of PresetMaterialLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresetMaterialLineCopyWith<PresetMaterialLine> get copyWith => _$PresetMaterialLineCopyWithImpl<PresetMaterialLine>(this as PresetMaterialLine, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresetMaterialLine&&(identical(other.line, line) || other.line == line)&&(identical(other.materialTitle, materialTitle) || other.materialTitle == materialTitle));
}


@override
int get hashCode => Object.hash(runtimeType,line,materialTitle);

@override
String toString() {
  return 'PresetMaterialLine(line: $line, materialTitle: $materialTitle)';
}


}

/// @nodoc
abstract mixin class $PresetMaterialLineCopyWith<$Res>  {
  factory $PresetMaterialLineCopyWith(PresetMaterialLine value, $Res Function(PresetMaterialLine) _then) = _$PresetMaterialLineCopyWithImpl;
@useResult
$Res call({
 PresetMaterial line, String materialTitle
});




}
/// @nodoc
class _$PresetMaterialLineCopyWithImpl<$Res>
    implements $PresetMaterialLineCopyWith<$Res> {
  _$PresetMaterialLineCopyWithImpl(this._self, this._then);

  final PresetMaterialLine _self;
  final $Res Function(PresetMaterialLine) _then;

/// Create a copy of PresetMaterialLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? line = null,Object? materialTitle = null,}) {
  return _then(_self.copyWith(
line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as PresetMaterial,materialTitle: null == materialTitle ? _self.materialTitle : materialTitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PresetMaterialLine].
extension PresetMaterialLinePatterns on PresetMaterialLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresetMaterialLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresetMaterialLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresetMaterialLine value)  $default,){
final _that = this;
switch (_that) {
case _PresetMaterialLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresetMaterialLine value)?  $default,){
final _that = this;
switch (_that) {
case _PresetMaterialLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PresetMaterial line,  String materialTitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresetMaterialLine() when $default != null:
return $default(_that.line,_that.materialTitle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PresetMaterial line,  String materialTitle)  $default,) {final _that = this;
switch (_that) {
case _PresetMaterialLine():
return $default(_that.line,_that.materialTitle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PresetMaterial line,  String materialTitle)?  $default,) {final _that = this;
switch (_that) {
case _PresetMaterialLine() when $default != null:
return $default(_that.line,_that.materialTitle);case _:
  return null;

}
}

}

/// @nodoc


class _PresetMaterialLine implements PresetMaterialLine {
  const _PresetMaterialLine({required this.line, required this.materialTitle});
  

@override final  PresetMaterial line;
@override final  String materialTitle;

/// Create a copy of PresetMaterialLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresetMaterialLineCopyWith<_PresetMaterialLine> get copyWith => __$PresetMaterialLineCopyWithImpl<_PresetMaterialLine>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresetMaterialLine&&(identical(other.line, line) || other.line == line)&&(identical(other.materialTitle, materialTitle) || other.materialTitle == materialTitle));
}


@override
int get hashCode => Object.hash(runtimeType,line,materialTitle);

@override
String toString() {
  return 'PresetMaterialLine(line: $line, materialTitle: $materialTitle)';
}


}

/// @nodoc
abstract mixin class _$PresetMaterialLineCopyWith<$Res> implements $PresetMaterialLineCopyWith<$Res> {
  factory _$PresetMaterialLineCopyWith(_PresetMaterialLine value, $Res Function(_PresetMaterialLine) _then) = __$PresetMaterialLineCopyWithImpl;
@override @useResult
$Res call({
 PresetMaterial line, String materialTitle
});




}
/// @nodoc
class __$PresetMaterialLineCopyWithImpl<$Res>
    implements _$PresetMaterialLineCopyWith<$Res> {
  __$PresetMaterialLineCopyWithImpl(this._self, this._then);

  final _PresetMaterialLine _self;
  final $Res Function(_PresetMaterialLine) _then;

/// Create a copy of PresetMaterialLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? line = null,Object? materialTitle = null,}) {
  return _then(_PresetMaterialLine(
line: null == line ? _self.line : line // ignore: cast_nullable_to_non_nullable
as PresetMaterial,materialTitle: null == materialTitle ? _self.materialTitle : materialTitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$PresetDetailState {

 PresetDetailStatus get status; Preset? get preset; List<PresetMaterialLine> get materialLines; List<Material> get allMaterials; String? get errorMessage; String? get createdProductId; bool get imagePickFailed;
/// Create a copy of PresetDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresetDetailStateCopyWith<PresetDetailState> get copyWith => _$PresetDetailStateCopyWithImpl<PresetDetailState>(this as PresetDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresetDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.preset, preset) || other.preset == preset)&&const DeepCollectionEquality().equals(other.materialLines, materialLines)&&const DeepCollectionEquality().equals(other.allMaterials, allMaterials)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.createdProductId, createdProductId) || other.createdProductId == createdProductId)&&(identical(other.imagePickFailed, imagePickFailed) || other.imagePickFailed == imagePickFailed));
}


@override
int get hashCode => Object.hash(runtimeType,status,preset,const DeepCollectionEquality().hash(materialLines),const DeepCollectionEquality().hash(allMaterials),errorMessage,createdProductId,imagePickFailed);

@override
String toString() {
  return 'PresetDetailState(status: $status, preset: $preset, materialLines: $materialLines, allMaterials: $allMaterials, errorMessage: $errorMessage, createdProductId: $createdProductId, imagePickFailed: $imagePickFailed)';
}


}

/// @nodoc
abstract mixin class $PresetDetailStateCopyWith<$Res>  {
  factory $PresetDetailStateCopyWith(PresetDetailState value, $Res Function(PresetDetailState) _then) = _$PresetDetailStateCopyWithImpl;
@useResult
$Res call({
 PresetDetailStatus status, Preset? preset, List<PresetMaterialLine> materialLines, List<Material> allMaterials, String? errorMessage, String? createdProductId, bool imagePickFailed
});




}
/// @nodoc
class _$PresetDetailStateCopyWithImpl<$Res>
    implements $PresetDetailStateCopyWith<$Res> {
  _$PresetDetailStateCopyWithImpl(this._self, this._then);

  final PresetDetailState _self;
  final $Res Function(PresetDetailState) _then;

/// Create a copy of PresetDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? preset = freezed,Object? materialLines = null,Object? allMaterials = null,Object? errorMessage = freezed,Object? createdProductId = freezed,Object? imagePickFailed = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PresetDetailStatus,preset: freezed == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as Preset?,materialLines: null == materialLines ? _self.materialLines : materialLines // ignore: cast_nullable_to_non_nullable
as List<PresetMaterialLine>,allMaterials: null == allMaterials ? _self.allMaterials : allMaterials // ignore: cast_nullable_to_non_nullable
as List<Material>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,createdProductId: freezed == createdProductId ? _self.createdProductId : createdProductId // ignore: cast_nullable_to_non_nullable
as String?,imagePickFailed: null == imagePickFailed ? _self.imagePickFailed : imagePickFailed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PresetDetailState].
extension PresetDetailStatePatterns on PresetDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresetDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresetDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresetDetailState value)  $default,){
final _that = this;
switch (_that) {
case _PresetDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresetDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _PresetDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PresetDetailStatus status,  Preset? preset,  List<PresetMaterialLine> materialLines,  List<Material> allMaterials,  String? errorMessage,  String? createdProductId,  bool imagePickFailed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresetDetailState() when $default != null:
return $default(_that.status,_that.preset,_that.materialLines,_that.allMaterials,_that.errorMessage,_that.createdProductId,_that.imagePickFailed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PresetDetailStatus status,  Preset? preset,  List<PresetMaterialLine> materialLines,  List<Material> allMaterials,  String? errorMessage,  String? createdProductId,  bool imagePickFailed)  $default,) {final _that = this;
switch (_that) {
case _PresetDetailState():
return $default(_that.status,_that.preset,_that.materialLines,_that.allMaterials,_that.errorMessage,_that.createdProductId,_that.imagePickFailed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PresetDetailStatus status,  Preset? preset,  List<PresetMaterialLine> materialLines,  List<Material> allMaterials,  String? errorMessage,  String? createdProductId,  bool imagePickFailed)?  $default,) {final _that = this;
switch (_that) {
case _PresetDetailState() when $default != null:
return $default(_that.status,_that.preset,_that.materialLines,_that.allMaterials,_that.errorMessage,_that.createdProductId,_that.imagePickFailed);case _:
  return null;

}
}

}

/// @nodoc


class _PresetDetailState extends PresetDetailState {
  const _PresetDetailState({this.status = PresetDetailStatus.initial, this.preset, final  List<PresetMaterialLine> materialLines = const [], final  List<Material> allMaterials = const [], this.errorMessage, this.createdProductId, this.imagePickFailed = false}): _materialLines = materialLines,_allMaterials = allMaterials,super._();
  

@override@JsonKey() final  PresetDetailStatus status;
@override final  Preset? preset;
 final  List<PresetMaterialLine> _materialLines;
@override@JsonKey() List<PresetMaterialLine> get materialLines {
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
@override final  String? createdProductId;
@override@JsonKey() final  bool imagePickFailed;

/// Create a copy of PresetDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresetDetailStateCopyWith<_PresetDetailState> get copyWith => __$PresetDetailStateCopyWithImpl<_PresetDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresetDetailState&&(identical(other.status, status) || other.status == status)&&(identical(other.preset, preset) || other.preset == preset)&&const DeepCollectionEquality().equals(other._materialLines, _materialLines)&&const DeepCollectionEquality().equals(other._allMaterials, _allMaterials)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.createdProductId, createdProductId) || other.createdProductId == createdProductId)&&(identical(other.imagePickFailed, imagePickFailed) || other.imagePickFailed == imagePickFailed));
}


@override
int get hashCode => Object.hash(runtimeType,status,preset,const DeepCollectionEquality().hash(_materialLines),const DeepCollectionEquality().hash(_allMaterials),errorMessage,createdProductId,imagePickFailed);

@override
String toString() {
  return 'PresetDetailState(status: $status, preset: $preset, materialLines: $materialLines, allMaterials: $allMaterials, errorMessage: $errorMessage, createdProductId: $createdProductId, imagePickFailed: $imagePickFailed)';
}


}

/// @nodoc
abstract mixin class _$PresetDetailStateCopyWith<$Res> implements $PresetDetailStateCopyWith<$Res> {
  factory _$PresetDetailStateCopyWith(_PresetDetailState value, $Res Function(_PresetDetailState) _then) = __$PresetDetailStateCopyWithImpl;
@override @useResult
$Res call({
 PresetDetailStatus status, Preset? preset, List<PresetMaterialLine> materialLines, List<Material> allMaterials, String? errorMessage, String? createdProductId, bool imagePickFailed
});




}
/// @nodoc
class __$PresetDetailStateCopyWithImpl<$Res>
    implements _$PresetDetailStateCopyWith<$Res> {
  __$PresetDetailStateCopyWithImpl(this._self, this._then);

  final _PresetDetailState _self;
  final $Res Function(_PresetDetailState) _then;

/// Create a copy of PresetDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? preset = freezed,Object? materialLines = null,Object? allMaterials = null,Object? errorMessage = freezed,Object? createdProductId = freezed,Object? imagePickFailed = null,}) {
  return _then(_PresetDetailState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PresetDetailStatus,preset: freezed == preset ? _self.preset : preset // ignore: cast_nullable_to_non_nullable
as Preset?,materialLines: null == materialLines ? _self._materialLines : materialLines // ignore: cast_nullable_to_non_nullable
as List<PresetMaterialLine>,allMaterials: null == allMaterials ? _self._allMaterials : allMaterials // ignore: cast_nullable_to_non_nullable
as List<Material>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,createdProductId: freezed == createdProductId ? _self.createdProductId : createdProductId // ignore: cast_nullable_to_non_nullable
as String?,imagePickFailed: null == imagePickFailed ? _self.imagePickFailed : imagePickFailed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
