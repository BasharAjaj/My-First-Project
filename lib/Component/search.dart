import 'package:flutter/material.dart';
import 'package:flutter_application_7/Pages/ditals_storyes.dart';
import 'package:provider/provider.dart';
import 'datamanager.dart';

class CustomSearch extends SearchDelegate {
  List<Map<String, dynamic>> fulterlist = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(
          Icons.close,
        
          size: 24,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          // Navigator.of(context).pop();
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back,
        
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('helllo');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == '') {
      return Selector<DataManager, List<Map<String, dynamic>>>(
        selector: (context, pref) => pref.toStoreallStoriesForSearch,
        builder: (context, dataManager, child) {
          return ListView.builder(
            itemCount: dataManager.length,
            itemBuilder: (context, i) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        story: dataManager[i],
                      ),
                    ),
                  );
                },
                child: Card(
                  child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        "${dataManager[i]["title"]}",
                        textAlign: TextAlign.end,
                        textHeightBehavior: const TextHeightBehavior(
                            applyHeightToLastDescent: true),
                      )),
                ),
              );
            },
          );
        },
      );
    } else {
      fulterlist = Provider.of<DataManager>(context, listen: false)
          .toStoreallStoriesForSearch
          .where((element) => element['title'].contains(query))
          .toList();
      return ListView.builder(
        itemCount: fulterlist.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    story: fulterlist[i],
                  ),
                ),
              );
            },
            child: Card(
              child: Text("${fulterlist[i]["title"]}"),
            ),
          );
        },
      );
    }
  }
}

