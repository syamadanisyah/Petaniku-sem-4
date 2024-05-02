import 'package:flutter/material.dart';

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
    HomePage(),
    ChatPage(),
    ProfilePage(),
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
              Tab(text: 'Tunggu Konfirmasi',),
              Tab(text: 'diproses',),
              Tab(text: 'dikirim',),
              Tab(text: 'diterima',),
            ],
          ),
        ),
        body: TabBarView(children: _pages),
      ),
    );
  }
}

class konfirmasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tunggu Konfirmasi'),
    );
  }
}
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Di prosess'),
    );
  }
}

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('di kirim'),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('di terima'),
    );
  }
}
