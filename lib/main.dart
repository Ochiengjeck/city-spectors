import 'package:city_spectors/models/theme.dart';
import 'package:city_spectors/providers/locationprovider.dart';
import 'package:city_spectors/providers/themeprovider.dart';
import 'package:city_spectors/screens/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures all bindings are initialized

  // Run your location setup code here, before starting the app
  final locationProvider = LocationProvider();

  runApp(MyApp(
      locationProvider: locationProvider)); // Pass location provider if needed
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required LocationProvider locationProvider});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
        )
      ],
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: context.watch<ThemeProvider>().darkmode
              ? AppTheme.darkTheme
              : AppTheme.lightTheme,
          home: const Index(),
        );
      },
    );
  }
}
