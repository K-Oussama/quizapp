import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:quizapp/routes.dart';
// import 'package:quizapp/services/services.dart';
// import 'package:quizapp/shared/shared.dart';
import 'package:quizapp/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          // Error screen
          return const Text('Error: ');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: true,
              routes: appRoutes,
              theme: appTheme,
          );
          //return StreamProvider(
          //  create: (_) => FirestoreService().streamReport(),
          //  catchError: (_, err) => Report(),
          //  initialData: Report(),
          //  child: MaterialApp(
          //      debugShowCheckedModeBanner: true,
          //      routes: appRoutes,
          //      theme: appTheme),
          //);
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Directionality(
          textDirection: TextDirection.ltr, // or TextDirection.rtl if your app supports right-to-left languages
          child: Text('Loading'),
          );
        //return const MaterialApp(home: LoadingScreen());
      },
    );
  }
}