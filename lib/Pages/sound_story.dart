import 'package:flutter/material.dart';
import 'package:flutter_application_7/Component/datamanager.dart';
import 'package:flutter_application_7/Pages/sound_page_player.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SoundPage extends StatefulWidget {
  List<Map<String, dynamic>> ditalsSounds = [];
  SoundPage({super.key, required this.ditalsSounds});

  @override
  State<SoundPage> createState() => _SoundPageState();
}

class _SoundPageState extends State<SoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قصص صوتية'),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Selector<DataManager, List<Map<String, dynamic>>>(
        selector: (context, prof) => prof.getDitalsSound,
        builder: (context, dataManager, child) {
          return ListView.builder(
            itemCount: dataManager.length,
            itemBuilder: (context, i) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => AudioPlayerScreen(
                                getditals: dataManager[i],
                              )),
                    );
                  },
                  leading: ClipOval(
                    child: Image.asset(
                      "${dataManager[i]['imagePath']}",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  title: Text(
                    "${dataManager[i]["title"]}",
                    textAlign: TextAlign.end,
                  ),
                  trailing: const Icon(Icons.play_circle_outlined),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


