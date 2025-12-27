import 'package:dio/dio.dart';

import '../models/image_model.dart';

class ImageRepository {
  final Dio dio;

  ImageRepository({required this.dio});

  Future<ImageModel> fetchImage() async {
    try {
      final response = await dio.get(
        'https://november7-730026606190.europe-west1.run.app/image',
      );
      return ImageModel.fromJson(response.data);
    } catch (e) {
      // In a real app, we would handle specific DioErrors here.
      rethrow;
    }
  }
}
