import 'package:coba/bioskop.dart';
import 'package:coba/ticket.dart';
import 'package:coba/ticketku.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'tiket.dart';
import 'pendaftaran.dart';

void main() {
  runApp(Tiket());
}

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashPage(),
    );
  }
}

class DashPage extends StatefulWidget {
  @override
  _DashPageState createState() => _DashPageState();
}

@override
  State<DashPage> createState() => _DashPageState();

class _DashPageState extends State<DashPage> {
  int _currentIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Cari di TIX ID',
            prefixIcon: Icon(Icons.search, color: Colors.black),
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle_outlined, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.location_on, color: Colors.grey),
                  SizedBox(width: 5),
                  Text('JAKARTA',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Icon(Icons.arrow_drop_down, color: Colors.grey),
                ],
              ),
            ),
            Container(
              height: 400,
              child: PageView(
                children: [
                  Image.asset('assets/banner 4.jpg', fit: BoxFit.fill),
                  Image.asset('assets/banner 2.jpg', fit: BoxFit.fill),
                  Image.asset('assets/banner 3.jpg', fit: BoxFit.fill),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Sedang Tayang',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text('Semua',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 0, 53, 96))),
                  Icon(Icons.arrow_right),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  
                    _buildFilterButton("Semua Film"),
                    const SizedBox(width: 10),
                    _buildFilterButton("XXI"),
                    const SizedBox(width: 10),
                    _buildFilterButton("CGV"),
                    const SizedBox(width: 10),
                    _buildFilterButton("Cinépolis"),
                    const SizedBox(width: 10),
                    _buildFilterButton("Watchlist"),
                  ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 550,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildMovieCard('assets/poster 1.jpg', 'WARKOP DKI'),
                      buildMovieCard('assets/poster 2.jpeg', 'JATUH CINTA'),
                      buildMovieCard('assets/poster 3.jpeg', 'PERAHU'),
                      buildMovieCard('assets/poster 4.jpeg', 'LEMBAYUNG'),
                      buildMovieCard('assets/poster 5.jpeg', 'THE WALK'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Film ini dapat rating ⭐9,2 dari penonton lho! Harus ditonton nih",
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Spotlight",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Berita hiburan terhangat untuk anda!",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(height: 5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildSpotlightCard(
                            'assets/film 1.jpg', 'TIX AVANGERS'),
                        buildSpotlightCard(
                            'assets/film 2.webp', 'TOP 10 BEST MOVIES'),
                        buildSpotlightCard(
                            'assets/film 3.jpg', 'TOP THRILLER'),
                        buildSpotlightCard(
                            'assets/film 4.jpeg', 'BURNT BEST'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
              children:[
                 Text('TIX Now',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text('Semua',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 0, 53, 96))),
                  Icon(Icons.arrow_right),
                 SizedBox(width: 8),
              ],
              ),
            ),
            
              const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Update berita terbaru seputar dunia film",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                      textAlign: TextAlign.start,
                    ),
                    ),
                  ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                buildNewsCard( 'assets/icon 1.jpg',"'Film legendaris" , "Berita seputar dunia film","2 jam lalu"),
                buildNewsCard( 'assets/icon 2.webp', "Sherina 'Mission: Impossible 8'", " Dupe film yang lama", "3 hari lalu"),
                buildNewsCard('assets/icon 3.webp',"Lari Dari Kenyataan'","Kisah nyata","4 hari lalu"),
                buildNewsCard('assets/icon 4.jpeg',"Mariposa","Film top dan seru yg memiliki kisah romantis","5 hari lalu"),
              ],
            ),
          ],
        ),
      ),

      //widget widgetnya
    
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          switch(index) {
            case 0 :
            break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bioskop()),
              );
            break;
            case 2:
            Navigator.push(
                 context,
               MaterialPageRoute(builder: (context) => TicketPage()),
            );
            break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>TicketkuPage ()),
              );
              break;  
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Bioskop'),
          BottomNavigationBarItem(icon: Icon(Icons.local_activity), label: 'Ticket'),
          BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket_sharp), label: 'Ticketku'),
        ],
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildFilterButton(String label) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        side: BorderSide(color: Color.fromARGB(255, 26, 117, 236)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

Widget buildMovieCard(String imagePath, String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Container(
          width: 300,
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 8),
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

Widget buildSpotlightCard(String imagePath, String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              height: 200,
              width: 500,
            ),
          ),
          SizedBox(height: 8),
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}

Widget buildNewsCard(String imagePath, String title, String subtitle, String time) {
  return Card(
    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
    child: ListTile(
      leading: Image.asset(
        imagePath,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          print('Error loading image: $imagePath');
          return Icon(Icons.image_not_supported, color: Colors.grey);
             },
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('$subtitle • $time'),
    ),
  );
}
