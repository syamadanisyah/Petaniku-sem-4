import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petaniku2/Kategori/model_kategori.dart';
import 'package:petaniku2/transaction/cart_controller.dart';
import 'package:petaniku2/transaction/design_keranjang_transaction.dart';

class KeranjangProvider extends ChangeNotifier {
  Future<void> init(List<CartModel> carts) async {
    _carts = carts;

    for (var cart in _carts) {
      cart.controller = TextEditingController(text: '${cart.jumlahProduk}');
    }

    notifyListeners();
  }

  int _totalPrice = 0;
  int get totalPrice => _totalPrice;

  List<CartModel> _carts = [];
  List<CartModel> get carts => _carts;

  void checkProd(int index) {
    _totalPrice = 0;

    // DMethod.log('prod : ${carts[index].checked}');
    // DMethod.log('prod : ${carts[index].namaProduk}');

    carts[index].checked = !carts[index].checked;

    // DMethod.log('prod : ${carts[index].checked}');

    notifyListeners();

    DMethod.log('produk');
    for (var cart in _carts) {
      DMethod.log('  --> name  : ${cart.namaProduk}');
      DMethod.log('  --> check : ${cart.checked}');
      DMethod.log('  --> qty : ${cart.jumlahProduk}');
      DMethod.log('  --> price : ${cart.hargaProduk}');
      if (cart.checked == true) {
        _totalPrice += (cart.jumlahProduk * cart.hargaProduk);
      }
    }

    DMethod.log('update check');
    DMethod.log('-------');

    notifyListeners();
  }

  void plusQty(int index) {
    var cart = _carts[index];

    cart.jumlahProduk = ++cart.jumlahProduk;
    cart.controller = TextEditingController(text: '${cart.jumlahProduk}');
    _carts[index] = cart;

    _totalPrice = 0;

    for (var cart in _carts) {
      DMethod.log('  --> name  : ${cart.namaProduk}');
      DMethod.log('  --> check : ${cart.checked}');
      DMethod.log('  --> qty : ${cart.jumlahProduk}');
      DMethod.log('  --> price : ${cart.hargaProduk}');
      if (cart.checked == true) {
        _totalPrice += (cart.jumlahProduk * cart.hargaProduk);
      }
    }

    notifyListeners();
  }

  void minQty(int index) {
    var cart = _carts[index];

    cart.jumlahProduk = --cart.jumlahProduk;
    if (cart.jumlahProduk <= 1) {
      Get.showSnackbar(const GetSnackBar(
        title: 'Peringatan',
        message: 'Quantity minimal 1',
        duration: Duration(seconds: 2),
      ));
      cart.jumlahProduk = 1;
    }
    cart.controller = TextEditingController(text: '${cart.jumlahProduk}');
    _carts[index] = cart;

    _totalPrice = 0;

    for (var cart in _carts) {
      DMethod.log('  --> name  : ${cart.namaProduk}');
      DMethod.log('  --> check : ${cart.checked}');
      DMethod.log('  --> qty : ${cart.jumlahProduk}');
      DMethod.log('  --> price : ${cart.hargaProduk}');
      if (cart.checked == true) {
        _totalPrice += (cart.jumlahProduk * cart.hargaProduk);
      }
    }

    notifyListeners();
  }

  void bayarSekarang() {
    try {
      List<modelProduk> cartSelected = [];

       DMethod.log('calculate buy');

      for (var cart in _carts) {
        if (cart.checked == true) {
          var prod = modelProduk(
            id: cart.idProduk,
            nama: cart.namaProduk,
            harga: cart.hargaProduk,
            jumlahProduk: cart.jumlahProduk,
            deskripsi: '',
          );
          cartSelected.add(prod);
        }
      }

      if (cartSelected.isEmpty) {
        Get.showSnackbar(const GetSnackBar(
          title: 'Peringatan',
          message: 'Tidak ada produk yang dipilih',
          duration: Duration(seconds: 2),
        ));
        return;
      }else{
        DMethod.log('not empty');
      }

      DMethod.log('everything ok : ${cartSelected.length}');
      Get.to(
          keranjang_transactionState(produk: cartSelected, harga: _totalPrice));
    } catch (ex) {
      DMethod.log('everything ok : ${ex.toString()}');
    }
  }
}
