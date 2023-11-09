import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemonapp/view/component/widget/text_custom.dart';
import 'package:pokemonapp/view_model/bloc/poke_cubit.dart';
import 'package:pokemonapp/view_model/utils/colors.dart';
import '../component/widget/poke_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.cyan,
        title: const TextCustom(
          text: 'Pokemon App',
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<PokeCubit, PokeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(13.0),
            child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  ...List.generate(
                      PokeCubit.get(context).pokemons.length,
                      (index) => PokeWidget(
                            pokemon:
                                PokeCubit.get(context).pokemons[index],
                          )),
                ]),
          );
        },
      ),
    );
  }
}
