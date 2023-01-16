import 'package:carousel_slider/carousel_slider.dart';
import 'package:flut_all_content/presentation/common/state_renderer_impl.dart';
import 'package:flut_all_content/presentation/main/home/home_viewmodel.dart';
import 'package:flut_all_content/presentation/resources/color_manager.dart';
import 'package:flut_all_content/presentation/resources/routes_manager.dart';
import 'package:flut_all_content/presentation/resources/strings_manager.dart';
import 'package:flut_all_content/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../app/di.dart';
import '../../../domain/model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _homeViewModel = instance<HomeViewModel>();

  _bind() {
    _homeViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _homeViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: StreamBuilder<FlowState>(
          stream: _homeViewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data?.getScreenWidget(context, _getContentWidget(),
                    () {
                  _homeViewModel.start();
                }) ??
                Container();
          },
        ),
      ),
    );
  }

  Widget _getContentWidget() {
    return StreamBuilder<HomeData>(
        stream: _homeViewModel.outputHomeHomeData,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getBannersCarousel(snapshot.data?.bannerAd),
              _getSection(AppStrings.services.tr()),
              _getServices(snapshot.data?.services),
              _getSection(AppStrings.stores.tr()),
              _getStores(snapshot.data?.store),
            ],
          );
        });
  }

  Widget _getSection(String title) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppPadding.p12,
          left: AppPadding.p12,
          right: AppPadding.p12,
          bottom: AppPadding.p2),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }

  Widget _getBannersCarousel(List<HomeBannerAd>? bannerAd) {
    if (bannerAd != null) {
      return CarouselSlider(
        options: CarouselOptions(
            height: AppSize.s190,
            autoPlay: true,
            enableInfiniteScroll: true,
            enlargeCenterPage: true),
        items: bannerAd
            .map((banner) => SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: AppSize.s1_5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s1_5),
                        side: BorderSide(
                            color: ColorManager.white, width: AppSize.s1_5)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppSize.s1_5),
                      child: Image.network(
                        banner.link,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ))
            .toList(),
      );
    } else {
      return Container();
    }
  }

  Widget _getServices(List<HomeServices>? services) {
    if (services != null) {
      return Padding(
        padding:
            const EdgeInsets.only(left: AppPadding.p12, right: AppPadding.p12),
        child: Container(
          height: AppSize.s140,
          margin: const EdgeInsets.symmetric(vertical: AppMargin.m12),
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: services
                  .map((service) => Card(
                        elevation: AppSize.s4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s12),
                        ),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(AppSize.s12),
                              child: Image.network(service.image,
                                  fit: BoxFit.cover,
                                  width: AppSize.s100,
                                  height: AppSize.s100),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: AppPadding.p8),
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  service.title,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                  .toList()),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _getStores(List<HomeStore>? stores) {
    if (stores != null) {
      return Padding(
          padding: const EdgeInsets.only(
              left: AppPadding.p12, right: AppPadding.p12),
          child: Flex(
            direction: Axis.vertical,
            children: [
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: AppSize.s8,
                mainAxisSpacing: AppSize.s8,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                children: List.generate(stores.length, (index) {
                  return InkWell(
                    onTap: () {
                      //navigate to store details screen
                      Navigator.of(context).pushNamed(Routes.storeDetailsRoute);
                    },
                    child: Card(
                      elevation: AppSize.s4,
                      child: Image.network(
                        stores[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
              )
            ],
          ));
    } else {
      return Container();
    }
  }
}