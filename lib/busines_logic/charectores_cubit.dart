import 'package:bloc/bloc.dart';
import 'package:flutter_breaking/data/models/charectors.dart';
import 'package:meta/meta.dart';

import '../data/repos/charector_reposetry.dart';

part 'charectores_state.dart';

class CharectoresCubit extends Cubit<CharectoresState> {
  final Charectorreposetry charectorreposetry;

  List<charectorsmodel>charectors=[];
  CharectoresCubit(this.charectorreposetry )
      : super(CharectoresInitial());


  List<charectorsmodel> getallcharectors() {
    charectorreposetry.fethAlldata().then(
            (charectors){
      emit(charectorslooded(charectors));
this.charectors=charectors;
            });
      return charectors ;

  }
}