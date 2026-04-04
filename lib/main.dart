import 'package:flutter/material.dart';

import 'approuter.dart';

void main() {
  runApp( BreakingBAdapp(approuter: Approuter(),));
}



class BreakingBAdapp extends StatelessWidget {
    final Approuter approuter;
   BreakingBAdapp({super.key, required this.approuter});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,

     onGenerateRoute:approuter.generateapproute ,
    );
  }
}
