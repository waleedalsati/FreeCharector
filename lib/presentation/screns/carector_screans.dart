import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/busines_logic/charectores_cubit.dart';

import 'package:flutter_breaking/constant/mycolors.dart';
import 'package:flutter_breaking/data/models/charectors.dart';

import 'CharectorItem.dart';

class charector_Screans extends StatefulWidget {
   charector_Screans({super.key});


  @override
  State<charector_Screans> createState() => _charector_ScreansState();

}

class _charector_ScreansState extends State<charector_Screans> {
  late List<charectorsmodel>allcharector;
  void initState(){
    super.initState();
    allcharector=
        BlocProvider.of<CharectoresCubit>(context).getallcharectors();

  }



  Widget BuildBlocBuilder()
  {

    return BlocBuilder<CharectoresCubit,CharectoresState>(builder:(context,state){
      if (state is charectorslooded){
      allcharector=state.charectors;


return Buildlodedlistview();

      }else{

return Showlodingidecator();

      }

    }

    );

  }


  Widget Buildlodedlistview(){

    return SingleChildScrollView(
      child: Container(
        color: mycolors.myGray,
        child:
        Column(
          children: [
            BuildCharectorbuild(),
          ],
        ),
      ),
    );

  }

Widget Showlodingidecator (){


    return Center(child: CircularProgressIndicator(color: mycolors.myyelo,));
}
  Widget BuildCharectorbuild(){
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

        crossAxisCount: 3,
      childAspectRatio: 2/3,
      crossAxisSpacing: 1,
      mainAxisExtent: 200, // أو احذفه تمامًا
    ),
        itemCount: allcharector.length,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder:(context,index){
      return CharectorItem(charector: allcharector[index],);


    } );



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: mycolors.myyelo,title: Text('Charectors',
          style: TextStyle(color: mycolors.myGray,))),
      body:BuildBlocBuilder(),

    );
  }



}
