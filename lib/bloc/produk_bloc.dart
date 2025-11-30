import 'dart:convert';
import 'package:tokokita/helpers/api.dart';
import 'package:tokokita/helpers/api_url.dart';
import 'package:tokokita/model/produk.dart';

class ProdukBloc {
  // Fungsi untuk mengambil daftar semua produk (Read - List)
  static Future<List<Produk>> getProduks() async {
    String apiUrl = ApiUrl.listProduk;
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);

    // Mengambil list produk dari kunci 'data' pada response JSON
    List<dynamic> listProduk = (jsonObj as Map<String, dynamic>)['data'];
    List<Produk> produks = [];

    // Melakukan iterasi dan mapping dari JSON ke Model Produk
    for (int i = 0; i < listProduk.length; i++) {
      produks.add(Produk.fromJson(listProduk[i]));
    }
    return produks;
  }

  // Fungsi untuk menambahkan produk baru (Create)
  static Future addProduk({Produk? produk}) async {
    String apiUrl = ApiUrl.createProduk;
    var body = {
      "kode_produk": produk!.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.hargaProduk.toString(),
    };
    var response = await Api().post(apiUrl, body);
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  // Fungsi untuk mengubah data produk (Update)
  static Future updateProduk({required Produk produk}) async {
    // Menggunakan ID produk untuk membuat URL endpoint update
    String apiUrl = ApiUrl.updateProduk(int.parse(produk.id!));
    print(apiUrl);

    var body = {
      "kode_produk": produk.kodeProduk,
      "nama_produk": produk.namaProduk,
      "harga": produk.hargaProduk.toString(),
    };
    print("Body : $body");

    // Menggunakan put() dan mengkonversi body ke JSON string
    var response = await Api().put(apiUrl, jsonEncode(body));
    var jsonObj = json.decode(response.body);
    return jsonObj['status'];
  }

  // Fungsi untuk menghapus produk (Delete)
  static Future<bool> deleteProduk({int? id}) async {
    String apiUrl = ApiUrl.deleteProduk(id!);
    var response = await Api().delete(apiUrl);
    var jsonObj = json.decode(response.body);
    // Mengembalikan nilai boolean status penghapusan
    return (jsonObj as Map<String, dynamic>)['status'] ?? false;
  }
}
