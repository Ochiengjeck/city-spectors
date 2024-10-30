import 'package:city_spectors/models/crimes_card.dart';
import 'package:city_spectors/providers/locationprovider.dart';
import 'package:city_spectors/screens/pages/report.dart';
import 'package:city_spectors/screens/pages/sos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final Map<String, String> crimes = {
  "Traffic Offence": "assets/images/traffic-light.png",
  "Traffic Accident": "assets/images/car-accident.png",
  "Theft": "assets/images/theft.png",
  "Vandalism": "assets/images/tire.png",
  "Violence": "assets/images/school.png",
  "Fraud": "assets/images/fraud.png",
  "Drug Offence": "assets/images/weed.png",
  "Murder": "assets/images/murderer.png",
  "Others": "assets/images/handcuffs.png"
};

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.watch<LocationProvider>().currentLocation?.longitude !=
                null
            ? Text(
                "${context.watch<LocationProvider>().currentLocation?.longitude}")
            : CircularProgressIndicator(),
        centerTitle: true,
        foregroundColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).primaryColorDark,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_active))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Center(
                child: ClipOval(
                  child: GestureDetector(
                    onLongPress: () {
                      print("SOS initialized");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Sos(),
                        ),
                      );
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 237, 13, 13)),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "SOS",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 25.0),
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 129, 131, 132),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.info,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: const Text(
                    "Press for a few seconds in case of mortal danger",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                children: crimes.entries.map(
                  (entry) {
                    return GestureDetector(
                      onTap: () {
                        print(entry.key);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Report(crime: entry.key),
                          ),
                        );
                      },
                      child: CrimesCard(
                          image: entry.value, description: entry.key),
                    );
                  },
                ).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                bottom: 10,
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 80,
                    child: const Text(
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      "Video Call from the accident scene",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 40.0,
                bottom: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 80,
                    child: const Text(
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      "Allow the officer to see what is happening and take the approprite responce",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: TextButton(
                  onPressed: () {
                    print("Video call inialized");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 80,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            20,
                          ),
                        ),
                        color: Theme.of(context).colorScheme.tertiary),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Video Call",
                          textAlign: TextAlign.center,
                          style: TextStyle(
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
