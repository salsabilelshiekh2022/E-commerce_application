import 'package:ecommerce/views/search_by_category.dart/cubit.dart';
import 'package:ecommerce/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/app_text.dart';
import '../favorite/units/filter_bar.dart';

class SearchByCategoryView extends StatefulWidget {
  const SearchByCategoryView({super.key, required this.title});
  final String title;

  @override
  State<SearchByCategoryView> createState() => _SearchByCategoryViewState();
}

class _SearchByCategoryViewState extends State<SearchByCategoryView> {
  @override
  void initState() {
    // SearchCubit.of(context).getSearchData(widget.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          text: widget.title,
          fontSize: 18,
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 18,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const FilterBar(),
              const SizedBox(
                height: 26,
              ),
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  return state is SearchLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: ProductCard(
                                  product: SearchCubit.of(context)
                                      .searchProducts![index]),
                            );
                          },
                          itemCount:
                              SearchCubit.of(context).searchProducts!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                        );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
