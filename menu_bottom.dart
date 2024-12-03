import 'package:flutter/material.dart';

class MenuBottom extends StatefulWidget {
  int activePage;
  MenuBottom(this.activePage);

  @override
  State<MenuBottom> createState() => _MenuBottomState();
}

class _MenuBottomState extends State<MenuBottom> {
  int _selectedItem = 0;

  void getLink(index) {
    setState(() {
      _selectedItem = index;
    });
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/home');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/bioskop');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/tiket');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/tiketku');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => getLink(0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.home,
                  color: widget.activePage == 0 ? Colors.white : Colors.grey,
                ),
                Text(
                  'Beranda',
                  style: TextStyle(
                    color: widget.activePage == 0 ? Colors.white : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => getLink(1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_city,
                  color: widget.activePage == 1 ? Colors.white : Colors.grey,
                ),
                Text(
                  'Bioskop',
                  style: TextStyle(
                    color: widget.activePage == 1 ? Colors.white : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => getLink(2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.airplane_ticket,
                  color: widget.activePage == 2 ? Colors.white : Colors.grey,
                ),
                Text(
                  'Tiket',
                  style: TextStyle(
                    color: widget.activePage == 2 ? Colors.white : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => getLink(3),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.airplane_ticket_sharp,
                  color: widget.activePage == 3 ? Colors.white : Colors.grey,
                ),
                Text(
                  'Tiketku',
                  style: TextStyle(
                    color: widget.activePage == 3 ? Colors.white : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}