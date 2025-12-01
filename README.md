# Tugas Pertemuan 10

## 🛍️ TokoKita Mobile App (CRUD Flutter & CodeIgniter 4 API)

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

# Tugas Pertemuan 11

## 📝 **1. Proses Registrasi**

Dikelola oleh **RegistrasiPage** dan **RegistrasiBloc**.

---

### a. **Input Data Pengguna**

**Screenshot:**  
<img width="1919" height="1004" alt="Screenshot 2025-11-30 225155" src="https://github.com/user-attachments/assets/5045d690-ebba-4b38-a7a3-c520613ad7bb" />

Pengguna mengisi:

- Nama
- Email
- Password
- Konfirmasi Password

Validasi:

- Password minimal 6 karakter
- Konfirmasi password harus sama
- Email valid

---

### b. **Memanggil API Registrasi**

Endpoint:
/registrasi

Kode:

```dart
static Future<Registrasi> registrasi({
  String? nama,
  String? email,
  String? password,
}) async {
  String apiUrl = ApiUrl.registrasi;
  var body = {"nama": nama, "email": email, "password": password};
  var response = await Api().post(apiUrl, body);
  var jsonObj = json.decode(response.body);
  return Registrasi.fromJson(jsonObj);
}
```
### c. **Penanganan Hasil (Pop-up Sukses)**

**Screenshot:**  
<img width="1919" height="1010" alt="Screenshot 2025-11-30 225208" src="https://github.com/user-attachments/assets/c4a01ee0-25d6-43aa-b828-ea767d5dc30d" />

**Penjelasan:**
- Jika registrasi berhasil, muncul SuccessDialog
- Setelah dialog ditutup, pengguna diarahkan untuk melakukan login.

Kode:

```dart
).then(
      (value) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => SuccessDialog(
            description: "Registrasi berhasil, silahkan login",
            okClick: () {
              // Menutup dialog
              Navigator.pop(context); 
            },
          ),
        );
      },
      // ... Penanganan Error (menampilkan WarningDialog)
    );
```
---
## 📝 **2. Proses Login**

Dikelola oleh **LoginPage** dan **LoginBloc**.

---

### a. **Input Data Pengguna**

**Screenshot:**  
<img width="1919" height="1007" alt="Screenshot 2025-11-30 225231" src="https://github.com/user-attachments/assets/e49804b2-9f46-4349-89f2-0fb0d20bfa07" />

**Penjelasan:**  
Pengguna menginputkan email dan password yang valid, kemudian menekan tombol "Login".

**Aksi Kode:**  
(login_page.dart): Fungsi _submit() dipanggil, yang memanggil LoginBloc.login().

---
### b. **Penanganan Hasil (Sukses/Gagal)**

**Screenshot:**  
<img width="1918" height="1005" alt="Screenshot 2025-11-30 225305" src="https://github.com/user-attachments/assets/7fe56e64-fa86-4525-969e-007f321cda54" />

**Penjelasan:**  
- Sukses: Jika respons API memiliki code == 200, aplikasi menyimpan Token dan User ID menggunakan UserInfo, lalu mengarahkan pengguna ke ProdukPage dengan
- Gagal: Jika kode bukan 200, message error spesifik dari API ditampilkan di WarningDialog.
  
**Kode Penanganan Sukses (login_page.dart):**
```dart
(value) async {
        if (value.code == 200) {
          // Simpan token dan ID pengguna
          await UserInfo().setToken(value.token.toString());
          await UserInfo().setUserID(int.parse(value.userID.toString()));

          // Pindah ke halaman ProdukPage, menghapus histori navigasi
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ProdukPage()),
          );
        } else {
          // Tampilkan pesan error spesifik dari API
          showDialog(
            context: context,
            // ...
            builder: (BuildContext context) => WarningDialog(
              description: value.message ?? "Login gagal, silahkan coba lagi",
            ),
          );
        }
      },
```
---
## 📝 **3. Proses CRUD**

Semua operasi CRUD produk dikelola oleh **ProdukBloc**.

---

### a. **Read: Menampilkan Daftar Produk (List Produk)**

**Screenshot:**  
<img width="1918" height="1005" alt="Screenshot 2025-11-30 225305" src="https://github.com/user-attachments/assets/a9c659ea-20ec-4613-9b6f-92cccbca984f" />

**Penjelasan:**  

**Kode Logika BLOC**

### b. **Read: Menampilkan Detail Produk (Show)**

**Screenshot:**  
<img width="1919" height="1009" alt="Screenshot 2025-11-30 225402" src="https://github.com/user-attachments/assets/ea4b3e89-93d4-4667-b511-0cf913e78cbe" />


**Penjelasan:**  

**Kode Logika BLOC**

### c. **Create (Menambah Data Produk)**

**Screenshot:**  
<img width="1919" height="1006" alt="Screenshot 2025-11-30 225331" src="https://github.com/user-attachments/assets/7d8c4820-dadf-4ed9-8063-d4de418ef054" />
<img width="1919" height="1008" alt="Screenshot 2025-11-30 225343" src="https://github.com/user-attachments/assets/a1fc7a0e-6cc8-49e9-9565-9137bab5b9d4" />

**Penjelasan:**  

**Kode Logika BLOC**

### d. **Update (Mengubah Data Produk)**

**Screenshot:**  
<img width="1919" height="1004" alt="Screenshot 2025-11-30 225425" src="https://github.com/user-attachments/assets/7f068e92-42bd-4da8-b95f-6ad13cbe8e78" />

<img width="1919" height="1004" alt="Screenshot 2025-11-30 225439" src="https://github.com/user-attachments/assets/9dd6a1ae-8cef-4324-9ed4-e50127391697" />

**Penjelasan:**  

**Kode Logika BLOC**

### e. **Delete (Menghapus Data Produk)**

**Screenshot:**  
<img width="1919" height="1010" alt="Screenshot 2025-11-30 225454" src="https://github.com/user-attachments/assets/9782f0dc-3de1-4805-b9e9-66cb499437b0" />

<img width="1919" height="1007" alt="Screenshot 2025-11-30 225509" src="https://github.com/user-attachments/assets/aeaceb38-6b98-44ef-bf3d-14758fdc46e1" />

<img width="1919" height="1006" alt="Screenshot 2025-11-30 225521" src="https://github.com/user-attachments/assets/709e9e8a-664e-439b-80eb-d4a4ad6bcbf8" />

**Penjelasan:**  

**Kode Logika BLOC**

---

## 📝 **4. Proses Logout**
<img width="1918" height="1005" alt="Screenshot 2025-11-30 225533" src="https://github.com/user-attachments/assets/3970efe6-9df9-40a7-9348-05e6ae63c875" />
