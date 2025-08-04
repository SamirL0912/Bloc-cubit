import 'package:flutter/material.dart';

class Inicial extends StatelessWidget {
  const Inicial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(),
          ElevatedButton(onPressed: (){}, child: Text(''))
        ],
      ),
    );
  }
}