// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ImageState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImageState()';
}


}

/// @nodoc
class $ImageStateCopyWith<$Res>  {
$ImageStateCopyWith(ImageState _, $Res Function(ImageState) __);
}


/// Adds pattern-matching-related methods to [ImageState].
extension ImageStatePatterns on ImageState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ImageInitial value)?  initial,TResult Function( ImageLoading value)?  loading,TResult Function( ImageLoaded value)?  loaded,TResult Function( ImageError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ImageInitial() when initial != null:
return initial(_that);case ImageLoading() when loading != null:
return loading(_that);case ImageLoaded() when loaded != null:
return loaded(_that);case ImageError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ImageInitial value)  initial,required TResult Function( ImageLoading value)  loading,required TResult Function( ImageLoaded value)  loaded,required TResult Function( ImageError value)  error,}){
final _that = this;
switch (_that) {
case ImageInitial():
return initial(_that);case ImageLoading():
return loading(_that);case ImageLoaded():
return loaded(_that);case ImageError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ImageInitial value)?  initial,TResult? Function( ImageLoading value)?  loading,TResult? Function( ImageLoaded value)?  loaded,TResult? Function( ImageError value)?  error,}){
final _that = this;
switch (_that) {
case ImageInitial() when initial != null:
return initial(_that);case ImageLoading() when loading != null:
return loading(_that);case ImageLoaded() when loaded != null:
return loaded(_that);case ImageError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ImageModel image,  Color backgroundColor)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ImageInitial() when initial != null:
return initial();case ImageLoading() when loading != null:
return loading();case ImageLoaded() when loaded != null:
return loaded(_that.image,_that.backgroundColor);case ImageError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ImageModel image,  Color backgroundColor)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case ImageInitial():
return initial();case ImageLoading():
return loading();case ImageLoaded():
return loaded(_that.image,_that.backgroundColor);case ImageError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ImageModel image,  Color backgroundColor)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case ImageInitial() when initial != null:
return initial();case ImageLoading() when loading != null:
return loading();case ImageLoaded() when loaded != null:
return loaded(_that.image,_that.backgroundColor);case ImageError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ImageInitial implements ImageState {
  const ImageInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImageState.initial()';
}


}




/// @nodoc


class ImageLoading implements ImageState {
  const ImageLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ImageState.loading()';
}


}




/// @nodoc


class ImageLoaded implements ImageState {
  const ImageLoaded({required this.image, this.backgroundColor = Colors.white});
  

 final  ImageModel image;
@JsonKey() final  Color backgroundColor;

/// Create a copy of ImageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageLoadedCopyWith<ImageLoaded> get copyWith => _$ImageLoadedCopyWithImpl<ImageLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageLoaded&&(identical(other.image, image) || other.image == image)&&(identical(other.backgroundColor, backgroundColor) || other.backgroundColor == backgroundColor));
}


@override
int get hashCode => Object.hash(runtimeType,image,backgroundColor);

@override
String toString() {
  return 'ImageState.loaded(image: $image, backgroundColor: $backgroundColor)';
}


}

/// @nodoc
abstract mixin class $ImageLoadedCopyWith<$Res> implements $ImageStateCopyWith<$Res> {
  factory $ImageLoadedCopyWith(ImageLoaded value, $Res Function(ImageLoaded) _then) = _$ImageLoadedCopyWithImpl;
@useResult
$Res call({
 ImageModel image, Color backgroundColor
});




}
/// @nodoc
class _$ImageLoadedCopyWithImpl<$Res>
    implements $ImageLoadedCopyWith<$Res> {
  _$ImageLoadedCopyWithImpl(this._self, this._then);

  final ImageLoaded _self;
  final $Res Function(ImageLoaded) _then;

/// Create a copy of ImageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? image = null,Object? backgroundColor = null,}) {
  return _then(ImageLoaded(
image: null == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as ImageModel,backgroundColor: null == backgroundColor ? _self.backgroundColor : backgroundColor // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

/// @nodoc


class ImageError implements ImageState {
  const ImageError(this.message);
  

 final  String message;

/// Create a copy of ImageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageErrorCopyWith<ImageError> get copyWith => _$ImageErrorCopyWithImpl<ImageError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ImageState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ImageErrorCopyWith<$Res> implements $ImageStateCopyWith<$Res> {
  factory $ImageErrorCopyWith(ImageError value, $Res Function(ImageError) _then) = _$ImageErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ImageErrorCopyWithImpl<$Res>
    implements $ImageErrorCopyWith<$Res> {
  _$ImageErrorCopyWithImpl(this._self, this._then);

  final ImageError _self;
  final $Res Function(ImageError) _then;

/// Create a copy of ImageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ImageError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
