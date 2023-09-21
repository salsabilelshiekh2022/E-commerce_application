import 'package:ecommerce/views/home/cubit.dart';
import 'package:ecommerce/views/search_by_category.dart/cubit.dart';
import 'package:ecommerce/widgets/app_text_form_field.dart';
import 'package:ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/app_text.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  late String text;
  late TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const AppText(
          text: 'Search',
          fontSize: 18,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                final cubit = SearchCubit.of(context);
                return Column(
                  children: [
                    AppTextFormField(
                      controller: textController,
                      onChange: (value) {
                        SearchCubit.of(context).getSearchData(value);
                      },
                      onSubmitted: (value) {
                        SearchCubit.of(context)
                            .getSearchData(textController.text);
                      },
                      hintText: 'Searching...',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: ProductCard(
                              product: cubit.searchProducts!.isEmpty
                                  ? HomeCubit.of(context).products[index]
                                  : cubit.searchProducts![index]),
                        );
                      },
                      itemCount: cubit.searchProducts!.isEmpty
                          ? HomeCubit.of(context).products.length
                          : cubit.searchProducts!.length,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
