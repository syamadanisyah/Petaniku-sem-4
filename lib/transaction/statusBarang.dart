import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:d_method/d_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petaniku2/warna/constant.dart';
import 'package:petaniku2/warna/stylefont.dart';
import 'package:petaniku2/warna/warna.dart';

class tapBarStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _pages = [
    konfirmasi(),
    // HomePage(),
    Dikirim(),
    Diterima(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _pages.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Status Barang'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Tunggu Konfirmasi',
              ),
              // Tab(text: 'diproses',),
              Tab(
                text: 'dikirims',
              ),
              Tab(
                text: 'diterima',
              ),
            ],
          ),
        ),
        body: TabBarView(children: _pages),
      ),
    );
  }
}

class Transaction {
  final int id;
  final int totalHarga;
  final String status;
  final List<ProductData> productData;

  Transaction({
    required this.id,
    required this.totalHarga,
    required this.status,
    required this.productData,
  });
}

class ProductData {
  final String productName;
  final int quantity;
  final int price;
  final int subTotal;

  ProductData({
    required this.productName,
    required this.quantity,
    required this.price,
    required this.subTotal,
  });
}

Future<List<Transaction>> fetchTransactions(int userId, String status) async {
  DMethod.log('tests');
  final response = await http.post(
    PetaniKuConstant.baseUrl('trxlist'),
    body: {
      'id_user': userId.toString(),
      'status': status,
    },
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    List<Transaction> transactions = [];

    for (var trx in jsonData['data']) {
      List<ProductData> productData = [];
      for (var product in trx['product_data']) {
        productData.add(ProductData(
          productName: product['nama_produk'],
          quantity: product['jumlah'],
          price: product['harga'],
          subTotal: product['sub_total'],
        ));
      }
      transactions.add(Transaction(
        id: trx['id_tt'],
        totalHarga: trx['total_harga'],
        status: trx['status'],
        productData: productData,
      ));
    }
    return transactions;
  } else {
    throw Exception('Failed to load transactions');
  }
}

Future<void> acceptOrder(int idTrx) async {
  try {
    DMethod.log('accepting id : $idTrx');
    PetaniKuConstant.showLoading(canPop: true);
    final response = await http.post(
      PetaniKuConstant.baseUrl('terima'),
      body: {'id_tt': '$idTrx'},
    );

    await Future.delayed(const Duration(seconds: 2));

    Get.back();

    if (response.statusCode == 200) {
      Get.showSnackbar(GetSnackBar(
        title: 'berhasil',
        message: 'Transaksi berhasil diupdate',
      ));
    } else {
      Get.showSnackbar(GetSnackBar(
        title: 'error',
        message: 'Transaksi gagal diupdate ',
      ));
    }
  } catch (ex) {
    Get.showSnackbar(GetSnackBar(
      title: 'error',
      message: 'Transaksi gagal diupdate : ${ex.toString()} ',
    ));
  }
}

class konfirmasi extends StatefulWidget {
  @override
  State<konfirmasi> createState() => _konfirmasiState();
}

class _konfirmasiState extends State<konfirmasi> {
  late Future<List<Transaction>> _futureTrxs;

  @override
  void initState() {
    super.initState();
    _futureTrxs = fetchTransactions(1, 'konfirmasi');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Transaction>>(
      future: _futureTrxs,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Transaction>? trxs = snapshot.data;
          if (trxs != null) {
            return ListView.builder(
              itemCount: trxs.length,
              itemBuilder: (context, index) {
                var trx = trxs[index];
                return Container(
                  width: 100,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: warna.abu_abu_hitam),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: trx.productData.length,
                        itemBuilder: (ct, index) {
                          var prod = trx.productData[index];
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(prod.productName),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text("${prod.quantity} Barang"),
                              ),
                              const Text('-'),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 14),
                              child: Text("Total Harga:"),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 14),
                              child: Text("Rp ${trx.totalHarga}"),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        }
      },
    );
  }
}

