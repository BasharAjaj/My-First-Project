// import 'package:flutter/material.dart';
// import 'package:flutter_application_7/Component/datamanager.dart';
// import 'package:provider/provider.dart';

// import 'package:share/share.dart';
// import 'package:flutter/services.dart';

// class DetailsPage extends StatefulWidget {
//   final Map<String, dynamic> story;
//   const DetailsPage({super.key, required this.story});

//   @override
//   State<DetailsPage> createState() => _DetailsPageState();
// }

// class _DetailsPageState extends State<DetailsPage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//           selectedItemColor: Theme.of(context).iconTheme.color,
//           unselectedItemColor: Theme.of(context).iconTheme.color,
//           items: [
//             BottomNavigationBarItem(
//               icon: IconButton(
//                 icon: const Icon(
//                   Icons.share,
//                 ),
//                 onPressed: () {
//                   Share.share('${widget.story}');
//                 },
//               ),
//               label: 'share',
//             ),
//             BottomNavigationBarItem(
//               icon: IconButton(
//                 icon: const Icon(Icons.copy),
//                 onPressed: () {
//                   Clipboard.setData(
//                       ClipboardData(text: widget.story['description']));
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                       backgroundColor: Color.fromARGB(255, 19, 93, 154),
//                       content: Text(
//                         'تم نسخ النص!',
//                         style: TextStyle(color: Colors.red),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               label: 'copy',
//             )
//           ]),
//       appBar: AppBar(
//         centerTitle: Theme.of(context).appBarTheme.centerTitle,
//         backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
//         titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
//         title: Text(widget.story['title']),
//         actions: [
//           Consumer<DataManager>(builder: (context, datamanager, child) {
//             return IconButton(
//                 onPressed: () {
//                   datamanager.toggleFavorite(widget.story);
//                 },
//                 icon: Icon(
//                   datamanager.isFavorite(widget.story)
//                       ? Icons.favorite
//                       : Icons.favorite_border_outlined,
//                   size: 25,
//                 ));
//           })
//         ],
//       ),
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: InteractiveViewer(
//               boundaryMargin: const EdgeInsets.all(20.0),
//               minScale: 0.5,
//               maxScale: 4.0,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.story['title'],
//                     style: const TextStyle(
//                         fontSize: 24, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 16),
//                   Text(widget.story['description'], textAlign: TextAlign.end),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutter_application_7/Component/datamanager.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/services.dart';

class DetailsPage extends StatefulWidget {
  final Map<String, dynamic> story;
  const DetailsPage({super.key, required this.story});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).iconTheme.color,
        unselectedItemColor: Theme.of(context).iconTheme.color,
        items: [
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                Share.share(widget.story['description'] ?? 'No description available');
              },
            ),
            label: 'Share',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () {
                Clipboard.setData(
                  ClipboardData(text: widget.story['description']),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    backgroundColor: Color.fromARGB(255, 19, 93, 154),
                    content: Text(
                      'تم نسخ النص!',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                );
              },
            ),
            label: 'Copy',
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        title: Text(widget.story['title']),
        actions: [
          Consumer<DataManager>(builder: (context, datamanager, child) {
            return IconButton(
              onPressed: () {
                datamanager.toggleFavorite(widget.story);
              },
              icon: Icon(
                datamanager.isFavorite(widget.story)
                    ? Icons.favorite
                    : Icons.favorite_border_outlined,
                size: 25,
              ),
            );
          })
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(20.0),
              minScale: 0.5,
              maxScale: 4.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.story['title'],
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.story['description'],
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}