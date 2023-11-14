# Tugas 7
## Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Perbedaan utamanya adalah bagaimana keduanya menyimpan sebuah `state` dalam aplikasi. Stateless berarti apapun yang terjadi, widget tersebut akan tetap sama saja. Sedangkan stateful widget berarti bagaimana sebuah widget menyimpan state. Jika kita menyimpan state, kita bisa melakukan banyak hal. Bisa saja sesuatu pada aplikasi kita berubah jika kita mengubah state yang ada.
 
## Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
- Material App. Material APP adalah sebuah _theme_ yang digunakan.
- Material. Widget ini akan mengembalikan card. Card ini kemudian akan diberikan icon dan text dengan masing-masing warnanya. Warna yang ada mengikuti atribut color yang dimiliki card spesifik yang diberikan pada konstruktor
- MyHomePage. MyHomePage adalah sebuah stateless widget. Hal ini karena bagian MyHomePage ini pada dasarnya tidak perlu mengingat sebuah state. Dengan kata lain, MyHomePage tidak akan memiliki perubahan.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
1. Pada command line, saya membuat sebuah aplikasi baru dengan menuliskan
```
flutter create shopping_list
```
Perlu diperhatikan bahwa aplikasi ini tidak boleh memiliki huruf besar. Oleh karena itu, saya menggunakan `snake case` disini.

2. Kemudian saya membuat 2 file, yaitu `menu.dart` dan `main.dart`.
Pada constructor ShopItem, saya membuat sebuah atribut baru yaitu color. Harapan saya adalah saya bisa mengakses warna yang ada pada class ShopCard, yaitu class yang menampilkan card-card pilihan yang ada. Kemudian, saya juga menaruh warna-warna pada ShopItem.

# Tugas 8
## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

Method push akan menambahkan suatu rute ke dalam sebuah stack yang isinya route. Method ini akan menambakan route pada bagian paling atas stack. Sedangkan, pushReplacement menghapus route yang sedang ditampilkan kepada pengguna, dan menggantinya dengan route yang baru. Pada dasarnya hal ini akan memindahkan route yang sedang ditampilkan kepada sebuah route yang baru.

## Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
1. Row: Mengatur elemen dari kiri ke kanan. Penggunaannya adalah untuk tombol dan judul supaya dalam suatu baris.
2. Column: Mengatur elemen dari atas ke bawah. Penggunaannya adalah untuk mengatur list yang ada
3. Center: Membuat elemen terletak di tengah. Penggunaannya yaitu untuk memastikan Scaffold yang kita miliki berada di tengah.
4. Container: Tempat mengatur padding, margin, border, dan color. Penggunaannya yaitu untuk mengatur padding, margin, border, dan color supaya emelem terlihat baik.
5. Card: Menampilkan tombol, gambar atau teks dengan sebuah tampilan kartu. Penggunaannya yaitu supaya tombol bisa terlihat baik.

## Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

Saya menggunakan TextFormField sebagai elemen input pada form. Saya menggunakannya karena TextFormField merupakan form yang cocok karena bisa menerima sebaga jelas input yang berupa teks.

## Bagaimana penerapan clean architecture pada aplikasi Flutter?
Memisahkan UI dan widget. Bagian ini dipisahkan supaya kita akan lebih mudah untuk menata logika dari aplikasi ini. UI adalah bagian dimana kita menampilkan tampilan yang dilihat oleh pengguna. Logika adalah bagian terpisah dari UI yang merupakan hal yang terjadi. Widget, pada lain sisi adalah bagian yang dapat ditampilkan jika pengguna memilih untuk igin melihat suatu widget.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

Pertama saya membuat folder baru pada lib yaitu screen dan widget. Isi dari screen adalah menu.dart yang pada dasarnya berisikan tampilan awal. 
```dart
import 'package:flutter/material.dart';
import 'package:pinjam_buku/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinjam Buku',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

```

Setelah itu saya membuat left_drawer.cart pada folder widget supaya saya dapat membuat sebuah drawer baru yang muncul pada screen shooplist_form. 

```dart
import 'package:flutter/material.dart';
import 'package:pinjam_buku/screens/menu.dart';
import 'package:pinjam_buku/screens/shoplist_form.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              children: [
                Text(
                  'Pinjam Buku',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text("Catat buku-bukumu disini!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),

            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Produk'),

            // Bagian redirection ke ShopFormPage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}

```

Kemudian saya membuat shoplist_form.dart yang berisikan sebuah screen yang berisi form untuk kita isi.

import 'package:flutter/material.dart';
import 'package:pinjam_buku/widgets/left_drawer.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  int _price = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Buku',
          ),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // padding nama Buku
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Nama Buku",
                labelText: "Nama Buku",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _name = value!;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Nama tidak boleh kosong!";
                }
                return null;
              },
            ),
          ),
          // padding harga Buku
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Harga",
                labelText: "Harga",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _price = int.parse(value!);
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Harga tidak boleh kosong!";
                }
                if (int.tryParse(value) == null) {
                  return "Harga harus berupa angka!";
                }
                return null;
              },
            ),
          ),
          // padding deskripsi Buku
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Deskripsi",
                labelText: "Deskripsi",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _description = value!;
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Deskripsi tidak boleh kosong!";
                }
                return null;
              },
            ),
          ),
          // padding tombol simpan
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigo),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Buku berhasil tersimpan'),
                          content: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Nama: $_name'),
                                Text('Harga: $_price'),
                                Text('Deskripsi: $_description')
                              ],
                            ),
                          ),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                  _formKey.currentState!.reset();
                },
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ])),
      ),
    );
  }
}


Terakhir saya membuat shopcard yang adalah object card yang ingin kita tampilkan di awal. 
```dart
import 'package:flutter/material.dart';

class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}

```