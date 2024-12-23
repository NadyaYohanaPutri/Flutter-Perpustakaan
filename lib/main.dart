import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'home_page.dart'; // Make sure this import is correct

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Supabase.initialize(
    url: 'https://tywovkcdokcqfpzrduvs.supabase.co', // Keep this secure
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR5d292a2Nkb2tjcWZwenJkdXZzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE1NTM5NjcsImV4cCI6MjA0NzEyOTk2N30.ZUpZH52lCz8jzk6VJ0chfU6a3Wtljgj5Z3JsjqTwlcI',  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Library',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.lightBlue[50],
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const BookListPage(),  // Ensure BookListPage is imported correctly
      debugShowCheckedModeBanner: false,
    );
  }
}
