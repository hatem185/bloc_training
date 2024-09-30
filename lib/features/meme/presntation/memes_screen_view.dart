import 'package:bloc_training_app/features/meme/cubit/memes_cubit/memes_cubit.dart';
import 'package:bloc_training_app/features/meme/presntation/widgets/meme_post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemesScreenView extends StatelessWidget {
  const MemesScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<MemesCubit, MemesState>(
              builder: (context, state) {
                if (state is MemesLoading) {
                  return CircularProgressIndicator();
                }
                if (state is MemesSuccess) {
                  return Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          final meme = state.memeResponse?.memes?[index];
                          final isSpoiler = meme?.spoiler == true;
                          return MemePostCard(
                            meme: meme!,
                            isSpoiler: isSpoiler,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: state.memeResponse.memes?.length ?? 0),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
