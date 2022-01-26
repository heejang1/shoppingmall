import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Account/screen/update/reauth.dart';
import 'Account/screen/update/update_email.dart';
import 'BottomNavBar/TapPage.dart';
import 'colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        ReAuth.routeName: (context) => const ReAuth(),
      },
      title: 'SCENTSAY',
      theme: ThemeData(
        primaryColorDark: Colors.black,
        primarySwatch: primaryBlack,
      ),
      home: const TabPage(),
    );
  }
}
