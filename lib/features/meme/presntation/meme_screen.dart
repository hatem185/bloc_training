import 'package:bloc_training_app/features/meme/bloc/meme_cubit.dart';
import 'package:bloc_training_app/features/meme/data/repo/meme_api_data_provider.dart';
import 'package:bloc_training_app/features/meme/data/repo/meme_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<MemeCubit, MemeState>(
              builder: (context, state) => SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
