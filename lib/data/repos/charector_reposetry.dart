import 'package:flutter_breaking/data/models/charectors.dart';

import '../servieses/web_Serveses.dart';

class Charectorreposetry {

  webservese? wepservesis;

  Charectorreposetry(this.wepservesis);

  Future<List<charectorsmodel>>fethAlldata()async{


 final  charectors =await wepservesis?.getAllCherectors();
 return charectors!.map((charector)=>charectorsmodel.fromJson(charector)).toList();

  }


}
