import 'package:audioplayers/audioplayers.dart';
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


  //audio player
  final AudioPlayer _audioPlayer = AudioPlayer();


  //durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  //constructors
  PlaylistProvider(){
    listenToDuration();
    }

//initially not playing
bool _isplaying =false;

void play() async{
  final String path = _playlist[_currentSongIndex!].audioPath;
  await _audioPlayer.stop();
  await _audioPlayer.play(AssetSource(path));
  _isplaying= true;
  notifyListeners();
}

void pause() async{
  await _audioPlayer.pause();
  _isplaying=false;
  notifyListeners();
}

void resume() async {
  await _audioPlayer.resume();
  _isplaying=true;
  notifyListeners();
}

void pauseOrResume() async {
  if(_isplaying) {
    pause();
  } else {
     resume();
  }
  notifyListeners();
}

void seek(Duration position) async {
  await _audioPlayer.seek(position);
}

void playNextSong() {
  if(_currentSongIndex != null){
    if(_currentSongIndex! < _playlist.length-1){
      currentSongIndex = _currentSongIndex! + 1;
    }else {
      currentSongIndex = 0;
    }
  }
}

void playpreviousSong() async {
  if(_currentDuration.inSeconds >2) {}
  else {
    if(_currentSongIndex! >0){
      currentSongIndex = _currentSongIndex! -1;
    }
    else {
      currentSongIndex = _playlist.length-1;
    }
  }
}





  void listenToDuration() {
//listen for total duration
_audioPlayer.onDurationChanged.listen((newDuration) {
  _totalDuration = newDuration;
  notifyListeners();
});

//for current duration 
_audioPlayer.onPositionChanged.listen((newPosition) {
  _currentDuration=newPosition;
});

//for song completion
_audioPlayer.onPlayerComplete.listen((event) {playNextSong();});

}

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isplaying;
  Duration get currentDuration=> _currentDuration;
  Duration get totalDuration=>_totalDuration;


  set currentSongIndex(int? newIndex){

    _currentSongIndex = newIndex;

    if(newIndex !=null){
      play();
    }
    notifyListeners();
  }
}
