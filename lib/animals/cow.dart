// import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:audio_session/audio_session.dart';

class CowPage extends StatefulWidget {
  const CowPage({Key? key}) : super(key: key);

  @override
  State<CowPage> createState() => _CowPageState();
}

class _CowPageState extends State<CowPage> with SingleTickerProviderStateMixin {
  // late AudioCache _audioPlayer;
  late AudioPlayer _player;
  late final AnimationController _controller;
  @override
  void initState() {
    _player = AudioPlayer();
    // _audioPlayer = AudioCache();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
      }
    });
    _init();
    super.initState();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      if (kDebugMode) {
        print('A stream error occurred: $e');
      }
    });
    _player
        .setAudioSource(AudioSource.uri(Uri.parse('asset:///assets/cow.wav')));
  }

  @override
  void dispose() {
    _player.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0Xffdf9898),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _player.play();
                _controller.forward();
              },
              child: Lottie.asset(
                'assets/cow_ani.json',
                controller: _controller,
                onLoaded: (composition) {
                  _controller.duration = composition.duration;
                  _controller.forward();
                  _player.play();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: FloatingActionButton(
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
