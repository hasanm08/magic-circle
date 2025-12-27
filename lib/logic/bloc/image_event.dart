import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_event.freezed.dart';

@freezed
class ImageEvent with _$ImageEvent {
  const factory ImageEvent.fetchImage() = FetchImage;
}
