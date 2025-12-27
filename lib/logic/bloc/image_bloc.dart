import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/image_repository.dart';
import 'image_event.dart';
import 'image_state.dart';

export 'image_event.dart';
export 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImageRepository repository;

  ImageBloc({required this.repository}) : super(const ImageState.initial()) {
    on<FetchImage>(_onFetchImage);
  }

  Future<void> _onFetchImage(FetchImage event, Emitter<ImageState> emit) async {
    emit(const ImageState.loading());
    try {
      final image = await repository.fetchImage();
      emit(ImageState.loaded(image: image, backgroundColor: Colors.grey[200]!));
    } catch (e) {
      emit(ImageState.error(e.toString()));
    }
  }
}
