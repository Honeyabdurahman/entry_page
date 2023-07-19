import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> previousSearchResults = [
    'Mulungu Beach',
    'Nyanza Sailing club',
    'Life camp Bwerenga',
    'Kalanoga resorts',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.search),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: previousSearchResults.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(previousSearchResults[index]),
                    trailing: Icon(Icons.history, color: Colors.teal,),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
