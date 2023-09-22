import 'package:ecommerce/views/favorite/cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';
import '../../../widgets/app_text.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.filter_list,
            size: 24,
            color: black,
          ),
        ),
        const AppText(
          text: 'Filters',
          fontSize: 11,
          color: black,
        ),
        const SizedBox(
          width: 30,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.arrow_up_arrow_down,
            size: 18,
            color: black,
          ),
        ),
        const AppText(
          text: 'Price: lowest to high',
          fontSize: 11,
          color: black,
        ),
        const SizedBox(
          width: 15,
        ),
        BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                FavoriteCubit.of(context).showGrid();
              },
              icon: FavoriteCubit.of(context).showGridView
                  ? const Icon(
                      Icons.list,
                      size: 24,
                      color: black,
                    )
                  : const Icon(
                      Icons.grid_view_sharp,
                      size: 18,
                      color: black,
                    ),
            );
          },
        ),
      ],
    );
  }
}
