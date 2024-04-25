class modelTransaksi_detail {
  
final String id_td;
final String id_produk;
final String nama_produk;
final String harga;
final String jumlah;


const modelTransaksi_detail({
required this.id_td,
required this.id_produk,
required this.nama_produk,
required this.harga,
required this.jumlah,
});

factory modelTransaksi_detail.fromJson(Map<String,dynamic>json){
return modelTransaksi_detail(
id_td: json['id_td'] ??'',
id_produk: json['id_produk'] ??'',
nama_produk: json['nama_produk'] ??'',
harga: json['harga'] ??'',
jumlah: json['jumlah'] ??'',

);
}
}

class modelTransaksi_total {
  
final String id_tt;
final String id_user;
final String id_td;
final String total_harga;


const modelTransaksi_total({
required this.id_tt,
required this.id_user,
required this.id_td,
required this.total_harga,
});

factory modelTransaksi_total.fromJson(Map<String,dynamic>json){
return modelTransaksi_total(
id_tt: json['id_td'] ?? '',
id_user: json['id_user'] ?? '',
id_td: json['id_td'] ?? '',
total_harga: json['total_harga'] ?? ''

);
}
}

