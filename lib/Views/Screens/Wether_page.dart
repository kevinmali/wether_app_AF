import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wether_app/Model/apimodel.dart';
import 'package:wether_app/Views/utils/apihelper_screen.dart';

import '../../Provider/themeprovider.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  bool today = true;
  bool tomorrow = false;
  TextEditingController search_Controller = TextEditingController();
  String searchString = "Surat";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: api_helper.api.getdata(search_data: searchString),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            api_model? apimodel = snapshot.data;
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 1,
                    width: MediaQuery.of(context).size.width / 1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage((Provider.of<themeprovider>(
                                          context,
                                          listen: true)
                                      .theme
                                      .isdark ==
                                  true)
                              ? 'https://e0.pxfuel.com/wallpapers/22/797/desktop-wallpaper-iphone-fantasy-cloudy-weather.jpg'
                              : 'https://iphoneswallpapers.com/wp-content/uploads/2019/06/River-iPhone-Wallpaper-469x832.jpg'),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Today,  ${apimodel!.location['localtime']}',
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              width: 150,
                              child: TextFormField(
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  ),
                                  border: InputBorder.none,
                                  hintText: "${searchString}",
                                  hintStyle: TextStyle(color: Colors.white),
                                ),
                                onFieldSubmitted: (val) {
                                  setState(() {
                                    searchString = val;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 28.0),
                            child: Text(
                              "${apimodel.current['temp_c']}",
                              style: const TextStyle(
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Provider.of<themeprovider>(context,
                                          listen: false)
                                      .changetheme();
                                },
                                icon: Icon(
                                  Icons.wb_sunny_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                "Sunny",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 215.0, left: 20, right: 20),
                          child: Container(
                            height: 220,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white30,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 28.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.air),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text("Wind"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${apimodel?.forecast["forecastday"][0]['hour'][0]['temp_c']}",
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.bloodtype),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text("Humidity"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${apimodel?.current['humidity']}",
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.accessibility),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text("Feels Like"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${apimodel?.current['feelslike_c']}",
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.sunny),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text("UV Index"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${apimodel?.current['uv']}",
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 18.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.sunny),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text("Day"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${apimodel?.current['temp_c']}",
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.sunny_snowing),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text("Evening"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${apimodel?.forecast["forecastday"][0]['hour'][0]['temp_c']}",
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.shield_moon),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          const Text("Night"),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${apimodel?.forecast["forecastday"][0]['hour'][1]['temp_c']}",
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 195.0, left: 195),
                    child: Text(
                      "℃",
                      style: TextStyle(color: Colors.black, fontSize: 35),
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: Container(
              height: 200,
              width: 400,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("Asset/Images/backwethwer.jpg"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
