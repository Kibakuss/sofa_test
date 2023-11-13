import 'package:flutter/material.dart';
import 'package:sofa/presentation/widgets/dialog.dart';
import 'package:sofa/presentation/bloc/photo_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) {
          if (state is PhotosLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PhotosLoaded) {
            return state.photos.isNotEmpty
                ? DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(state.photos[0].url.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        final photoBloc = context.read<PhotoBloc>();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return BlocProvider.value(
                              value: photoBloc,
                              child: const DialogWidget(),
                            );
                          },
                        );
                      },
                    ),
                  )
                : const Text('Нет фото');
          }
          if (state is PhotosLoadingError) {
            return Center(
                child: Text(
                    'При загрузке фото произошла ошибка ${state.exeption}'));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
