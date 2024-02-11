import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/assets.dart';
import 'package:flutter_application_1/Core/utils/constants.dart';
import 'package:flutter_application_1/Core/utils/styles.dart';
import 'package:flutter_application_1/Features/Home/presentation/views/manager/HomeCubit/cubit/home_cubit.dart';
import 'package:flutter_application_1/Features/Home/presentation/widgets/proudct_item.dart';
import 'package:flutter_application_1/Features/Home/presentation/widgets/search_app_bar_with_logo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int currentCarousalIndex = 0;
  List<Widget> banners = [
    Image.asset(
      AssetsData.carousalImage,
      fit: BoxFit.cover,
    ),
    Image.asset(
      AssetsData.carousalImage,
      fit: BoxFit.cover,
    ),
    Image.asset(
      AssetsData.carousalImage,
      fit: BoxFit.cover,
    ),
  ];
  CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchAppBarWithLogo(),
              SizedBox(
                height: 13.h,
              ),
              SizedBox(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                      items: banners,
                      options: CarouselOptions(
                        disableCenter: true,
                        viewportFraction: 0.9,
                        enlargeCenterPage: true,
                        animateToClosest: false,
                        onPageChanged: (index, x) {
                          setState(() {
                            currentCarousalIndex = index;
                          });
                        },

                        // enlargeFactor: 10,
                      ),
                    ),
                    DotsIndicator(
                        position: currentCarousalIndex,
                        dotsCount: banners.length,
                        decorator: DotsDecorator(
                          activeColor: ColorManager.secondPrimary,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("Featured Products",
                    style: Styles.textStyle16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorManager.primary)),
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  var cubit = context.read<HomeCubit>();
                  if (state is GetProductsSuccessfully) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 3 / 5,
                          crossAxisCount: 2, // number of items in each row
                          mainAxisSpacing: 8.0, // spacing between rows
                          crossAxisSpacing: 16.0, // spacing between columns
                        ),
                        padding: const EdgeInsets.all(
                            8.0), // padding around the grid
                        itemCount:
                            cubit.products.length, // total number of items
                        itemBuilder: (context, index) {
                          return ProductItem(
                            isAddedToCart: state.isAddedToCartList![index],
                            isFavorite: state.isAddedToFavList![index],
                            onAddToCartPress: () {
                              setState(() {
                                state.isAddedToCartList![index] =
                                    !state.isAddedToCartList![index];
                              });
                            },
                            onAddToFavoritePress: () {
                              setState(() {
                                state.isAddedToFavList![index] =
                                    !state.isAddedToFavList![index];
                              });
                            },
                            image: NetworkImage(
                              cubit.products[index].thumbnail,
                            ),
                            title: cubit.products[index].title,
                            price: cubit.products[index].price.toString(),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