/*
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Di prosess'),
    );
  }
}
*/

class Dikirim extends StatefulWidget {
  @override
  State<Dikirim> createState() => _DikirimState();
}

class _DikirimState extends State<Dikirim> {
  late Future<List<Transaction>> _futureTrxs;

  @override
  void initState() {
    super.initState();
    _futureTrxs = fetchTransactions(1, 'dikirim');
  }

  Widget build(BuildContext context) {
    return FutureBuilder<List<Transaction>>(
      future: _futureTrxs,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Transaction>? trxs = snapshot.data;
          if (trxs != null && trxs.isNotEmpty) {
            return ListView.builder(
              itemCount: trxs.length,
              itemBuilder: (context, index) {
                var trx = trxs[index];
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: warna.abu_abu_hitam),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row(
                      //   children: [
                      //     Container(
                      //       margin: EdgeInsets.only(left: 13, top: 10),
                      //       height: 70,
                      //       width: 90,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(5),
                      //           color: Colors.amber),
                      //       child: Center(
                      //         child: Text("Gambar"),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: trx.productData.length,
                        itemBuilder: (ct, index) {
                          var prod = trx.productData[index];
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(prod.productName),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text("${prod.quantity} Barang"),
                              ),
                              const Text('-'),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 14),
                        child: Text("Total Harga:"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 14),
                            child: Text("Rp ${trx.totalHarga}"),
                          ),
                          SizedBox(
                            width: 135,
                          ),
                          Container(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(
                                        Size(105, 30)),
                                    backgroundColor:
                                        MaterialStatePropertyAll(warna.hijau)),
                                onPressed: () async {
                                  await acceptOrder(trx.id);
                                },
                                child: Text(
                                  "Terima",
                                  style: stylefont().buton_kategori_barang,
                                )),
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('Tidak ada transaksi dikirm saat ini'));
          }
        }
      },
    );
  }
}

class Diterima extends StatefulWidget {
  @override
  State<Diterima> createState() => _DiterimaState();
}

class _DiterimaState extends State<Diterima> {
  late Future<List<Transaction>> _futureTrxs;

  @override
  void initState() {
    super.initState();
    _futureTrxs = fetchTransactions(1, 'diterima');
  }

  Widget build(BuildContext context) {
    return FutureBuilder<List<Transaction>>(
      future: _futureTrxs,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          List<Transaction>? trxs = snapshot.data;
          if (trxs != null && trxs.isNotEmpty) {
            return ListView.builder(
              itemCount: trxs.length,
              itemBuilder: (context, index) {
                var trx = trxs[index];
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: warna.abu_abu_hitam),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row(
                      //   children: [
                      //     Container(
                      //       margin: EdgeInsets.only(left: 13, top: 10),
                      //       height: 70,
                      //       width: 90,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(5),
                      //           color: Colors.amber),
                      //       child: Center(
                      //         child: Text("Gambar"),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: trx.productData.length,
                        itemBuilder: (ct, index) {
                          var prod = trx.productData[index];
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text(prod.productName),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                child: Text("${prod.quantity} Barang"),
                              ),
                              const Text('-'),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 14),
                        child: Text("Total Harga:"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 14),
                            child: Text("Rp ${trx.totalHarga}"),
                          ),
                          SizedBox(
                            width: 135,
                          ),
                          // Container(
                          //   child: ElevatedButton(
                          //       style: ButtonStyle(
                          //           minimumSize: MaterialStateProperty.all(
                          //               Size(105, 30)),
                          //           backgroundColor:
                          //               MaterialStatePropertyAll(warna.hijau)),
                          //       onPressed: () async {
                          //         await acceptOrder(trx.id);
                          //       },
                          //       child: Text(
                          //         "Terima",
                          //         style: stylefont().buton_kategori_barang,
                          //       )),
                          // ),
                        ],
                      ),
                      Divider(),
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('Tidak ada transaksi dikirm saat ini'));
          }
        }
      },
    );
  }
}
