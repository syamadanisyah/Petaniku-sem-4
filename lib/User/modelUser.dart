class modelUser {
  final String id_user;
  final String nama;
  final String username;
  final String password;
  final String email;
  final String alamat;
  final String gambar;
  final String level;

  const modelUser({
    required this.id_user,
    required this.nama,
    required this.username,
    required this.password,
    required this.email,
    required this.alamat,
    required this.gambar,
    required this.level,
  });

  factory modelUser.fromJson(Map<String, dynamic> json) {
    return modelUser(
      id_user: '${json['id_user']}',
      nama: json['nama'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
      alamat: json['alamat'],
      gambar: json['gambar'],
      level: json['level'],
    );
  }
}
