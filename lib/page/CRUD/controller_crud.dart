import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:petaniku2/page/CRUD/ModelKontak.dart';

class FirebaseController {
  /// Representasi dari collection "Collages" yang ada di Firestore
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection("kontak");

        /// digunakan untuk mengecek bahwa mahasiswa tersebut ada atau tidak didalam database (berdasarkan nim)
  /// digunakan untuk menambahkan mahasiswa baru
  Future<void> addStudent(KontakModel kontak) async {
    try {
      // menambahkan data
      await _collectionReference.add(
        {
          "nama": kontak.name,
          "no_telp": kontak.noTelp,
        },
      );
    } catch (ex) {
      throw Exception("error : ${ex.toString()}");
    }
  }

}
