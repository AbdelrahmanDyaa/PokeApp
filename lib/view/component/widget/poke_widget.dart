import 'package:flutter/material.dart';
import 'package:pokemonapp/view/component/widget/text_custom.dart';
import 'package:pokemonapp/view/screens/details_screen.dart';
import 'package:pokemonapp/view_model/utils/navigation.dart';
import '../../../view_model/utils/colors.dart';

class PokeWidget extends StatelessWidget {
  final dynamic pokemon;

  const PokeWidget({ required this.pokemon,super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: AppColors.white,
      child: InkWell(
        onTap: (){
          Navigation.push(context, DetailsScreen(pokemon: pokemon,));
        },
        borderRadius: BorderRadius.circular(12),
        child: Hero(
          tag: pokemon["img"] ,
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 3,
                  child: Image.network(
                    pokemon["img"]
                    ,
                    fit: BoxFit.cover,

                  ),
                ),
                const SizedBox(height: 10,),
                  Expanded(
                  child: TextCustom(
                    text: pokemon["name"] ,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                    fontsize: 20,
                  ),
                ),
              ],
            ),

          ),
        ),
      ),
    );
  }
}
