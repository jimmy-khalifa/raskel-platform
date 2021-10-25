import 'package:flutter/material.dart';
class DataView extends StatelessWidget {
  const DataView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold (
    appBar: AppBar(
      backgroundColor: Colors.transparent
          ),
          body: const Center(
            child: Text('Data View'),
          ),

  );
}
