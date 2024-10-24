import 'package:flutter/material.dart';

class Stations extends StatelessWidget {
  const Stations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).primaryColorDark,
        title: const Text("Police Stations"),
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
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20.0, top: 10, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Search for a Police Station",
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SearchBar(
                textStyle: WidgetStatePropertyAll(TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                )),
                leading: const Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Icon(Icons.search),
                ),
                hintText: "Accident location",
                hintStyle: WidgetStatePropertyAll(TextStyle(
                  color: Theme.of(context).hintColor,
                  fontStyle: FontStyle.italic,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width - 40,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      20,
                    ),
                  ),
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                child: const Center(
                  child: Text(
                    "MAP",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Image(
                  //     image: AssetImage("assets/images/criminal1.png"),),
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    "Police Station Location",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
