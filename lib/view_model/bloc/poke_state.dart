part of 'poke_cubit.dart';

abstract class PokeState {}

class PokeInitial extends PokeState {}

class GetAllPokemonLoadingState extends PokeState {}
class GetAllPokemonSuccessState extends PokeState {}
class GetAllPokemonerrorState extends PokeState {}
