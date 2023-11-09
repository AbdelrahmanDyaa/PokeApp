import 'package:flutter/material.dart';
import 'package:pokemonapp/view/component/widget/details_widget.dart';
import 'package:pokemonapp/view/component/widget/text_custom.dart';
import 'package:pokemonapp/view_model/utils/colors.dart';

class DetailsScreen extends StatelessWidget {
  final dynamic pokemon;
  const DetailsScreen({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cyan,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.cyan,
        title: TextCustom(text: pokemon["name"]),
        centerTitle: true,
      ),
      body: DetailsWidget(
        pokemon: pokemon,
      ),
    );
  }
}
