import 'package:flutter/material.dart';

class box_diskripsi extends StatelessWidget {

  final String deskripsi;
  const box_diskripsi({
    Key? key,
  required this.deskripsi
  }):super(key: key);

  @override
  Widget build(BuildContext context) {



    return box_diskripsi_dinamis(deskripsi: deskripsi,);
  }
}

class box_diskripsi_dinamis extends StatefulWidget {

final String deskripsi;

  const box_diskripsi_dinamis({
    Key?Key,
    required this.deskripsi
  }):super(key: Key);

  @override
  State<box_diskripsi_dinamis> createState() => _box_diskripsi_dinamisState();
}

class _box_diskripsi_dinamisState extends State<box_diskripsi_dinamis> {

  bool isExpanded = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Deskripsi Produk',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Visibility(
            visible: !isExpanded,
            child: Text(
              widget.deskripsi,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 17),
            ),
          ),
          Visibility(
            visible: isExpanded,
            child: Text(
              widget.deskripsi,
              style: TextStyle(fontSize: 17),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? 'Sembunyikan' : 'Selengkapnya',
                  style: TextStyle(color: Colors.blue,fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
      
    );
  }
}