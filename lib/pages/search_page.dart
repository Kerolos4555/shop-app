import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/cubits/search_cubit/search_cubit.dart';
import 'package:shop_app/cubits/search_cubit/search_state.dart';
import 'package:shop_app/widgets/custom_text_form_field.dart';
import 'package:shop_app/widgets/search_product_list.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.blue,
              title: const Text(
                'Searching',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    labelText: 'searching',
                    hintText: 'search',
                    controller: searchController,
                    type: TextInputType.text,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'searching for anything';
                      }
                      return null;
                    },
                    prefix: Icons.search,
                    onChange: (value) {
                      SearchCubit.get(context).searchproducts(value);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (state is SearchLoadingState)
                    const LinearProgressIndicator(
                      color: Colors.blue,
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return SearchProductsList(
                            searchProduct: SearchCubit.get(context)
                                .searchModel!
                                .searchData!
                                .product[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: 1,
                              width: double.infinity,
                              color: Colors.grey,
                            ),
                          );
                        },
                        itemCount: SearchCubit.get(context)
                            .searchModel!
                            .searchData!
                            .product
                            .length,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
