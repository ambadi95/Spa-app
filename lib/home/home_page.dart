import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:test_ware/widgets/bottom_navigationbar.dart';
import 'package:test_ware/widgets/carosuel_card.dart';
import 'package:test_ware/widgets/loading_screen.dart';
import 'package:test_ware/widgets/service_card.dart';
import 'package:test_ware/widgets/shimmer_loading_servicelist.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String baseUrl = 'https://admin.blissme.hk/public';

  bool loading = false;
  bool loadingsev = false;

  List carousel = [];
  List<String> carouselImage = [];
  List services = [];
  int serviceId = 1;
  int spaCount = 10;

  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZjk3NmU4NWM5MTJhNjhlMTQwNDcyMmJhZTg4MTM5MWU3NTc0MjM0ZjU4MDM3YTY1NDcwNDQ2NDJjMDc0ZGUwZDlmMjA1NDk0ZDllZjU5ZWMiLCJpYXQiOjE2MjM5MTIxMDIsIm5iZiI6MTYyMzkxMjEwMiwiZXhwIjoxNjU1NDQ4MTAyLCJzdWIiOiI3MiIsInNjb3BlcyI6W119.OUlaYTOS-y5Y2rtMKzcpt10Ps2zDWZnt3KMtY1_6nL9qnn9iWXiN6roqkYLDsAf1s-aWzVX3ZfsVuIxSCMlwcp4_VRVu_J4VKo-PY8pUCeaHr4QpUs9l2UhySJTLhQJGyIwo2MNI7EW_Mmx45R8iisyvwQf4yegcJ9Wq-vTQ6WhmPhQfwQYYwNPxCrp8F9vEgCXcSQth8LT9pRvVmDW8P9UPkelMnVIVLIJEtw6qtsBl1Cr3uDvxDRJKq3HDZU_Rm6Ir8iC8s0QLmKxRubMHA0UdRoeTmxp2T8kb4xH-icMzQjXayuiSY6cJWws8IP7vF-DyYYdYMubJ4peq5ER-ZcHVRV-CEcAv2sCGHG-tX-uAo5SoQrl8Ebk66vjTu-emfBbTSIDWMdg09nmqOvh_AHI2lkVFauUTUMaIKqbdYLZqgC6JHD2D_OFmn2sRNw7MzpIGCwFcXuZnCN9trfWgQv4e4xnooa9QX-Yj8-3stl3u_ehbgWnFc-ZqHSfQhusJUed9S8mEGqhhPmdZTyPu66gWpuZU_p3hPJ3uPXl84WOrJgyEMDOgy3VHm5RyrC5zbAGb3KtRNnyyfJdUaqpxCRDrhDV6R6Gsaurvp1VazC8WyjvAZm309O62do6bCixpazipnfRBiv3scY6pqK2nUbNY_kCwVw7TxvMJsjkJ06g';

  getServices() async {
    try {
      setState(() {
        loading = true;
      });
      var response = await Dio().get(baseUrl + '/api/services',
          options: Options(
            headers: {"authorization": "Bearer $token"},
          ));
      if (response.statusCode == 200) {
        for (final images in response.data['carousel']) {
          if (carousel.contains(images)) {
          } else {
            carousel.add(images);
            for (int i = 0; i < carousel.length; i++) {
              if (carouselImage.contains(carousel[i]['image'])) {
              } else {
                carouselImage.add(carousel[i]['image']);
              }
            }
          }
        }
        for (final serv in response.data['services']) {
          if (services.contains(serv)) {
          } else {
            services.add(serv);
          }
        }
      }
      setState(() {
        loading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  List spa = [];

  Future getServicesList(int sId, int limit) async {
    print('serID ${sId} - ${limit}');
    if (limit == 0) {
      setState(() {
        limit = 1;
      });
    }
    spa = [];
    try {
      setState(() {
        loadingsev = true;
      });
      var response = await Dio().post(baseUrl + '/api/servicelist',
          data: {
            'serviceId': sId.toString(),
            'page': '1',
            'limit': limit.toString()
          },
          options: Options(
            headers: {"authorization": "Bearer $token"},
          ));
      if (response.statusCode == 200) {
        print(response.data);
        for (final data in response.data['spa']) {
          if (spa.contains(data)) {
          } else {
            spa.add(data);
          }
        }
      }
      setState(() {
        loadingsev = false;
      });
    } catch (e) {
      print(e);
    }
  }

  int _currentPage = 0;
  int currentIndex = 0;
  int selectedColor = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getServices();
    getServicesList(serviceId, spaCount);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Top Salon',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                Icons.search,
                color: Colors.grey,
                size: 30,
              ),
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Text(
                  'Top Salon  ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomBar(
          index: currentIndex,
          iconSize: 15,
          backgroundColor: Colors.white,
          selectedColor: Colors.red,
          navigation: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
        body: loading == true
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Shimmer.fromColors(
                  direction: ShimmerDirection.ltr,
                  baseColor: Colors.white,
                  highlightColor: Colors.grey,
                  child: LoadingHomePage(),
                ))
            : SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: height / 5,
                          child: CarouselSlider(
                              items: <Widget>[
                                for (int i = 0; i < carouselImage.length; i++)
                                  CarosuelCard(
                                    image: carouselImage[i],
                                  )
                              ],
                              options: CarouselOptions(
                                  height: 400,
                                  aspectRatio: 4 / 3,
                                  viewportFraction: 1.0,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: false,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentPage = index;
                                      // _currentKeyword = keywords[_currentPage];
                                    });
                                  })),
                        ),
                      ),
                      DotsIndicator(
                        dotsCount: carouselImage.length,
                        position: _currentPage.toDouble(),
                        decorator: DotsDecorator(
                          color: Colors.grey, // Inactive color
                          activeColor: Colors.redAccent,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 60,
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount: services.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () async {
                                    setState(() {
                                      selectedColor = index;
                                      serviceId = services[index]['serviceId'];
                                      spaCount = services[index]['spaCount'];
                                      getServicesList(serviceId, spaCount);
                                    });
                                  },
                                  child: Container(
                                    width: 120,
                                    height: 2,
                                    decoration: BoxDecoration(
                                        color: selectedColor == index
                                            ? Colors.red
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(45),
                                        border: Border.all(
                                            color: Colors.grey, width: 0.3)),
                                    child: Center(
                                      child: Text(
                                        services[index]['serviceName'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: selectedColor == index
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: Container(
                            child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Top Salon',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(
                              'Filter',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.filter_alt_sharp)
                          ],
                        )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      loadingsev == true
                          ? Center(
                              child: Shimmer.fromColors(
                                  direction: ShimmerDirection.ltr,
                                  baseColor: Colors.white,
                                  highlightColor: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListView.builder(
                                      itemCount: 3,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: ServiceLoader());
                                      },
                                    ),
                                  )),
                            )
                          : Container(
                              child: spa.isEmpty
                                  ? Container(
                                      height: 150,
                                      child: Center(
                                          child: Text(
                                        'No Salon Available',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      )))
                                  : ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                          ),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      cacheExtent: 2,
                                      itemCount: spa.length,
                                      shrinkWrap: true,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ServiceCard(
                                            details: spa[index],
                                          ),
                                        );
                                      }),
                            )
                    ],
                  ),
                ),
              ));
  }
}
