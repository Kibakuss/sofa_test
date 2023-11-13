import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sofa/presentation/bloc/photo_bloc.dart';

class DialogWidget extends StatefulWidget {
  const DialogWidget({super.key});

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  final PageController _photoController = PageController();

  @override
  void dispose() {
    _photoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        final photos = (state as PhotosLoaded).photos;
        return Dialog(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: SizedBox(
              width: 300,
              height: 300,
              child: PageView.builder(
                itemCount: photos.length,
                controller: _photoController,
                itemBuilder: (context, index) {
                  return Image.network(photos[index].url.toString());
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
