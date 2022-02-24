import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CowPage extends StatefulWidget {
  const CowPage({Key? key}) : super(key: key);

  @override
  State<CowPage> createState() => _CowPageState();
}

class _CowPageState extends State<CowPage> with SingleTickerProviderStateMixin {
  late AudioCache _audioPlayer;
  late final AnimationController _controller;
  @override
  void initState() {
    _audioPlayer = AudioCache();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
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
                _controller.forward();
                _audioPlayer.play('cow.wav');
              },
              child: Lottie.asset(
                'assets/cow_ani.json',
                controller: _controller,
                onLoaded: (composition) {
                  _controller.duration = composition.duration;
                  _controller.forward();
                  _audioPlayer.play('cow.wav');
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
