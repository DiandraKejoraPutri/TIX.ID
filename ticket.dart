import 'package:coba/widgets/menu_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'tiket.dart';
import 'pendaftaran.dart';
import 'dash.dart';

void main() {
  runApp(Tiket());
}

class BioskopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TicketPage(),
    );
  }
}

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Film Bioskop"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Sedang Tayang"),
            Tab(text: "Akan Datang"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildFilmGrid(sedangTayang),
          buildFilmGrid(akanDatang),
        ],
      ),
      bottomNavigationBar: MenuBottom(2),
    );
  }


  Widget buildFilmGrid(List<Map<String, dynamic>> films) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.7, 
      ),
      itemCount: films.length,
      itemBuilder: (context, index) {
        final film = films[index];
        return buildFilmCard(film);
      },
    );
  }

  Widget buildFilmCard(Map<String, dynamic> film) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.asset(
                film['image'],
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              film['title'],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "${film['genre']} • ${film['rating']}",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, dynamic>> sedangTayang = [
  {
    "image": "assets/poster 1.jpg",
    "title": "Bila Esok Ibu Tiada",
    "genre": "Drama, Keluarga",
    "rating": "9.2",
  },
  {
    "image": "assets/poster 2.jpeg",
    "title": "Santet Segoro Pitu",
    "genre": "Horror",
    "rating": "9.0",
  },
  {
    "image": "assets/poster 3.jpeg",
    "title": "Gladiator II",
    "genre": "Action, Adventure",
    "rating": "9.5",
  },
  {
    "image": "assets/poster 4.jpeg",
    "title": "Red One",
    "genre": "Action, Adventure",
    "rating": "9.3",
  },
];

final List<Map<String, dynamic>> akanDatang = [
  {
    "image": "assets/icon 1.jpg",
    "title": "Film Akan Datang 1",
    "genre": "Drama",
    "rating": "8.5",
  },
  {
    "image": "assets/icon 4.jpeg",
    "title": "Film Akan Datang 2",
    "genre": "Action",
    "rating": "8.8",
  },
];


