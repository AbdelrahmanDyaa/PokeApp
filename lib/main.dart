import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemonapp/view/screens/home_screen.dart';
import 'package:pokemonapp/view_model/bloc/poke_cubit.dart';
import 'package:pokemonapp/view_model/data/network/dio_helper.dart';

Future<void> main() async {
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PokeCubit()..getAllpokemon(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
         debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}


