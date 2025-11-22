# 🛍️ TokoKita Mobile App (CRUD Flutter & CodeIgniter 4 API)

Aplikasi mobile toko sederhana yang dibangun menggunakan **Flutter** dan terintegrasi dengan **RESTful API** yang dibuat menggunakan **CodeIgniter 4**. Proyek ini bertujuan untuk mengimplementasikan dasar-dasar operasi CRUD (Create, Read, Update, Delete) dan otentikasi (Registrasi & Login) dalam pengembangan aplikasi mobile.

---

## Identitas
Nama  : Ayu Fitrianingsih
NIM  : H1D023038
Shift  : B/E

## Dokumentasi
<img width="1919" height="1007" alt="image" src="https://github.com/user-attachments/assets/e7210f47-abc5-4069-a410-f0105cb84eb8" />
<img width="1919" height="1009" alt="image" src="https://github.com/user-attachments/assets/ae3d7e27-fcb8-46f5-8d43-e9df3081fc75" />
<img width="1919" height="1007" alt="image" src="https://github.com/user-attachments/assets/5bec27c1-194e-4ab8-8eb5-21b2e2f42fec" />
<img width="1919" height="1007" alt="image" src="https://github.com/user-attachments/assets/18cfbca5-a2f7-412c-a49b-bc50701d1cea" />
<img width="1919" height="1005" alt="image" src="https://github.com/user-attachments/assets/c2e9ffe5-aabe-48ea-a631-215ee58f0d58" />
<img width="1919" height="1007" alt="image" src="https://github.com/user-attachments/assets/cd805dd5-9ba2-48f2-b482-5744ebb4b20d" />
<img width="1919" height="1010" alt="image" src="https://github.com/user-attachments/assets/8b2f9989-6c74-4468-b270-780b5a3020db" />

## ✨ Fitur Utama

* **Autentikasi Pengguna:**
    * **Registrasi:** Pendaftaran pengguna baru.
    * **Login:** Menggunakan email dan password untuk mendapatkan token.
* **Manajemen Produk (CRUD):**
    * Melihat **Daftar** semua produk.
    * **Menambah** produk baru (Create).
    * Melihat **Detail** produk.
    * **Mengubah** data produk (Update).
    * **Menghapus** produk (Delete).
* **Navigasi:** Drawer menu untuk Logout.
* **Validasi Formulir:** Validasi sisi klien pada form Registrasi dan Login.

---

## 🛠️ Teknologi yang Digunakan

### Frontend (Aplikasi Mobile)
| Teknologi | Keterangan |
| :--- | :--- |
| **Flutter** | Framework UI untuk membangun aplikasi multi-platform. |
| **Dart** | Bahasa pemrograman inti Flutter. |
| **`http` Package** | Untuk melakukan permintaan HTTP ke API. |
| **Provider/Bloc** | [State Management yang Anda gunakan, contoh: **Provider** / **Bloc**] |

### Backend (RESTful API)
| Teknologi | Keterangan |
| :--- | :--- |
| **CodeIgniter 4** | Framework PHP untuk membangun RESTful API. |
| **MySQL** | Database yang digunakan untuk menyimpan data produk dan pengguna. |
| **XAMPP** | Server lokal (Apache & MySQL) untuk menjalankan API. |

---

## ⚙️ Persyaratan Sistem

Pastikan lingkungan pengembangan Anda sudah terinstal:

1.  **Flutter SDK:** Versi [Isi dengan versi Flutter Anda, contoh: **3.22.6**].
2.  **Android Studio / VS Code:** Dengan plugin Flutter dan Dart.
3.  **XAMPP / Web Server:** Untuk menjalankan CodeIgniter 4 API.
4.  **PHP:** Versi [Isi dengan versi PHP Anda, contoh: **7.4+**].
5.  **Postman / Thunder Client:** Untuk menguji API.

---

## 🚀 Panduan Instalasi dan Menjalankan Proyek

### 1. Setup Backend (CodeIgniter 4 API)

1.  **Server Local:** Pastikan Apache dan MySQL sudah berjalan di XAMPP.
2.  **API Project:** Tempatkan folder `toko-api` (proyek CodeIgniter 4 Anda) di direktori `C:\xampp\htdocs\`.
3.  **Database:** Buat database bernama `toko_api` dan jalankan script SQL untuk membuat tabel `member`, `member_token`, dan `produk`.
    * *Keterangan*: Pastikan file konfigurasi database CodeIgniter 4 (`app/Config/Database.php`) sudah terhubung dengan database `toko_api`.
4.  **Uji Akses:** Coba akses API melalui browser atau Postman: `http://localhost/toko-api/public/registrasi`

### 2. Setup Frontend (Flutter App)

1.  **Clone Repositori:**
    ```bash
    git clone [https://github.com/ldclabs/anda](https://github.com/ldclabs/anda)
    cd tokokita
    ```
2.  **Install Dependensi:**
    ```bash
    flutter pub get
    ```
3.  **Konfigurasi API URL:**
    * Buka file `lib/helpers/api_service.dart`
    * Ubah `localhost` menjadi alamat IP yang sesuai jika Anda menggunakan perangkat fisik atau emulator Android (`10.0.2.2`).
        ```dart
        final String _baseUrl = "http://[IP/HOST ANDA]/toko-api/public";
        ```
4.  **Jalankan Aplikasi:**
    ```bash
    flutter run
    ```

---
