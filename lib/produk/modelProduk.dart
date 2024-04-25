class produk {

final String id_produk;
final String nama_produk;
final String harga;
final String deskripsi;

const produk({
required this.id_produk,
required this.nama_produk,
required this.harga,
required this.deskripsi,
});

factory produk.fromJson(Map<String,dynamic> json){
  return produk(
    id_produk: json['id_produk'] ?? '',
     nama_produk: json['nama_produk'] ?? '',
      harga: json['harga'] ?? '',
       deskripsi: json['diskripsi'] ?? ''
       );
}




  
}