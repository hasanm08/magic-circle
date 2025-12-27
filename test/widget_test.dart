import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:magic_circle/data/models/image_model.dart';
import 'package:magic_circle/data/repositories/image_repository.dart';
import 'package:magic_circle/logic/bloc/image_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockImageRepository extends Mock implements ImageRepository {}

void main() {
  group('ImageBloc', () {
    late ImageRepository repository;
    late ImageBloc bloc;

    setUp(() {
      repository = MockImageRepository();
      bloc = ImageBloc(repository: repository);
    });

    // Simple test
    test('initial state is ImageInitial', () {
      expect(bloc.state, const ImageState.initial());
    });

    blocTest<ImageBloc, ImageState>(
      'emits [ImageLoading, ImageLoaded] when FetchImage is added and success',
      build: () {
        when(() => repository.fetchImage()).thenAnswer(
          (_) async => ImageModel(url: 'https://example.com/image.jpg'),
        );
        return bloc;
      },
      act: (bloc) => bloc.add(const ImageEvent.fetchImage()),
      expect: () => [
        const ImageState.loading(),
        isA<ImageLoaded>().having(
          (s) => s.image.url,
          'url',
          'https://example.com/image.jpg',
        ),
      ],
    );

    blocTest<ImageBloc, ImageState>(
      'emits [ImageLoading, ImageError] when FetchImage fails',
      build: () {
        when(() => repository.fetchImage()).thenThrow(Exception('Failed'));
        return bloc;
      },
      act: (bloc) => bloc.add(const ImageEvent.fetchImage()),
      expect: () => [const ImageState.loading(), isA<ImageError>()],
    );
  });
}
