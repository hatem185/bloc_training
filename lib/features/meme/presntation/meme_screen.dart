import 'package:bloc_training_app/features/meme/cubit/memes_cubit/memes_cubit.dart';
import 'package:bloc_training_app/features/meme/cubit/random_meme_cubit/random_meme_cubit.dart';
import 'package:bloc_training_app/features/meme/data/repo/meme_api_data_provider.dart';
import 'package:bloc_training_app/features/meme/data/repo/meme_repo.dart';
import 'package:bloc_training_app/features/meme/presntation/memes_screen_view.dart';
import 'package:bloc_training_app/features/meme/presntation/random_meme_screen_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemeScreen extends StatelessWidget {
  const MemeScreen({super.key});

  @override
  Widget build(context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RandomMemeCubit(
            MemeRepo(
              MemeApiDataProvider(
                Dio(),
              ),
            ),
          )..getRandomMeme(),
        ),
        BlocProvider(
          create: (context) => MemesCubit(
            MemeRepo(
              MemeApiDataProvider(
                Dio(),
              ),
            ),
          )..fetchMemes(),
        ),
      ],
      child: const MemeTapView(),
    );
  }
}

class MemeTapView extends StatelessWidget {
  const MemeTapView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.cloud_outlined),
                text: "Random",
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
                text: "Memes",
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          RandomMemeScreenView(),
          MemesScreenView(),
        ]),
      ),
    );
  }
}
