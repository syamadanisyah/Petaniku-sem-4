import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petaniku2/Kategori/model_kategori.dart';
import 'package:petaniku2/User/modelUser.dart';
import 'package:petaniku2/page/design_login.dart';
import 'package:petaniku2/transaction/cart_controller.dart';
import 'package:petaniku2/transaction/design_keranjang_provider.dart';
import 'package:petaniku2/transaction/design_keranjang_transaction.dart';
import 'package:petaniku2/transaction/model_transaksi_detail.dart';
import 'package:petaniku2/transaction/statusBarang.dart';
import 'package:petaniku2/warna/constant.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class design_keranjang extends StatefulWidget {
  const design_keranjang({super.key});

  static ValueNotifier<int> totalHarga = ValueNotifier<int>(0);

  @override
  State<design_keranjang> createState() => _design_keranjangState();
}

class _design_keranjangState extends State<design_keranjang> {
  int _currentIndex = 0;

  late List<CartModel> listCart = [];
  final controller = CartController();

  @override
  void initState() {
    super.initState();
    design_keranjang.totalHarga.value = 0;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      listCart = await controller.listOfCart(1);
      await context.read<KeranjangProvider>().init(listCart);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: Text(
            "Keranjang",
          ),
        ),
      ),
      body: Consumer<KeranjangProvider>(
        builder: (context, myType, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 700,
                  width: 480,
                  child: myType.carts == null
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: myType.carts.length,
                          itemBuilder: (context, index) {
                            var cart = listCart[index];
                            return CartWidget(
                              cart: cart,
                              onChecked: (b) {
                                context
                                    .read<KeranjangProvider>()
                                    .checkProd(index);
                              },
                              onMinQty: () {
                                context.read<KeranjangProvider>().minQty(index);
                              },
                              onPlusQty: () {
                                context.read<KeranjangProvider>().plusQty(index);
                              },
                            );
                          },
                        ),
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: design_keranjang.totalHarga,
        builder: (context, value, child) {
          return Container(
            height: 60,
            color: warna.hijau,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      Text(
                        "Total Harga",
                        style: stylefont().buton_kategori_barang,
                      ),
                      Consumer<KeranjangProvider>(
                        builder: (context, myType, child) {
                          return Text(
                            "Rp ${myType.totalPrice}",
                            style: stylefont().buton_kategori_barang,
                          );
                        },
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    DMethod.log('prepaer');
                    context.read<KeranjangProvider>().bayarSekarang();

                    // await createOrder(
                    //     1, design_keranjang.totalHarga.value, json);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 135),
                    color: Colors.amber,
                    height: 60,
                    width: 150,
                    child: Text(
                      "Bayar sekarang",
                      style: TextStyle(),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  static Future<void> createOrder(
      int userId, int totalHarga, List<Map<String, dynamic>> carts) async {
    try {
      PetaniKuConstant.showLoading(canPop: true);
      var data = jsonEncode({
        "id_user": '1',
        "total_harga": '10000',
        "carts": carts,
      });
      DMethod.log(data);
      final response = await http.post(
        PetaniKuConstant.baseUrl('tuku'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: data,
      );

      Get.back();

      if (response.statusCode == 200) {
        // Jika request berhasil
        // Get.to(keranjang_transactionState(produk: produk, harga: harga));
      } else {
        // Jika request gagal
        Get.snackbar('Gagal', 'Gagal membuat pesanan: ${response.statusCode}',
            duration: Duration(seconds: 2));
      }
    } catch (e) {
      // Jika terjadi kesalahan dalam koneksi atau response
      Get.snackbar('Error', 'Gagal membuat pesanan: $e',
          duration: Duration(seconds: 2));
    }
  }
}

class CartWidget extends StatefulWidget {
  CartWidget({
    super.key,
    required this.cart,
    required this.onChecked,
    required this.onPlusQty,
    required this.onMinQty,
  });

  CartModel cart;
  final ValueChanged<bool?>? onChecked;
  final VoidCallback onPlusQty;
  final VoidCallback onMinQty;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  // TextEditingController cont = TextEditingController(text: '1');

  @override
  void initState() {
    super.initState();
    // cont.text = '${widget.cart.jumlahProduk}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //checklist
          Checkbox(
            splashRadius: 20,
            activeColor: warna.hijau,
            value: widget.cart.checked,
            onChanged: widget.onChecked,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: warna.hijau,
              height: 80,
              width: 80,
              alignment: Alignment.center,
              child: CachedNetworkImage(
                        imageUrl:  widget.cart.gambar ?? '',
                        placeholder: (context, url) {
                          return Center(
                            child: Text('gambar tidak tersedia'),
                          );
                        },
                        errorWidget: (context, url, error) {
                          return Center(
                            child: Text('gambar tidak tersedia'),
                          );
                        },
                        fit: BoxFit.cover,
                      ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Text(
                    "${widget.cart.namaProduk} / Rp. ${widget.cart.hargaProduk}"),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: widget.onMinQty,
                    icon: Icon(Icons.remove),
                  ),
                  Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                        color: warna.abu_abu_putih,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: widget.cart.controller,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  IconButton(
                    onPressed: widget.onPlusQty,
                    icon: Icon(Icons.add),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
