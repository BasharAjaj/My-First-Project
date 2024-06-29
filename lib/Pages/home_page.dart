import 'package:flutter/material.dart';
import 'package:flutter_application_7/Component/datamanager.dart';
import 'package:flutter_application_7/Component/search.dart';
import 'package:flutter_application_7/Pages/display_2parts_bayby_and_anbia.dart';
import 'package:flutter_application_7/Pages/sound_story.dart';
import 'package:flutter_application_7/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'favorite_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<DataManager>(context, listen: false).loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      drawer: const AppDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearch(),
              );
            },
            icon: const Icon(
              Icons.search,
              size: 26,
            ),
          ),
        ],
        title: const Text('قصص مفيدة'),
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        actionsIconTheme: Theme.of(context).appBarTheme.actionsIconTheme,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      body: GridView(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: [
          Selector<DataManager, List<Map<String, dynamic>>>(
            selector: (context, pref1) => pref1.getThePart1,
            builder: (context, dataManager, child) {
              return CategoryCard(
                title: 'قصص أطفال',
                image: 'images/image22.png',
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BaybyStory(
                      part: dataManager,
                    ),
                  ),
                ),
              );
            },
          ),
          Selector<DataManager, List<Map<String, dynamic>>>(
            selector: (context, pref2) => pref2.getThePart2,
            builder: (context, dataManager, child) {
              return CategoryCard(
                title: 'قصص الأنبياء',
                image: 'images/image11.png',
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BaybyStory(
                      part: dataManager,
                    ),
                  ),
                ),
              );
            },
          ),
          CategoryCard(
            title: 'القصص المفضلة',
            image: 'images/image33.png',
            onTap: () {
              Navigator.of(context).pushNamed('faivoretPage');
            },
          ),
          Selector<DataManager, List<Map<String, dynamic>>>(
            selector: (context, prof) => prof.getDitalsSound,
            builder: (context, dataManager, child) {
              return CategoryCard(
                title: 'قصص صوتية',
                image: 'images/image44.jpg',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          SoundPage(ditalsSounds: dataManager),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  const CategoryCard(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(image, height: 190),
            ),
            Text(title, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(180),
              child: Image.asset('images/fordrawer.jpg'),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.nightlight_outlined),
                    SizedBox(width: 8),
                    Text('dark mode', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FaivoretPage(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.favorite_border_rounded),
                    SizedBox(width: 8),
                    Text('favorite storys',
                        style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


