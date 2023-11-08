# Reminder
The branch of this project is master.

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