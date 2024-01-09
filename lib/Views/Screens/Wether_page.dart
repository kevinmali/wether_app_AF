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
  Color bcolor = Colors.white;
  Color wcolor = Colors.black;
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
                              : 'https://w0.peakpx.com/wallpaper/754/767/HD-wallpaper-blue-moon-full-moon-nature-sky-thumbnail.jpg'),
                          fit: BoxFit.cover),
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
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: (Provider.of<themeprovider>(context,
                                                  listen: true)
                                              .theme
                                              .isdark ==
                                          true)
                                      ? wcolor
                                      : bcolor),
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
                                cursorColor: Colors.white,
                                style: TextStyle(
                                    color: (Provider.of<themeprovider>(context,
                                                    listen: true)
                                                .theme
                                                .isdark ==
                                            true)
                                        ? wcolor
                                        : bcolor,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.location_on,
                                    color: (Provider.of<themeprovider>(context,
                                                    listen: true)
                                                .theme
                                                .isdark ==
                                            true)
                                        ? wcolor
                                        : bcolor,
                                  ),
                                  border: InputBorder.none,
                                  // hintText: "${searchString}",
                                  hintStyle: TextStyle(
                                      color: (Provider.of<themeprovider>(
                                                      context,
                                                      listen: true)
                                                  .theme
                                                  .isdark ==
                                              true)
                                          ? wcolor
                                          : bcolor),
                                ),
                                onFieldSubmitted: (val) {
                                  setState(() {
                                    searchString = val;
                                  });
                                  search_Controller.clear();
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
                              style: TextStyle(
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                  color: (Provider.of<themeprovider>(context,
                                                  listen: true)
                                              .theme
                                              .isdark ==
                                          true)
                                      ? wcolor
                                      : bcolor),
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
                                  color: (Provider.of<themeprovider>(context,
                                                  listen: true)
                                              .theme
                                              .isdark ==
                                          true)
                                      ? wcolor
                                      : bcolor,
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
                                    color: (Provider.of<themeprovider>(context,
                                                    listen: true)
                                                .theme
                                                .isdark ==
                                            true)
                                        ? wcolor
                                        : bcolor),
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
                              color: (Provider.of<themeprovider>(context,
                                              listen: true)
                                          .theme
                                          .isdark ==
                                      true)
                                  ? Colors.white.withOpacity(0.3)
                                  : Colors.black.withOpacity(0.3),
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
                                          Icon(
                                            Icons.air,
                                            color: (Provider.of<themeprovider>(
                                                            context,
                                                            listen: true)
                                                        .theme
                                                        .isdark ==
                                                    true)
                                                ? wcolor
                                                : bcolor,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "Wind",
                                            style: TextStyle(
                                                color:
                                                    (Provider.of<themeprovider>(
                                                                    context,
                                                                    listen:
                                                                        true)
                                                                .theme
                                                                .isdark ==
                                                            true)
                                                        ? wcolor
                                                        : bcolor),
                                          ),
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
                                          Text(
                                            "Humidity",
                                            style: TextStyle(
                                                color:
                                                    (Provider.of<themeprovider>(
                                                                    context,
                                                                    listen:
                                                                        true)
                                                                .theme
                                                                .isdark ==
                                                            true)
                                                        ? wcolor
                                                        : bcolor),
                                          ),
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
                                          Text(
                                            "Feels Like",
                                            style: TextStyle(
                                                color:
                                                    (Provider.of<themeprovider>(
                                                                    context,
                                                                    listen:
                                                                        true)
                                                                .theme
                                                                .isdark ==
                                                            true)
                                                        ? wcolor
                                                        : bcolor),
                                          ),
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
                                          Text(
                                            "UV Index",
                                            style: TextStyle(
                                                color:
                                                    (Provider.of<themeprovider>(
                                                                    context,
                                                                    listen:
                                                                        true)
                                                                .theme
                                                                .isdark ==
                                                            true)
                                                        ? wcolor
                                                        : bcolor),
                                          ),
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
                                          Text(
                                            "Day",
                                            style: TextStyle(
                                                color:
                                                    (Provider.of<themeprovider>(
                                                                    context,
                                                                    listen:
                                                                        true)
                                                                .theme
                                                                .isdark ==
                                                            true)
                                                        ? wcolor
                                                        : bcolor),
                                          ),
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
                                          Text(
                                            "Evening",
                                            style: TextStyle(
                                                color:
                                                    (Provider.of<themeprovider>(
                                                                    context,
                                                                    listen:
                                                                        true)
                                                                .theme
                                                                .isdark ==
                                                            true)
                                                        ? wcolor
                                                        : bcolor),
                                          ),
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
                                          Text(
                                            "Night",
                                            style: TextStyle(
                                                color:
                                                    (Provider.of<themeprovider>(
                                                                    context,
                                                                    listen:
                                                                        true)
                                                                .theme
                                                                .isdark ==
                                                            true)
                                                        ? wcolor
                                                        : bcolor),
                                          ),
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
                  Padding(
                    padding: EdgeInsets.only(top: 195.0, left: 195),
                    child: Text(
                      "℃",
                      style: TextStyle(
                          color:
                              (Provider.of<themeprovider>(context, listen: true)
                                          .theme
                                          .isdark ==
                                      true)
                                  ? wcolor
                                  : bcolor,
                          fontSize: 35),
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
