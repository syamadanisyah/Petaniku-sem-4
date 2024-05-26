import 'package:petaniku2/Kategori/model_kategori.dart';

class produk {

final int id_produk;
final String? nama_produk;
final int? harga;
final String? deskripsi;

const produk({
required this.id_produk,
this.nama_produk,
this.harga,
this.deskripsi,
});

factory produk.fromJson(Map<String,dynamic> json){
  return produk(
   id_produk: json['id_produk'] ?? 0,
     nama_produk: json['nama_produk'] ?? '',
      harga: json['harga'] ?? 0,
       deskripsi: json['deskripsi'] ?? ''
       );
}


  
}

