import 'dart:async';
import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/bloc/image_bloc.dart';
import '../../logic/dominant_color.dart';

class ImageScreenView extends StatefulWidget {
  const ImageScreenView({super.key});

  @override
  State<ImageScreenView> createState() => _ImageScreenViewState();
}

class _ImageScreenViewState extends State<ImageScreenView> {
  Color _backgroundColor = Colors.white;

  Future<void> _updatePalette(ImageProvider imageProvider) async {
    try {
      final bytes = await _extractBytesFromImageProvider(imageProvider);
      if (bytes != null) {
        // Use custom logic
        final DominantColor dominantColor = DominantColor(bytes, k: 2);
        final List<Color> colors = dominantColor.extractDominantColors();

        if (mounted && colors.isNotEmpty) {
          setState(() {
            _backgroundColor = colors.first;
          });
        }
      }
    } catch (e) {
      debugPrint('Error generating palette: $e');
    }
  }

  Future<Uint8List?> _extractBytesFromImageProvider(
    ImageProvider imageProvider,
  ) async {
    final ImageStream stream = imageProvider.resolve(ImageConfiguration.empty);
    final Completer<Uint8List?> completer = Completer<Uint8List?>();

    late ImageStreamListener listener;
    listener = ImageStreamListener(
      (ImageInfo info, bool synchronousCall) async {
        try {
          // Get raw RGBA bytes
          final ByteData? byteData = await info.image.toByteData(
            format: ui.ImageByteFormat.rawRgba,
          );
          completer.complete(byteData?.buffer.asUint8List());
        } catch (e) {
          if (completer.isCompleted) {
            return;
          }
          completer.complete(null);
        } finally {
          stream.removeListener(listener);
        }
      },
      onError: (dynamic exception, StackTrace? stackTrace) {
        completer.complete(null);
        stream.removeListener(listener);
      },
    );
    stream.addListener(listener);
    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: _backgroundColor,
        child: Center(
          child: BlocConsumer<ImageBloc, ImageState>(
            listener: (context, state) {
              if (state is ImageLoaded) {
                // We don't have the image provider easily here without downloading it again
                // if we don't use the one from CachedNetworkImage.
                // However, CachedNetworkImage provides an `imageBuilder` or `Listener`.
                // Actually, `CachedNetworkImage` has a wrapper.
                // Let's rely on the widget's `imageBuilder` or checking the url change.
                // But wait, `PaletteGenerator` takes an `ImageProvider`.
                // We can use `CachedNetworkImageProvider(state.image.url)`.
                _updatePalette(CachedNetworkImageProvider(state.image.url));
              }
            },
            builder: (context, state) {
              // Define content for each state
              Widget loadingWidget = Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.9,
                      maxHeight: MediaQuery.of(context).size.width * 0.9,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      color: Colors.white, // Match background or use grey
                    ),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey[300],
                        ),
                        child: const Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Placeholder for button to keep layout height stable if needed,
                  // or just Invisible widget taking same space.
                  // For now, let's keep it simple. If we want perfect stability, we should include the button too
                  // or use a Stack.
                  // But usually user wants the image area to crossfade.
                  // The button is in the column.
                  // The original code had the button only in loaded/error state.
                  // If we want the button to stay visible (it's "Another"), we should probably move it OUTSIDE the crossfade logic
                  // so the user can spam it, or disable it.
                  // But requirements say "Show a loading state while fetching".
                  // Let's assume loading state replaces everything.
                  // To avoid jump, we can add an invisible button or just let it slide.
                  // Let's stick to replacing the image area primarily.
                ],
              );

              Color textColor = _backgroundColor.computeLuminance() > 0.5
                  ? Colors.black
                  : Colors.white;

              Widget errorWidget = state is ImageError
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 48,
                          color: textColor, // Use adaptive color
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Error: ${state.message}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: textColor,
                          ), // Use adaptive color
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.read<ImageBloc>().add(
                              const ImageEvent.fetchImage(),
                            );
                          },
                          // Make button stand out or match theme
                          style: ElevatedButton.styleFrom(
                            backgroundColor: textColor == Colors.black
                                ? Colors.white
                                : Colors.grey[800],
                            foregroundColor: textColor,
                          ),
                          child: const Text('Retry'),
                        ),
                      ],
                    )
                  : const SizedBox.shrink();

              Widget loadedWidget = state is ImageLoaded
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedOpacity(
                          opacity: 1.0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.9,
                              maxHeight:
                                  MediaQuery.of(context).size.width * 0.9,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: CachedNetworkImage(
                                  imageUrl: state.image.url,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    color: Colors.grey[300],
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Container(
                                        color: Colors.grey[300],
                                        child: const Icon(Icons.broken_image),
                                      ),
                                  fadeInDuration: const Duration(
                                    milliseconds: 500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton.icon(
                          onPressed: () {
                            context.read<ImageBloc>().add(
                              const ImageEvent.fetchImage(),
                            );
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text('Another'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink();

              // States logic: Loading/Initial vs (Error or Loaded)
              // We'll treat Initial as Loading for simplicity in display.
              bool isLoading = state is ImageLoading || state is ImageInitial;

              return AnimatedCrossFade(
                duration: const Duration(milliseconds: 500),
                firstChild: loadingWidget,
                secondChild: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 500),
                  firstChild: errorWidget,
                  secondChild: loadedWidget,
                  crossFadeState: state is ImageError
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
                crossFadeState: isLoading
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              );
            },
          ),
        ),
      ),
    );
  }
}
