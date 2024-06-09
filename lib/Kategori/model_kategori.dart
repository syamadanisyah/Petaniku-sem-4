class modelProduk {
  final int id;
  final String nama;
  final int harga;
  final String deskripsi;
  final int? jumlahProduk;
  final String? gambar;
  // final modelKategori kategori;

  const modelProduk({
    required this.id,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    this.jumlahProduk,
    this.gambar
    // required this.kategori,
  });

  factory modelProduk.fromJson(Map<String, dynamic> json) {
    return modelProduk(
      id: json['id_produk'] ?? 0,
      nama: json['nama_produk'] ?? '',
      harga: json['harga'] ?? 0,
      deskripsi: json['deskripsi'] ?? '',
      gambar: json['gambar'] ?? '',
    );
  }

  static List<modelProduk> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => modelProduk.fromJson(json)).toList();
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

  static List<modelKategori> fromList(List<dynamic> json) {
    return json.map((e) => modelKategori.fromJson(e)).toList();
  }
}
