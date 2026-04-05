import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breaking/constant/mycolors.dart';
import 'package:flutter_breaking/data/models/charectors.dart';

class charectormodels extends StatelessWidget {
   charectormodels({super.key,required this.charectors});


  charectorsmodel charectors;
  Widget BodyDeels(){
return SingleChildScrollView(
  child: Column(
    children: [
      Container(width:double.infinity,padding: EdgeInsets.only(bottom: 20), child: FadeInImage.assetNetwork(placeholder: "assets/images/Loading Dots In Yellow.gif", image: '${charectors.image!}')),
Container(child: Text('${charectors.name}'),),
      Text('${charectors.species}'),
      Text('${charectors.episode}')

    ],
  ),
);





  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:mycolors.myyelo,title: Text('Charectors_Detles',)),
      
      body: BodyDeels(),

    );
  }
}
