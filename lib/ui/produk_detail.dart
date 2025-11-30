import 'package:flutter/material.dart';
import 'package:tokokita/bloc/produk_bloc.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_form.dart';
import 'package:tokokita/ui/produk_page.dart';
import 'package:tokokita/widget/warning_dialog.dart';
import 'package:tokokita/widget/success_dialog.dart'; // <<< Tambahkan ini

// ignore: must_be_immutable
class ProdukDetail extends StatefulWidget {
  Produk? produk;
  ProdukDetail({Key? key, this.produk}) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Produk')),
      body: Center(
        child: Column(
          children: [
            Text(
              "Kode : ${widget.produk!.kodeProduk}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama : ${widget.produk!.namaProduk}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga : Rp. ${widget.produk!.hargaProduk.toString()}",
              style: const TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit(),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan tombol Edit dan Hapus
  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tombol Edit
        OutlinedButton(
          child: const Text("EDIT"),
          onPressed: () {
            // Navigasi ke ProdukForm untuk mode ubah
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProdukForm(produk: widget.produk!),
              ),
            );
          },
        ),

        // Tombol Hapus
        OutlinedButton(
          child: const Text("DELETE"),
          onPressed: () => confirmHapus(), // Memanggil dialog konfirmasi
        ),
      ],
    );
  }

  // Fungsi untuk menampilkan dialog konfirmasi hapus dan memanggil Bloc
  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
        // tombol hapus (Ya)
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () {
            // TUTUP DIALOG KONFIRMASI (LANGKAH 1)
            Navigator.pop(context);

            // Panggil fungsi delete dari ProdukBloc
            ProdukBloc.deleteProduk(id: int.parse(widget.produk!.id!)).then(
              (value) {
                // Jika sukses (value == true), tampilkan dialog sukses
                if (value == true) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => SuccessDialog(
                      description: "Hapus produk berhasil!",
                      // Navigasi setelah OK diklik di dialog sukses
                      okClick: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const ProdukPage(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  );
                } else {
                  // Jika delete gagal, tapi tidak melempar exception (value == false)
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => const WarningDialog(
                      description: "Hapus gagal, coba periksa database.",
                    ),
                  );
                }
              },
              onError: (error) {
                // Jika gagal karena error jaringan/API (exception dilempar)
                showDialog(
                  context: context,
                  builder: (BuildContext context) => const WarningDialog(
                    description: "Hapus gagal, ada masalah koneksi/server.",
                  ),
                );
              },
            );
          },
        ),

        // tombol batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context), // Menutup dialog
        ),
      ],
    );
    // Menampilkan dialog
    showDialog(builder: (context) => alertDialog, context: context);
  }
}
