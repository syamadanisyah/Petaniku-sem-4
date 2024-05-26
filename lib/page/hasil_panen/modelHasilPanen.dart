class modelHasilPanen {
  final int? idPost;
  final int idUser;
  final String tanaman;
  final String nama;
  final int luasTanah;
  final String deskripsiHasilPanen;
  final String gambar;
  final String? createdAt;
  final String? updatedAt;

  modelHasilPanen({
    this.idPost,
    required this.idUser,
    required this.tanaman,
    required this.nama,
    required this.luasTanah,
    required this.deskripsiHasilPanen,
    required this.gambar,
    this.createdAt,
    this.updatedAt,
  });

  factory modelHasilPanen.fromJson(Map<String, dynamic> json) {
    return modelHasilPanen(
      idPost: json['id_post'],
      idUser: json['id_user'],
      tanaman: json['tanaman'],
      nama: json['nama'],
      luasTanah: json['luas_tanah'],
      deskripsiHasilPanen: json['deskripsi_hasil_panen'],
      gambar: json['gambar'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

    Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'nama': nama,
      'tanaman': tanaman,
      'tanah': luasTanah,
      'hasil': deskripsiHasilPanen,
    };
  }
}
