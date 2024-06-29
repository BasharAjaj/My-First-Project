import 'package:flutter/material.dart';
import 'package:flutter_application_7/Component/datamanager.dart';
import 'package:flutter_application_7/Pages/ditals_storyes.dart';
import 'package:provider/provider.dart';

class FaivoretPage extends StatefulWidget {
  const FaivoretPage({super.key});

  @override
  State<FaivoretPage> createState() => _FaivoretPageState();
}

class _FaivoretPageState extends State<FaivoretPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('القصص المفضلة'),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: Consumer<DataManager>(
        builder: (context, datamanager, child) {
          if (datamanager.favoriteItems.isEmpty) {
            return Center(
              child: Text(
                'لاتوجد قصص مفضلة بعد',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          } else {
            return ListView.builder(
              itemCount: datamanager.favoriteItems.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    onLongPress: () {},
                    title: Text(
                      '${datamanager.favoriteItems[i]['title']}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            story: datamanager.favoriteItems[i],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
