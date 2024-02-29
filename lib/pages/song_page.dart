import 'package:flutter/material.dart';
import 'package:music_player/components/neu_box.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {

        final playlist = value.playlist;

        final currentSong = playlist[value.currentSongIndex ?? 0];    //after this 
        return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back),
                    ),
                    Text("P L A Y L I S T"),
                    IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                  ],
                ),
                NeuBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset("assets/images/pp.png"), //replace this with currentSong.albumartimagepath
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentSong.songName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("0:00"),
                                Icon(Icons.shuffle),
                                Icon(Icons.repeat),
                                Text("0:00"),
                              ]),
                          
                        ],
                      ),
                    ),
                    Slider(
                            value: 50,
                            onChanged: (value) {},
                            min: 0,
                            max: 100,
                          ),
                  ],
                ),
      
                SizedBox(height: 25,),
      
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NeuBox(child: Icon(Icons.skip_previous),),
                    SizedBox(width: 20,),
                    NeuBox(child: Icon(Icons.play_arrow),),
                    SizedBox(width: 20,),
                    NeuBox(child: Icon(Icons.skip_next),),
                  ],
                )
              ],
            ),
          ),
        ),
      );
      },
    );
  }
}
