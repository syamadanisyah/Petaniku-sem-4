import 'dart:convert';

import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petaniku2/transaction/cart_controller.dart';
import 'package:petaniku2/transaction/statusBarang.dart';
import 'package:petaniku2/warna/constant.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';
import 'package:http/http.dart' as http;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 700,
              width: 480,
              /* child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  splashRadius: 20,
                  activeColor: warna.hijau,
                  value: true, onChanged: (value) {
  
                },),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: warna.hijau,
                   height: 80,
                   width: 80,
                   alignment: Alignment.center,
                   child: Text("Gambar"),
                  ),
                ),
                SizedBox(width: 15,),
                Column(
                  children: [
                    Container(
                    alignment: Alignment.topCenter,
                      child: Text("Nama produk"),
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: () {
                          
                        }, icon: Icon(Icons.exposure_minus_1_outlined),),
  
                       Container(
                        width: 80,
                        height: 30,
                        decoration: BoxDecoration(
                          color: warna.abu_abu_putih,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(border: UnderlineInputBorder(borderSide: BorderSide.none)
                          ),
                        ),
                       ),
                        IconButton(onPressed: () {
                          
                        }, icon: Icon(Icons.plus_one_outlined),),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
        ),
        */
              child: listCart == null
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: listCart.length,
                      itemBuilder: (context, index) {
                        var cart = listCart[index];
                        return CartWidget(
                          cart: cart,
                        );
                      },
                    ),
            )
          ],
        ),
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
                      Text(
                        "Rp ${value.toString()}",
                        style: stylefont().buton_kategori_barang,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () async {
                    var total = 0;
                    for (var prod in listCart) {
                      if (prod.checked) {
                        DMethod.log('prod name : ${prod.namaProduk}');
                        await controller.removeCart(1, prod.idProduk);
                        total++;
                      }
                    }

                    if (total <= 0) {
                      return;
                    }

                    var json = CartModel.listToMap(listCart);
                    DMethod.log('json data : $json');
                    DMethod.log('---');

                    await createOrder(
                        1, design_keranjang.totalHarga.value, json);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 135),
                    color: Colors.amber,
                    height: 60,
                    width: 148,
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
        Get.to(tapBarStatus());
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
  });

  CartModel cart;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  TextEditingController cont = TextEditingController(text: '1');

  @override
  void initState() {
    super.initState();
    cont.text = '${widget.cart.jumlahProduk}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            splashRadius: 20,
            activeColor: warna.hijau,
            value: widget.cart.checked,
            onChanged: (value) {
              widget.cart.checked = !widget.cart.checked;
              print('checkbox');

              setState(() {});
            },
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              color: warna.hijau,
              height: 80,
              width: 80,
              alignment: Alignment.center,
              child: Text("Gambar"),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Text("${widget.cart.namaProduk} "),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Text(" Rp. ${widget.cart.hargaProduk}"),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // count
                      int qty = --widget.cart.jumlahProduk;
                      int harga = widget.cart.hargaProduk;
                      int totalHarga = qty * harga;
                      cont.text = '$qty';

                      // update total harga
                      if (widget.cart.checked) {
                        design_keranjang.totalHarga.value -=
                            widget.cart.hargaProduk;
                        design_keranjang.totalHarga.value += totalHarga;
                      }

                      // update
                      widget.cart.totalHarga = totalHarga;
                      widget.cart.jumlahProduk = qty;
                      widget.cart.totalHarga = totalHarga;

                      // test
                      DMethod.log('qty : $qty');
                      DMethod.log('harga : $harga');
                      DMethod.log('total harga : $totalHarga');
                      setState(() {});
                    },
                    icon: Icon(Icons.exposure_minus_1_outlined),
                  ),
                  Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                        color: warna.abu_abu_putih,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      controller: cont,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide.none)),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // count
                      int qty = ++widget.cart.jumlahProduk;
                      int harga = widget.cart.hargaProduk;
                      int totalHarga = qty * harga;
                      cont.text = '$qty';

                      // update total harga
                      if (widget.cart.checked) {
                        design_keranjang.totalHarga.value -=
                            widget.cart.hargaProduk;
                        design_keranjang.totalHarga.value += totalHarga;
                      }

                      // update
                      widget.cart.totalHarga = totalHarga;
                      widget.cart.jumlahProduk = qty;
                      widget.cart.totalHarga = totalHarga;

                      // test
                      DMethod.log('qty : $qty');
                      DMethod.log('harga : $harga');
                      DMethod.log('total harga : $totalHarga');
                      setState(() {});
                    },
                    icon: Icon(Icons.plus_one_outlined),
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
