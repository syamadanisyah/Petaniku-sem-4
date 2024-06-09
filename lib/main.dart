import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petaniku2/Barang/test_asset_barang.dart';
import 'package:petaniku2/Dashboard/data_graphik.dart';
import 'package:petaniku2/Dashboard/test_asset_dashboard.dart';
import 'package:petaniku2/Kategori/modelKategori.dart';
import 'package:petaniku2/Kategori/model_kategori.dart';
import 'package:petaniku2/Kategori/test_asset_kategori.dart';
import 'package:petaniku2/Lupa_Sandi/OTP.dart';
import 'package:petaniku2/Lupa_Sandi/test_assest_lp.dart';
import 'package:petaniku2/SplashScreen/SplashScreen.dart';
import 'package:petaniku2/User/session_user.dart';
import 'package:petaniku2/design_asset_login/test_asset_login.dart';
import 'package:petaniku2/page/CRUD/CRUD.dart';
import 'package:petaniku2/page/Lupa_password/design_OTP.dart';
import 'package:petaniku2/page/curosel_slider.dart';
import 'package:petaniku2/page/design_barang.dart';
import 'package:petaniku2/page/design_dashboard.dart';
import 'package:petaniku2/page/design_proDet_kategori_populer.dart';
import 'package:petaniku2/page/design_unit_kategori_populer.dart';
import 'package:petaniku2/page/hasil_panen/buat_postingan.dart';
import 'package:petaniku2/page/hasil_panen/halaman_postingan.dart';
import 'package:petaniku2/populer/gridview_barangPopuler.dart';
import 'package:petaniku2/transaction/design_keranjang1.dart';
import 'package:petaniku2/transaction/design_keranjang_provider.dart';
import 'package:petaniku2/transaction/design_keranjang_transaction.dart';
import 'package:petaniku2/page/design_list_kategori.dart';
import 'package:petaniku2/page/design_login.dart';
import 'package:petaniku2/page/Lupa_password/design_lupa_password.dart';
import 'package:petaniku2/page/Lupa_password/design_verifikasi_sandi.dart';
import 'package:petaniku2/page/design_produk.dart';
import 'package:petaniku2/page/profile/design_profile_view.dart';
import 'package:petaniku2/page/design_unit_kategori.dart';
import 'package:petaniku2/page/navbar.dart';
import 'package:petaniku2/produk/test_asset_produk.dart';
import 'package:petaniku2/search/search.dart';
import 'package:petaniku2/firebase_options.dart';
import 'package:petaniku2/transaction/statusBarang.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => KeranjangProvider())],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // home: test_asset_login(),
        initialRoute: '/',
        routes: {
          // '/':(context) => design_unit_kategori(kategori: modelKategori(id: 1, namaKategori: ''))
          '/': (context) => SplashScreen()
        },
      ),
    );
  }
}

