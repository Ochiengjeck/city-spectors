import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'package:city_spectors/providers/themeprovider.dart';

final Map<String, String> staticCriminals = {
  "John Doe": "assets/images/criminal1.png",
  "Jene Doe": "assets/images/criminal2.png",
  "Paul Blue": "assets/images/criminal3.png",
  "Brenda Strong": "assets/images/criminal4.png",
  "Steven Cliff": "assets/images/criminal5.png",
  "Lizz Ivy": "assets/images/criminal6.png",
};

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  final String apiKey = "0e41972c0d80449eb05cf21121ec93ed";
  final String criminalsUrl = "https://api.fbi.gov/wanted/v1/list";
  final String apiUrl =
      "https://newsapi.org/v2/everything?q=police&from=2024-11-08&sortBy=publishedAt&language=en&apiKey=";

  late Future<List<dynamic>> _news;
  late Future<List<dynamic>> _criminals;

  int numberofnews = 5;

  @override
  void initState() {
    super.initState();
    _news = fetchNews();
    _criminals = fetchCriminals();
  }

  Future<List<dynamic>> fetchNews() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl$apiKey'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['articles'];
      } else {
        throw Exception("Failed to load news");
      }
    } catch (e) {
      print("Error fetching news: $e");
      return [];
    }
  }

  Future<List<dynamic>> fetchCriminals() async {
    try {
      final response = await http.get(Uri.parse(criminalsUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data["items"];
      } else {
        throw Exception("Failed to load criminals");
      }
    } catch (e) {
      print("Error fetching criminals: $e");
      return [];
    }
  }

  void moreNews() {
    setState(() {
      numberofnews += 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color whitish = context.watch<ThemeProvider>().darkmode
        ? const Color.fromARGB(255, 21, 21, 21)
        : const Color.fromARGB(255, 255, 255, 255);
    Color greyish = context.watch<ThemeProvider>().darkmode
        ? const Color.fromARGB(255, 56, 56, 56)
        : const Color.fromARGB(255, 214, 199, 199);
    Color textcolor = context.watch<ThemeProvider>().darkmode
        ? const Color.fromARGB(255, 255, 255, 255)
        : const Color.fromARGB(255, 0, 0, 0);
    Color linkcolor = context.watch<ThemeProvider>().darkmode
        ? Theme.of(context).primaryColor
        : const Color.fromARGB(255, 43, 39, 237);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Information Hub"),
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).primaryColorDark,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Wanted",
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                        color: textcolor),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "All criminals..",
                        style: TextStyle(color: linkcolor),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FutureBuilder<List<dynamic>>(
                future: _criminals,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text("No criminal data available."));
                  } else {
                    return Container(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final criminal = snapshot.data![index];
                          return GestureDetector(
                            onTap: () {
                              print(criminal['title']
                                  .split(' ')
                                  .take(2)
                                  .join(' '));
                            },
                            child: Column(
                              children: [
                                ClipOval(
                                  child: SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(
                                      criminal['images']?[0]['original'] ?? '',
                                      fit: BoxFit.fill,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Icon(Icons.person),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    criminal['title']
                                            .split(' ')
                                            .take(2)
                                            .join(' ') ??
                                        'Unknown',
                                    style: TextStyle(
                                        color: textcolor,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Police News",
                style: TextStyle(
                    fontSize: 20,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    color: textcolor),
              ),
            ),
            FutureBuilder<List<dynamic>>(
              future: _news,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No news available."));
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: numberofnews,
                    itemBuilder: (context, index) {
                      final news = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          left: 10,
                          right: 10,
                          bottom: 20,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            print(
                                "\n${news["publishedAt"].toString()} \n${news["title"]} \n${news["content"]}\n");
                          },
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 250,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: news['urlToImage'] != null
                                        ? Image.network(
                                            news['urlToImage'],
                                            fit: BoxFit.cover,
                                          )
                                        : const Icon(Icons.image),
                                  ),
                                  Text(
                                    news["publishedAt"]
                                        .toString()
                                        .split('T')
                                        .take(1)
                                        .join(),
                                    style: const TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  GridTile(
                                    child: Text(
                                      news["title"],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    news["content"],
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 12,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: moreNews,
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                      child: Text(
                        "More...",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
