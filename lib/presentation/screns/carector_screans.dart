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
  final  textcontroler=TextEditingController();
  late List<charectorsmodel>searchedcharector;
    bool is_Serased =false;

   Widget searshedcharector(){
     return TextField(
       decoration: InputDecoration(
         hintText: "find a chrector  ...",
         border: InputBorder.none,
         hintStyle:TextStyle(color: mycolors.myGray,fontSize: 18)

       ),
         style:TextStyle(color: mycolors.myGray,fontSize: 18),
       controller:textcontroler ,
       onChanged: (date) {
         return addSeasheditemtolist(date);
       }
     );



   }
   void addSeasheditemtolist(String date){

     searchedcharector=allcharector.where((ch)=>ch.name!.toLowerCase().startsWith(date)).toList();
     setState(() {

     });


   }



  void initState(){
    super.initState();

        BlocProvider.of<CharectoresCubit>(context).getallcharectors();

  }

List<Widget>controlSearshOrCansel(){

     if(is_Serased){


       return  [
         IconButton(onPressed: (){

clear();
Navigator.pop(context);

         }, icon: Icon(Icons.cancel_outlined,color: mycolors.myGray,))
       ] ;
     }else{
       return
      [
        IconButton(onPressed: (){
          startSearsh();

       },icon: Icon(Icons.search,color: mycolors.myGray,),)

       ];

     }

}


void startSearsh(){
     ModalRoute.of(context)?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: clear));

setState(() {
  is_Serased=true;
});
}
void clear(){


     setState(() {
       textcontroler.clear();
     });
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
        itemCount: textcontroler.text.isNotEmpty ? searchedcharector.length:allcharector.length,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemBuilder:(context,index){
      return CharectorItem(charector:textcontroler.text.isNotEmpty ? searchedcharector[index]:allcharector[index],);


    } );



  }
Widget buildabbaar(){


     return Text('Charector');
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: mycolors.myyelo,

          title:is_Serased?searshedcharector():buildabbaar(),
leading: is_Serased?BackButton(color: Colors.grey,):Container(),
      actions:controlSearshOrCansel() ,),
      body:BuildBlocBuilder(),

    );
  }



}
