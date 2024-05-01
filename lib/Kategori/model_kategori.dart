class modelProduk {
  final int id;
  final String nama;
  final int harga;
  final String deskripsi;
  // final modelKategori kategori;

  const modelProduk({
    required this.id,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    // required this.kategori,
  });

  factory modelProduk.fromJson(Map<String, dynamic> json) {
    return modelProduk(
      id: json['id_produk'] ?? 0,
      nama: json['nama_produk'] ?? '',
      harga: json['harga'] ?? 0,
      deskripsi: json['diskripsi'] ?? '',
      // kategori: json['kategori'] != null
      //     ? modelKategori.fromJson(
      //         json['kategori'] as Map<String, dynamic>,
      //       )
      //     : modelKategori(id: 0, namaKategori: ''),
    );
  }
}

class modelKategori {
  final int id;
  final String namaKategori;

  modelKategori({
    required this.id,
    required this.namaKategori,
  });

  factory modelKategori.fromJson(Map<String, dynamic> json) {
    return modelKategori(
      id: json['id_kategori'] ?? 0,
      namaKategori: json['nama_kategori'] ?? '',
    );
  }

  static List<modelKategori> fromList(List<dynamic> json){
    return json.map((e) => modelKategori.fromJson(e)).toList();
  }
}