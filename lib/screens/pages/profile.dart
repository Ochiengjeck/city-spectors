import 'package:city_spectors/providers/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool pushvalue = false;

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

    return Scaffold(
        backgroundColor: greyish,
        // appBar: AppBar(
        //   title: const Text("Account Profile"),
        //   centerTitle: true,
        // ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.watch<ThemeProvider>().darkmode
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 80.0,
                  left: 20,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          size: 50,
                          color: textcolor,
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                            color: textcolor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 120.0,
                left: 20,
                right: 20,
              ),
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    currentAccountPicture: ClipOval(
                      child: Image.asset(
                        "assets/images/criminal2.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    accountName: Text(
                      "Username",
                      style: TextStyle(color: textcolor),
                    ),
                    accountEmail: Text(
                      "example@gmail.com",
                      style: TextStyle(color: textcolor),
                    ),
                    decoration: BoxDecoration(
                      color: whitish,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: whitish,
                    ),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 40,
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Account Profile",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListTile(
                          title: Text(
                            "Edit Profile",
                            style: TextStyle(
                              color: textcolor,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.navigate_next),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Change Password",
                            style: TextStyle(
                              color: textcolor,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.navigate_next),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Add Payment Method",
                            style: TextStyle(color: textcolor),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Push Notification",
                            style: TextStyle(
                              color: textcolor,
                            ),
                          ),
                          trailing: Switch(
                            value: pushvalue,
                            onChanged: (value) {
                              setState(() {
                                pushvalue = !pushvalue;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Dark Mode",
                            style: TextStyle(
                              color: textcolor,
                            ),
                          ),
                          trailing: Switch(
                            value: context.watch<ThemeProvider>().darkmode,
                            onChanged: (value) {
                              context.read<ThemeProvider>().ChangeMode();
                            },
                          ),
                        ),
                        const Divider(
                          height: 20,
                          color: Colors.grey,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "More",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ListTile(
                          title: Text(
                            "About Us",
                            style: TextStyle(
                              color: textcolor,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.navigate_next),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "Privacy Policy",
                            style: TextStyle(
                              color: textcolor,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.navigate_next),
                          ),
                        ),
                        const Divider(
                          height: 20,
                          color: Colors.grey,
                        ),
                        ListTile(
                          title: const Text(
                            "Log Out",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.logout),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
