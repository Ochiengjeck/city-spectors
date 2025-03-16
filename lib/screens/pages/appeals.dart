import 'package:flutter/material.dart';
// import 'package:scrollable_tab_view/scrollable_tab_view.dart';

class Appeals extends StatefulWidget {
  const Appeals({super.key});

  @override
  State<Appeals> createState() => _AppealsState();
}

class _AppealsState extends State<Appeals> {
  final List<String> tabNames = ["Complete", "In Progress"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Appeals"),
        backgroundColor: Theme.of(context).primaryColorDark,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Handle notifications action
              print("Notifications Clicked");
            },
            icon: const Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      //     child:
      //         Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //       ScrollableTab(
      //         labelColor: Colors.white,
      //         unselectedLabelColor: Colors.grey.shade400,
      //         indicatorColor: Theme.of(context).primaryColor,
      //         tabs: tabNames
      //             .map((name) => Text(
      //                   name,
      //                   style: TextStyle(
      //                     fontSize: 24,
      //                   ),
      //                 ))
      //             .toList(),
      //         children: const [
      //           // Complete
      //           Padding(
      //             padding: EdgeInsets.only(top: 30.0),
      //             child: Center(
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(
      //                     Icons.check_circle_outline,
      //                     size: 80,
      //                     color: Colors.green,
      //                   ),
      //                   SizedBox(height: 10),
      //                   Text(
      //                     "No completed appeals yet.",
      //                     style: TextStyle(
      //                       fontSize: 16,
      //                       color: Colors.grey,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),

      //           //In Progress
      //           Padding(
      //             padding: EdgeInsets.only(top: 30.0),
      //             child: Center(
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   Icon(
      //                     Icons.pending_actions,
      //                     size: 80,
      //                     color: Colors.blue,
      //                   ),
      //                   SizedBox(height: 10),
      //                   Text(
      //                     "No ongoing appeals currently.",
      //                     style: TextStyle(fontSize: 16, color: Colors.grey),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         ],
      //       ),
      //       const Padding(
      //         padding: const EdgeInsets.only(top: 10.0),
      //         child: Text(
      //           "Make an Appeal",
      //           style: TextStyle(
      //             fontWeight: FontWeight.bold,
      //             fontSize: 20,
      //           ),
      //         ),
      //       ),
      //       const Padding(
      //         padding: EdgeInsets.only(top: 10.0),
      //         child: Text("Reason for application"),
      //       ),
      //       TextField(
      //         decoration: InputDecoration(
      //           suffixIcon: IconButton(
      //               onPressed: () {}, icon: const Icon(Icons.navigate_next)),
      //           filled: true,
      //         ),
      //       ),
      //       const Padding(
      //         padding: EdgeInsets.only(top: 10.0),
      //         child: Text("Description"),
      //       ),
      //       const TextField(
      //         minLines: 5,
      //         maxLines: 10,
      //         decoration: InputDecoration(
      //           filled: true,
      //         ),
      //       ),
      //     ]),
      //   ),
      // ),
    );
  }
}
