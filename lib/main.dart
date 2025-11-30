import 'package:flutter/material.dart';
import 'package:tokokita/helpers/user_info.dart';
import 'package:tokokita/ui/login_page.dart';
import 'package:tokokita/ui/produk_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Variabel untuk menahan widget halaman yang akan ditampilkan (default: loading)
  Widget page = const CircularProgressIndicator();

  @override
  void initState() {
    super.initState();
    isLogin(); // Panggil fungsi cek login saat widget dibuat
  }

  // Fungsi untuk memeriksa apakah pengguna sudah login
  void isLogin() async {
    var token = await UserInfo()
        .getToken(); // Ambil token dari SharedPreferences
    if (token != null) {
      // Jika token ada, set halaman ke ProdukPage
      setState(() {
        page = const ProdukPage();
      });
    } else {
      // Jika token tidak ada, set halaman ke LoginPage
      setState(() {
        page = const LoginPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Kita',
      debugShowCheckedModeBanner: false,
      // Tambahkan tema biru yang sudah diperbaiki sebelumnya
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(primary: Colors.blue),
        useMaterial3: false,
      ),
      home: page, // Tampilkan halaman yang sudah ditentukan
    );
  }
}
