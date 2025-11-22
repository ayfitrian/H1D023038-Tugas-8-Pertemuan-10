# 🛍️ TokoKita Mobile App (CRUD Flutter & CodeIgniter 4 API)

Aplikasi mobile toko sederhana yang dibangun menggunakan **Flutter** dan terintegrasi dengan **RESTful API** yang dibuat menggunakan **CodeIgniter 4**. Proyek ini bertujuan untuk mengimplementasikan dasar-dasar operasi CRUD (Create, Read, Update, Delete) dan otentikasi (Registrasi & Login) dalam pengembangan aplikasi mobile.

---

## Identitas
Nama  : Ayu Fitrianingsih
NIM  : H1D023038
Shift  : B/E

## Dokumentasi
<img width="1919" height="1004" alt="Screenshot 2025-11-22 201043" src="https://github.com/user-attachments/assets/af6bb80c-09d1-496c-ab66-64b7dded3dfd" />
<img width="1919" height="1005" alt="Screenshot 2025-11-22 201216" src="https://github.com/user-attachments/assets/c0eda7dc-2dbd-4ecb-9359-4d43f7ceda7d" />
<img width="1919" height="1005" alt="Screenshot 2025-11-22 200237" src="https://github.com/user-attachments/assets/51e20c89-54ff-43ee-b16e-8e301374951b" />
<img width="1919" height="1006" alt="Screenshot 2025-11-22 200312" src="https://github.com/user-attachments/assets/2edaafd8-ee17-41f9-89a1-81850b49acba" />
<img width="1919" height="1002" alt="Screenshot 2025-11-22 200332" src="https://github.com/user-attachments/assets/8c319119-8521-44b1-b087-abe23b35650a" />

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
