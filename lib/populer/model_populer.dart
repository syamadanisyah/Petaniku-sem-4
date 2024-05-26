import 'dart:convert';

class kategoriPopuler{
  final String nama;
  final String totalPenjualan;
  final int totalProduk;

  kategoriPopuler({

required this.nama,
required this.totalPenjualan,
required this.totalProduk
  });

factory kategoriPopuler.fromJson(Map<String,dynamic>json){
  return kategoriPopuler(
    nama: json['nama'],
     totalPenjualan: json['total_penjualan'],
      totalProduk: json['total_produk'],
      );
}
static List<kategoriPopuler> kategoriFromJson(String str) => List<kategoriPopuler>.from(json.decode(str)['data'].map((x)=> kategoriPopuler.fromJson(x)));

}
