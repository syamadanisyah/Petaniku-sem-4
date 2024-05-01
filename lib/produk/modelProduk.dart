class produk {

//final String id_produk;
final String? nama_produk;
final int? harga;
final String? deskripsi;

const produk({
//required this.id_produk,
this.nama_produk,
this.harga,
this.deskripsi,
});

factory produk.fromJson(Map<String,dynamic> json){
  return produk(
   // id_produk: json['id_produk'] ?? '',
     nama_produk: json['nama_produk'] ?? '',
      harga: json['harga'] ?? 0,
       deskripsi: json['diskripsi'] ?? ''
       );
}




  
}