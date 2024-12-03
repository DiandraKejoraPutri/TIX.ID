import 'package:coba/widgets/menu_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'tiket.dart';
import 'pendaftaran.dart';
import 'dash.dart';

void main() {
  runApp( Tiket());
}

class Ticket extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TicketkuPage(),
    );
  }
}

class TicketkuPage extends StatefulWidget { 
   @override
  _TicketkuPageState createState() => _TicketkuPageState();
}

class _TicketkuPageState extends State<TicketkuPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> movies = [
      {
        'title': 'GLADIATOR II',
        'image': 'assets/banner 3.jpg',
        'rating': 9.5,
        'genre': 'Action, Adventure',
        'ageRating': '17+',
      },
      {
        'title': 'RED ONE',
        'image': 'assets/banner 2.jpg',
        'rating': 9.3,
        'genre': 'Action, Adventure',
        'ageRating': '13+',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'TIX ID',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: Colors.black),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "JAKARTA",
                  prefixIcon: const Icon(Icons.location_on, color: Colors.grey),
                  ),
                ),
              ),
            

            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return _buildMovieCard(movie);
                },
              ),
            ),
          ],
        ),
      ),
      
     bottomNavigationBar: MenuBottom(3),
    );
  }
  

  Widget _buildMovieCard(Map<String, dynamic> movie) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              movie['image'],
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  movie['genre'],
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '${movie['ageRating']}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    Text(
                      '${movie['rating']}',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}