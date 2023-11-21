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
```dart
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
  int _amount = 0;
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
          // padding amount Buku
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Amount",
                labelText: "Amount",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              onChanged: (String? value) {
                setState(() {
                  _amount = int.parse(value!);
                });
              },
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Amount tidak boleh kosong!";
                }
                if (int.tryParse(value) == null) {
                  return "Amount harus berupa angka!";
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
                                Text('Amount: $_amount'),
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
```

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

## Tugas 9

### Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

Ya. Kita bisa mengambil data dan langsung membaca data JSON yang kita dapatkan. Masalahnya adalah kita tidak bisa membuat sebuah method yang dapat memproses data jika kita membutuhkannya. Hal ini kemudian akan  membuat kode kita akan sulit dibaca.

### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Mendapatkan cookie yang dibuat django. Cookie request perlu dibagikan ke semua komponen karena kita mungkin saja membutuhkan cookie tersebut untuk sebuah tugas yang ingin kita lakukan di bagian tersebut.

### Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.

Ambil data dari api django dan lakukan decode terhadap data JSON tersebut. kemudian kita bisa memasukkan data tersebut ke sebuah kelas yang kita buat untuk memproses data tersebut. Kita bisa memasukkan atribut ataupun memprosesnya dalam sebuah method jika diperlukan.

### Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Pertama kita perlu melakukan instansiasi terhadap CookieRequest. Setelah itu, kita dapat menerima username dan password yang kemudian kita lakukan login terhadap api django. 

### Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
1. ListView: Menampilkan children dimana children tersebut dapat di-scroll ke bawah atau keatas
2. TextField: Menerima input text user

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

Pertama lakukan `pip install django-cors-headers`
Lalu saya membuat aplikasi baru django yang bernama `authenticate`
Kemudian saya menambahkan `corsheaders` dan `corsheaders.middleware.CorsMiddleware` pada `settings.py` pada proyek django saya.

Kemudian saya menambahkan hal berikut pada `settings.py` saya

```py
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```

Kemudian saya menambahkan beberapa fungsi berikut pada aplikasi authenticate supaya bisa melakukan login dan logout melalui flutter:

```py
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import logout as auth_logout


@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)

@csrf_exempt
def logout(request):
    username = request.user.username

    try:
        auth_logout(request)
        return JsonResponse({
            "username": username,
            "status": True,
            "message": "Logout berhasil!"
        }, status=200)
    except:
        return JsonResponse({
        "status": False,
        "message": "Logout gagal."
        }, status=401)
```

Kemudian saya menambahkan urls.py baru pada aplikasi authenticate
```py
from django.urls import path
from authentication.views import *

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
    path('logout/', logout, name='logout'),
]
```

Kemudian saya mengubah myApp agar bisa menerima cookie.
```dart
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:pinjam_buku/screens/login.dart';
import 'package:pinjam_buku/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        //home: MyHomePage(),
        home: const LoginPage(),
      ),
    );
  }
}
```

Lalu saya membuat file `login.dart`
```dart
import 'package:pinjam_buku/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                // Cek kredensial
                // Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                // gunakan URL http://10.0.2.2/
                final response = await request.login(
                    // "http://127.0.0.1:8000/auth/login/",
                    "http://10.0.2.2:8000/auth/login/",
                    {
                      'username': username,
                      'password': password,
                    });

                if (request.loggedIn) {
                  String message = response['message'];
                  String uname = response['username'];
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("$message Selamat datang, $uname.")));
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Login Gagal'),
                      content: Text(response['message']),
                      actions: [
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

```

Kemudian saya membuat sebuah folder models dan membuat `product.dart`
```dart
// To parse this JSON data, do
//
//     final books = booksFromJson(jsonString);

import 'dart:convert';

List<Books> booksFromJson(String str) =>
    List<Books>.from(json.decode(str).map((x) => Books.fromJson(x)));

String booksToJson(List<Books> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Books {
  String model;
  int pk;
  Fields fields;

  Books({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Books.fromJson(Map<String, dynamic> json) => Books(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  int user;
  String name;
  int amount;
  String description;

  Fields({
    required this.user,
    required this.name,
    required this.amount,
    required this.description,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "description": description,
      };
}

```

Kemudian saya menambahkan isi dari file `AndroidManifest.xml` dengan kode `<uses-permission android:name="android.permission.INTERNET" />`

Lalu saya membuat `list_product.dart` yang berisi
```dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pinjam_buku/models/product.dart';
import 'package:pinjam_buku/widgets/left_drawer.dart';
import 'package:pinjam_buku/screens/product_detail.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();

  void _navigateToDetailPage(Books product, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(product: product),
      ),
    );
  }
}


class _ProductPageState extends State<ProductPage> {
  Future<List<Books>> fetchProduct() async {
    // Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse(
        //'http://<URL_APP_KAMU>/json/'
        // "http://127.0.0.1:8000/json/");
    "http://10.0.2.2:8000/json/");
    var response = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Books
    List<Books> list_product = [];
    for (var d in data) {
      if (d != null) {
        list_product.add(Books.fromJson(d));
      }
    }
    return list_product;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Books'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return const Column(
                    children: [
                      Text(
                        "Tidak ada data produk.",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () {
                        widget._navigateToDetailPage(
                            snapshot.data![index], context);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${snapshot.data![index].fields.name}",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text("${snapshot.data![index].fields.amount}"),
                            const SizedBox(height: 10),
                            Text("${snapshot.data![index].fields.description}")
                          ],
                        ),
                      ),
                    ),
                  );
                }
              }
            }));
  }
}
```

Kemudian saya menambahkan `ListTile` pada `left_drawer.dart`
```dart
ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Daftar Produk'),
            onTap: () {
              // Route menu ke halaman produk
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductPage()),
              );
            },
          ),
```

Kemudian pada `menu.dart` saya menambahkan baris ini supaya dapat pindah ke layar lain.
```dart
else if (item.name == "Lihat Produk") {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ProductPage()));
  }
```

Lalu saya menambahkan fungsi berikut pada main/views.py saya pada proyek django saya
```dart
@csrf_exempt
def create_product_flutter(request):
    if request.method == 'POST':
        
        data = json.loads(request.body)

        new_product = Vehicle.objects.create(
            user = request.user,
            name = data["name"],
            amount = int(data["amount"]),
            description = data["description"]
        )

        new_product.save()

        return JsonResponse({"status": "success"}, status=200)
    else:
        return JsonResponse({"status": "error"}, status=401)
```

Kemudian pada `shoplist_form.dart` saya menambahkan cookies dengan cara menambahkan baris kode berikut ini
```dart
final request = context.watch<CookieRequest>();
```

Lalu ubah onPress menjadi berikut
```dart
onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final response = await request.postJson(
                        // "http://127.0.0.1:8000/create-flutter/",
                        "http://10.0.2.2:8000/create-flutter/",
                        jsonEncode(<String, String>{
                          'name': _name,
                          'amount': _amount.toString(),
                          'description': _description,
                        }));
                    if (response['status'] == 'success') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Produk baru berhasil disimpan!"),
                      ));
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Terdapat kesalahan, silakan coba lagi."),
                      ));
                    }
                  }
                  _formKey.currentState!.reset();
                },
```
Terakhir pada `menu.dart` tambahkan kode berikut

```dart
else if (item.name == "Logout") {
            final response = await request.logout(
                // Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                "http://10.0.2.2:8000/auth/logout/");
                // "http://127.0.0.1:8000/json/");
            String message = response["message"];

            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
```