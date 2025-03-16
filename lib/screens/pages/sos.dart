import 'package:city_spectors/providers/locationprovider.dart';
import 'package:city_spectors/providers/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Sos extends StatelessWidget {
  Sos({super.key});

  final TextEditingController sosdescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context
            .watch<LocationProvider>()
            .currentLocation!
            .longitude
            .toString()),
        centerTitle: true,
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).primaryColorDark,
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
                    "Help Signal Recieved...!!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Someoene will be here in 10 minutes",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25.0, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Add details",
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
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20.0, top: 10),
              child: TextField(
                maxLines: 5,
                minLines: 3,
                controller: sosdescription,
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
                    print(sosdescription.text);
                    sosdescription.clear();
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
                              color: context.watch<ThemeProvider>().darkmode
                                  ? Colors.black
                                  : Colors.white,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
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
