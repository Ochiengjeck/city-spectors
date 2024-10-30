import 'package:city_spectors/main.dart';
import 'package:city_spectors/providers/themeprovider.dart';
import 'package:city_spectors/screens/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Report extends StatelessWidget {
  final String crime;
  Report({super.key, required this.crime});

  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(crime),
        centerTitle: true,
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).primaryColorDark,
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
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Provide a description",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                maxLines: 5,
                minLines: 3,
                controller: description,
                decoration: const InputDecoration(
                  focusColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.file_upload,
                    )),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Upload a file or video",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 5),
              child: TextButton(
                  onPressed: () {
                    print(description.text);
                    description.clear();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            20,
                          ),
                        ),
                        color: context.watch<ThemeProvider>().darkmode
                            ? Theme.of(context).colorScheme.tertiary
                            : Theme.of(context).primaryColorDark),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Submit",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            letterSpacing: 2,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: context.watch<ThemeProvider>().darkmode
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
