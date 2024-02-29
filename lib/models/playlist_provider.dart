import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
        songName: "So Sick",
        artistName: "none",
        albumArtImagePath: "path for img",
        audioPath: "audio/chill.mp3"),

    Song(
        songName: "2nd song",
        artistName: "none",
        albumArtImagePath: "path for img",
        audioPath: "audio/chill.mp3"),

    Song(
        songName: "Third",
        artistName: "none",
        albumArtImagePath: "path for img",
        audioPath: "audio/chill.mp3"),
  ];

  int? _currentSongIndex;



  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;


  set currentSongIndex(int? newIndex){

    _currentSongIndex = newIndex;

    notifyListeners();
  }
}
