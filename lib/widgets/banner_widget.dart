import 'package:flutter/material.dart';
import 'package:phone_market/model/advertisement.dart';
import 'package:phone_market/viewmodel/data_view_model.dart';
import 'package:phone_market/widgets/my_banner_element.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    Key key,
    @required DataViewModel advertisementViewModel,
    @required PageController pageController,
  })  : _advertisementViewModel = advertisementViewModel,
        _pageController = pageController,
        super(key: key);

  final DataViewModel _advertisementViewModel;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    try {
      return Container(
        child: FutureBuilder<List<Advertisement>>(
          builder: (context, snapshot) {
            if (_advertisementViewModel.adsProgress == AdsProgress.Idle) {
              if (snapshot.hasData) {
                var ads = snapshot.data;
                return Container(
                  padding: EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      MyBannerElement(
                        bannerImage: ads[0].advertisementImage,
                        bannerContent: ads[0].advertisementContent,
                      ),
                      MyBannerElement(
                        bannerImage: ads[1].advertisementImage,
                        bannerContent: ads[1].advertisementContent,
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            } else {
              return Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: LinearProgressIndicator(),
                ),
              );
            }
          },
          future: _advertisementViewModel.bringAdvertisement(),
        ),
      );
    } catch (e) {
      return Container();
    }
  }
}
