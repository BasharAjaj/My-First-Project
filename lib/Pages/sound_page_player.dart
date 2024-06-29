import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AudioPlayerScreen extends StatefulWidget {
  Map<String, dynamic> getditals = {};
  AudioPlayerScreen({super.key, required this.getditals});

  @override
  // ignore: library_pr ivate_types_in_public_api
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    openAudio();
  }

  void openAudio() async {
    await _assetsAudioPlayer.open(
      Audio("${widget.getditals["soundPath"]}"),
      autoStart: true,
      showNotification: true,
    );
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  Duration position = const Duration();
  Duration musicLength = const Duration();

 Widget slider() {
    return SizedBox(
      width: 300.0,
      child: Slider.adaptive(
          activeColor: Colors.blue[800],
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekToSec(value.toInt());
          }),
    );
  }

  void seekToSec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _assetsAudioPlayer.seek(newPos);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("مشغل القصص"),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 5, 85, 176),
              Color.fromARGB(255, 152, 189, 219),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  "${widget.getditals["imagePath"]}",
                  width: 400,
                  height: 326,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StreamBuilder<Playing?>(
                      stream: _assetsAudioPlayer.current,
                      builder: (context, snapshot) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.replay_10),
                              onPressed: () {
                                _assetsAudioPlayer.seekBy(const Duration(seconds: -10));
                              },
                            ),
                            StreamBuilder<bool>(
                              stream: _assetsAudioPlayer.isPlaying,
                              builder: (context, snapshot) {
                                final isPlaying = snapshot.data ?? false;

                                return IconButton(
                                  icon: Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    _assetsAudioPlayer.playOrPause();
                                  },
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.forward_10),
                              onPressed: () {
                                _assetsAudioPlayer.seekBy(const Duration(seconds: 10));
                              },
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(
                      width: 500,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          StreamBuilder<Duration>(
                            stream: _assetsAudioPlayer.currentPosition,
                            builder: (context, snapshot) {
                              position = snapshot.data ?? Duration.zero;
                              return Text(
                                "${position.inMinutes}:${position.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                              );
                            },
                          ),
                          slider(),
                          StreamBuilder<Playing?>(
                            stream: _assetsAudioPlayer.current,
                            builder: (context, snapshot) {
                              final playing = snapshot.data;
                              final duration = playing?.audio.duration ?? Duration.zero;
                              return Text(
                                "${duration.inMinutes}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



