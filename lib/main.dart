import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petaniku2/Barang/test_asset_barang.dart';
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // home: test_asset_login(),
      initialRoute: '/',
      routes: {
        // '/':(context) => design_unit_kategori(kategori: modelKategori(id: 1, namaKategori: ''))
        '/': (context) => SplashScreen()
      },
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
