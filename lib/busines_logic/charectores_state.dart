part of 'charectores_cubit.dart';

@immutable
sealed class CharectoresState {}

final class CharectoresInitial extends CharectoresState {}
class charectorslooded extends CharectoresState{

  final List<charectorsmodel>charectors;
  charectorslooded(this.charectors);
}
class charectorsloding extends CharectoresState{}
class charectorsfail extends CharectoresState{}

