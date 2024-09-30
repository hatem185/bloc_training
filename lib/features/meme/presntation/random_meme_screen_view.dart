import 'package:bloc_training_app/features/meme/cubit/random_meme_cubit/random_meme_cubit.dart';
import 'package:bloc_training_app/features/meme/data/model/meme_model.dart';
import 'package:bloc_training_app/features/meme/presntation/widgets/meme_post_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RandomMemeScreenView extends StatelessWidget {
  const RandomMemeScreenView({super.key});

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
            BlocBuilder<RandomMemeCubit, RandomMemeState>(
              builder: (context, state) {
                if (state is RandomMemeLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is RandomMemeSuccess) {
                  final meme = state.meme;
                  final isSpoiler = meme.spoiler == true;
                  return MemePostCard(meme: meme, isSpoiler: isSpoiler);
                }
                if (state is RandomMemeError) {
                  return Text(
                    state.message ?? "",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 30,
                    ),
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

