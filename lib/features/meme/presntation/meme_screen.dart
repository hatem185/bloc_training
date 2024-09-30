import 'package:bloc_training_app/features/meme/bloc/meme_cubit.dart';
import 'package:bloc_training_app/features/meme/data/repo/meme_api_data_provider.dart';
import 'package:bloc_training_app/features/meme/data/repo/meme_repo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MemeScreen extends StatelessWidget {
  const MemeScreen({super.key});

  @override
  Widget build(context) {
    return BlocProvider(
      create: (context) => MemeCubit(
        MemeRepo(
          MemeApiDataProvider(
            Dio(),
          ),
        ),
      )..getRandomMeme(),
      child: const MemeScreenView(),
    );
  }
}

class MemeScreenView extends StatelessWidget {
  const MemeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<MemeCubit, MemeState>(
                builder: (context, state) {
                  if (state is MemeLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is MemeSuccess) {
                    final meme = state.meme;
                    final isSpoiler = meme.spoiler == true;
                    return Card(
                      color: Colors.amberAccent[200],
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: ListTile(
                          title: Text(
                            meme.title ?? "",
                            style: TextStyle(fontSize: 26),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Chip(
                                color: WidgetStateProperty.all(
                                  isSpoiler
                                      ? Colors.redAccent
                                      : Colors.green[400],
                                ),
                                label: Text(
                                  isSpoiler ? "Spoiler" : "Not Spoiler",
                                  style: TextStyle(color: Colors.white),
                                ),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    meme.author ?? "",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Gap(16),
                                  Chip(
                                    label: Text(
                                      meme.subreddit ?? "",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: WidgetStateProperty.all(Colors.blue),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                ],
                              ),
                              Gap(16),
                              CachedNetworkImage(
                                height: 350,
                                fit: BoxFit.fill,
                                imageUrl: meme.url ?? "",
                                placeholder: (context, url) {
                                  return CircularProgressIndicator();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  if (state is MemeError) {
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
      ),
    );
  }
}
