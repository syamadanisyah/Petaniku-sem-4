class modelProduk {
  final String id;
  final String nama;
  final String harga;
  final String deskripsi;
  final modelKategori kategori;

  const modelProduk({
    required this.id,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.kategori,
  });

  factory modelProduk.fromJson(Map<String, dynamic> json) {
    return modelProduk(
      id: json['id_produk'] ?? '',
      nama: json['nama_produk'] ?? '',
      harga: json['harga'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
      kategori: json['kategori'] != null
          ? modelKategori.fromJson(
              json['kategori'] as Map<String, dynamic>,
            )
          : modelKategori(id: '0', namaKategori: ''),
    );
  }
}

class modelKategori {
  final String id;
  final String namaKategori;

  modelKategori({
    required this.id,
    required this.namaKategori,
  });

  factory modelKategori.fromJson(Map<String, dynamic> json) {
    return modelKategori(
      id: json['id_kategori'] ?? '',
      namaKategori: json['nama_kategori'] ?? '',
    );
  }
}