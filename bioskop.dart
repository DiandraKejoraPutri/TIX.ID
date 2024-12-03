import 'package:coba/widgets/menu_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'tiket.dart';
import 'pendaftaran.dart';
import 'dash.dart';

void main() {
  runApp(Tiket());
}

class Bioskop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BioskopPage(),
    );
  }
}

class BioskopPage extends StatefulWidget {
  @override
  _BioskopPageState createState() => _BioskopPageState();
}


class _BioskopPageState extends State<BioskopPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Map<String, dynamic>> _bioskopList = [
    {"name": "AEON MALL JGC CGV", "isFavorite": false},
    {"name": "AEON MALL TANJUNG BARAT XXI", "isFavorite": false},
    {"name": "AGORA MALL IMAX", "isFavorite": false},
    {"name": "AGORA MALL PREMIERE", "isFavorite": false},
    {"name": "AGORA MALL XXI", "isFavorite": false},
    {"name": "ARION XXI", "isFavorite": false},
    {"name": "ARTHA GADING XXI", "isFavorite": false},
    {"name": "BASSURA XXI", "isFavorite": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey),
                SizedBox(width: 5),
                Text(
                  'JAKARTA',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.arrow_drop_down, color: Colors.grey),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Color(0xFFF9F9F9),
            child: Row(
              children: [
                Icon(Icons.star_border, color: Colors.orange),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Tandai bioskop favoritmu! Bioskop favoritmu akan berada paling atas pada daftar ini dan pada jadwal film.',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Mengerti',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _bioskopList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(
                    _bioskopList[index]['isFavorite']
                        ? Icons.star
                        : Icons.star_border,
                    color: _bioskopList[index]['isFavorite']
                        ? Colors.orange
                        : Colors.grey,
                  ),
                  title: Text(
                    _bioskopList[index]['name'],
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    setState(() {
                      _bioskopList[index]['isFavorite'] =
                          !_bioskopList[index]['isFavorite'];
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: MenuBottom(1),
    );
  }
}
