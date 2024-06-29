
import 'package:flutter/material.dart';
import 'package:flutter_application_7/Component/datamanager.dart';
import 'package:flutter_application_7/Pages/ditals_storyes.dart';
import 'package:provider/provider.dart';

class BaybyStory extends StatefulWidget {
  final List<Map<String, dynamic>> part;
  const BaybyStory({super.key, required this.part});

  @override
  State<BaybyStory> createState() => BaybyStoryState();
}

class BaybyStoryState extends State<BaybyStory> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Baby Story'),
        centerTitle: true,
      ),
      body: Consumer<DataManager>(
        builder: (context, dataManager, child) {
          if (widget.part.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
            itemCount: widget.part.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int i) {
              return InkWell(
                child: Card(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 20, bottom: 10),
                  color: Theme.of(context).colorScheme.primary,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: widget.part.length == 8
                            ? Image.asset(
                                '${widget.part[i]['imagePath']}',
                              )
                            : Image.asset(
                                "${widget.part[i]["imagePath"]}",
                              ),
                      ),
                      Text(
                        "${widget.part[i]['title']}",
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(story: widget.part[i]),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
