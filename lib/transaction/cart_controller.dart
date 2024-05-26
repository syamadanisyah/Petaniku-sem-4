
import 'dart:convert';

import 'package:get/get.dart';
import 'package:petaniku2/warna/constant.dart';
import 'package:http/http.dart' as http;


class CartModel {
  final int idKeranjang;
  final int idUser;
  final String namaProduk;
  final int hargaProduk;
  int jumlahProduk;
  final int idProduk;
  int totalHarga;
  bool checked;

  CartModel({
    required this.idKeranjang,
    required this.idUser,
    required this.hargaProduk,
    required this.namaProduk,
    required this.jumlahProduk,
    required this.idProduk,
    this.totalHarga = 0,
    this.checked = false,
  });

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      idKeranjang: map['id_keranjang'] as int,
      idUser: map['id_user'] as int,
      hargaProduk: map['harga_produk'] as int,
      namaProduk: map['nama_produk'] as String,
      jumlahProduk: map['jumlah_produk'] as int,
      idProduk: map['id_produk'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_keranjang': idKeranjang,
      'id_user': idUser,
      'harga_produk' : hargaProduk,
      'nama_produk': namaProduk,
      'jumlah_produk': jumlahProduk,
      'id_produk': idProduk,
    };
  }

  static List<Map<String, dynamic>> listToMap(List<CartModel> carts) {
    List<Map<String, dynamic>> cartListMap = [];
    carts.forEach((cart) {
      if(cart.checked){
        cartListMap.add(cart.toMap());
      }
    });
    return cartListMap;
  }
}

class CartController {
  Future<List<CartModel>> listOfCart(int userId) async {
    final response = await http.get(PetaniKuConstant.baseUrl('listcart?id_user=$userId'));

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body)['data'];
      List<CartModel> cartList = jsonList.map((item) => CartModel.fromMap(item)).toList();
      return cartList;
    } else {
      Get.showSnackbar(GetSnackBar(
        message: 'Produk gagal ditampilkan',
        duration: Duration(seconds: 2),
      ));
      throw Exception('gagal ditampilkan cart');
    }
  }

  Future<void> addCart(
      int userId, int productId, String productName, int quantity, String harga) async {
    PetaniKuConstant.showLoading(canPop: true);
    final response = await http.post(
      PetaniKuConstant.baseUrl('addcart'),
      body: {
        'id_user': '$userId',
        'id_produk': '$productId',
        'harga_produk' : '$harga',
        'nama_produk': productName,
        'jumlah_produk': '$quantity',
      },
    );

    Get.back();

    if (response.statusCode == 200) {
      Get.showSnackbar(GetSnackBar(
          message: 'Produk berhasil ditambah/diupdate',
          duration: Duration(seconds: 2)));
    } else {
      Get.showSnackbar(GetSnackBar(
          message: 'Produk gagal add', duration: Duration(seconds: 2)));
    }
  }

  Future<void> removeCart(int userId, int productId) async {
    final response = await http.delete(
      PetaniKuConstant.baseUrl('delcart'),
      body: {
        'id_user': '$userId',
        'id_produk': '$productId',
      },
    );

    if (response.statusCode == 200) {
      Get.showSnackbar(GetSnackBar(
          message: 'Produk berhasil dihapus', duration: Duration(seconds: 2)));
    } else {
      Get.showSnackbar(GetSnackBar(
          message: 'Produk gagal dihapus', duration: Duration(seconds: 2)));
    }
  }
}