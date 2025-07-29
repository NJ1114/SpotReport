import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:SpotReport/model/app_state.dart';
import 'package:SpotReport/model/theme.dart';
import 'package:SpotReport/screens/login_screens/login_register.dart';
import 'package:SpotReport/spotreport.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //--- Firebase initialiser ---
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        //--- Light Theme ---
        theme: myLightThemeScheme,
        //--- Dark Theme ---
        darkTheme: myDarkThemeScheme,
        
        //--- App Functions/Opening ---
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              User? user = snapshot.data;
              if (user != null) {
                return const SpotReport();
              } else {
                return const UserLogRegScreen();
              }
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    ),
  );
}
