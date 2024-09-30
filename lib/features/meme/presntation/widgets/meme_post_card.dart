import 'package:bloc_training_app/features/meme/data/model/meme_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MemePostCard extends StatelessWidget {
  const MemePostCard({
    super.key,
    required this.meme,
    required this.isSpoiler,
  });

  final MemeModel meme;
  final bool isSpoiler;

  @override
  Widget build(BuildContext context) {
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
}
