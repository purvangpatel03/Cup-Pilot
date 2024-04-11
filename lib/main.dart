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
      apiKey: 'your Api key',
      appId: 'your app id',
      messagingSenderId: 'your messagingSenderId',
      projectId: 'your projectId',
      storageBucket: 'your storageBucket',
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
