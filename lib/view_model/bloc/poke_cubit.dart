import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemonapp/view_model/data/network/dio_helper.dart';
import 'package:pokemonapp/view_model/data/network/end_points.dart';
part 'poke_state.dart';

class PokeCubit extends Cubit<PokeState> {
  PokeCubit() : super(PokeInitial());
  static PokeCubit get(context)=> BlocProvider.of(context);

  List<dynamic> pokemons = [];

  Future<void>getAllpokemon () async {
    emit(GetAllPokemonLoadingState());

    await DioHelper.get(endpiont: EndPoints.pokemon,).then((value){

     Map<String, dynamic> jsonData = jsonDecode(value.data);
     pokemons = jsonData["pokemon"];
      emit(GetAllPokemonSuccessState());
    }).catchError((error){
      emit(GetAllPokemonerrorState());
    });
  }
}
