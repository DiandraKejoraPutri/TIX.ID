import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'tiket.dart';
import 'dash.dart';

void main() {
  runApp(Tiket());
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationPage(),
 );
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar TIX ID'),
        titleTextStyle : TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NAMA LENGKAP',
              style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 5, 39, 66)),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Nama Lengkap',
              ),
            ),
            SizedBox(height: 15),
            Text(
              'NOMOR HANDPHONE',
              style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 5, 39, 66)),
            ),
            Row(
              children: [
                Text(
                  '+62',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: '81234567890',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashPage()),
                  );
                
                  String name = _nameController.text;
                  String phone = _phoneController.text;
                  if (name.isNotEmpty && phone.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Pendaftaran berhasil!'),
                    ));

                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Isi seluruh data!'),
                    ));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 7, 33, 72),
                  padding:
                      EdgeInsets.symmetric(horizontal: 250, vertical: 15 ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      ),
                ),
                child: Text(
                  'Daftar TIX ID',
                  style: TextStyle(fontSize: 16, color:Colors.white ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
