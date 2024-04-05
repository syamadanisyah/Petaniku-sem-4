class KontakModel {
  final String? name;
  final String? noTelp;

  const KontakModel({
    this.name,
    this.noTelp,
  });

  factory KontakModel.fromJson(Map<String, dynamic> json){
    return KontakModel(
      name: json['nama'] ?? '',
      noTelp: json['no_telp'] ?? '',
    );
  }
}
