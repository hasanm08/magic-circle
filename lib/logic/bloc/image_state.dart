import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/models/image_model.dart';

part 'image_state.freezed.dart';

@freezed
class ImageState with _$ImageState {
  const factory ImageState.initial() = ImageInitial;
  const factory ImageState.loading() = ImageLoading;
  const factory ImageState.loaded({
    required ImageModel image,
    @Default(Colors.white) Color backgroundColor,
  }) = ImageLoaded;
  const factory ImageState.error(String message) = ImageError;
}
