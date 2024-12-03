//script dasar
import 'package:coba/bioskop.dart';
import 'package:coba/ticketku.dart';
import 'package:flutter/material.dart';
import 'package:coba/tiket.dart';
import 'pendaftaran.dart';
import 'dash.dart';
import 'package:coba/views/homeview.dart';
import 'package:coba/views/loginview.dart';
import 'package:coba/views/movie_view.dart';
import 'package:coba/views/transaksiview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     home: Tiket(),

        initialRoute: '/',
        routes: {
        '/bioskop': (context) => Bioskop(),
        '/beranda': (context) => DashPage(),
        '/tiket': (context) => Ticket(), 
        '/tiketku': (context) => TicketkuPage(),
        // '/profile': (_) => ProfileView(),
       },
    );
  }
}
