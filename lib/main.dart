import 'package:coffee/provider/cart_provider.dart';
import 'package:coffee/provider/item_provider.dart';
import 'package:coffee/provider/order_provider.dart';
import 'package:coffee/provider/user_provider.dart';
import 'package:coffee/screens/login_and_signup/login/login_page.dart';
import 'package:coffee/screens/main/main_screen.dart';
import 'package:coffee/theme/my_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDs56tS4vKd6TD-xCyVB1WC6I4kTMmaeHA',
      appId: '1:917221170864:android:deb9201468fd25bf7e2575',
      messagingSenderId: '917221170864',
      projectId: 'coffee-app-6e499',
      storageBucket: 'coffee-app-6e499.appspot.com',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => CartProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => OrderProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => ItemProvider(),
          ),
        ],
        builder: (context, child) {
          return MaterialApp(
            title: 'Coffee',
            debugShowCheckedModeBanner: false,
            theme: myTheme,
            home: StreamBuilder<User?>(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return const MainScreen();
                  } else {
                    return LoginPage();
                  }
                }),
          );
        });
  }
}
