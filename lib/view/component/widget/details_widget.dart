import 'package:flutter/material.dart';
import 'package:pokemonapp/view/component/widget/text_custom.dart';
import '../../../view_model/utils/colors.dart';

class DetailsWidget extends StatelessWidget {
  final dynamic pokemon;
  const DetailsWidget({required this.pokemon, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          height: MediaQuery.of(context).size.height / 1.5,
          width: MediaQuery.of(context).size.width - 20,
          left: 10.0,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 60,
                ),
                TextCustom(
                  text: pokemon['name'],
                  fontsize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                TextCustom(
                  text: 'Height ${pokemon['height']}',
                  fontWeight: FontWeight.bold,
                ),
                TextCustom(
                  text: 'Weight ${pokemon['weight']}',
                  fontWeight: FontWeight.bold,
                ),
                const TextCustom(
                  text: 'Types',
                  fontsize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...(pokemon['type'] as List<dynamic>)
                        .map((t) => FilterChip(
                              backgroundColor: AppColors.amber,
                              label: Text(t.toString()),
                              onSelected: (bool selected) {},
                            ))
                        .toList(),
                  ],
                ),
                const TextCustom(
                  text: 'Weakness',
                  fontsize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...(pokemon['weaknesses'] as List<dynamic>)
                        .map((w) => FilterChip(
                              backgroundColor: AppColors.red,
                              label: Text(w.toString()),
                              onSelected: (bool selected) {},
                            ))
                        .toList(),
                  ],
                ),
                const TextCustom(
                  text: 'Next Evolution',
                  fontsize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (pokemon['nextEvolution'] != null)
                      ...(pokemon['nextEvolution'] as List<dynamic>)
                          .map((n) => FilterChip(
                                backgroundColor: AppColors.green,
                                label: Text(n.toString()),
                                onSelected: (bool selected) {},
                              ))
                          .toList(),
                  ],
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
              tag: pokemon['img'],
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(pokemon['img']))),
              )),
        ),
      ],
    );
  }
}
