import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breaking/constant/mycolors.dart';
import 'package:flutter_breaking/data/models/charectors.dart';

class CharectorItem extends StatelessWidget {
   CharectorItem({super.key,required this.charector});
  charectorsmodel charector ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin:EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8) ,
      padding:EdgeInsetsDirectional.all(4) ,

      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(8) ,


      ),
child: GridTile(child:
Container(
  color: mycolors.myGray,
  child: charector.image!.isNotEmpty ?
  FadeInImage.assetNetwork(width:double.infinity,
      height:double.infinity,
      fit: BoxFit.cover,
      placeholder: "assets/images/Loading Dots In Yellow.gif",
      image: charector.image!)
      :Image.asset("assets/images/Screenshot 2026-03-24 133427.png"),
  
),footer: Container(
  width:double.infinity ,
  alignment:Alignment.bottomCenter ,
  padding:EdgeInsetsDirectional.symmetric(horizontal: 8,vertical: 10
  ) ,
  color: mycolors.myyelo,
  child: Text("${charector.name}",style: TextStyle(height:1.3 ,fontSize:16 ,color: mycolors.mywihte,fontWeight: FontWeight.bold),
overflow: TextOverflow.ellipsis,),),


    ));
  }
}
