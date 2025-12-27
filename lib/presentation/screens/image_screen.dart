import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magic_circle/presentation/screens/image_screen_view.dart';

import '../../core/di/service_locator.dart';
import '../../logic/bloc/image_bloc.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ImageBloc>()..add(const ImageEvent.fetchImage()),
      child: const ImageScreenView(),
    );
  }
}
