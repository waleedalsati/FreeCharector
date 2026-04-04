
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_breaking/busines_logic/charectores_cubit.dart';
import 'package:flutter_breaking/data/repos/charector_reposetry.dart';
import 'package:flutter_breaking/data/servieses/web_Serveses.dart';
import 'package:flutter_breaking/presentation/screns/carector_screans.dart';

import 'package:flutter_breaking/presentation/screns/detels_CreectrosScrean.dart';

import 'constant/strings.dart';

class Approuter{
  late Charectorreposetry charectorreposetry;
  late CharectoresCubit charectorcubit;
  Approuter(){
    charectorreposetry=Charectorreposetry((webservese()));
charectorcubit=CharectoresCubit(charectorreposetry);

  }


  Route ? generateapproute(RouteSettings settings){

    switch(settings.name)
        {

      case CharectorScreans:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => CharectoresCubit(charectorreposetry),
            child:charector_Screans(),
          ),
        );


      case detels_CreectrosScrean:
        return MaterialPageRoute(builder: (_)=>detelss_CreectrosScrean());










    }


  }




}