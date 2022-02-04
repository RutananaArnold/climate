import 'package:agriculture_app/components/RoundedInputField.dart';
import 'package:agriculture_app/components/rounded_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:agriculture_app/screens/weatherForecast/apfile.dart' as util;
import 'package:http/http.dart' as http;
import 'dart:convert';

class Climate extends StatefulWidget {
  @override
  _ClimateState createState() => _ClimateState();
}

class _ClimateState extends State<Climate> {
  String? _cityEntered;

  Future _gotonextScreen(BuildContext context) async {
    Map? result = await Navigator.of(context)
        .push(MaterialPageRoute<Map>(builder: (BuildContext context) {
      return const ClimateChange();
    }));
    if (result != null && result.containsKey('enter')) {
      setState(() {
        _cityEntered = result['enter'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green[200],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Climate App',
          style: TextStyle(
              fontFamily: "Helvatic",
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
      ),
      floatingActionButton: IconButton(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          icon: const Icon(
            Icons.cloud,
            size: 50,
            color: Colors.green,
          ),
          onPressed: () {
            _gotonextScreen(context);
          }),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/wt.png"),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
          child: updateTempWidget(
              // ignore: prefer_if_null_operators
              '${_cityEntered == null ? util.defaultCity : _cityEntered}'),
        ),
      ),
    );
  }

  Future<Map> getweather(String apiId, String city) async {
    var apiUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiId&units=imperial';

    http.Response response = await http.get(Uri.parse(apiUrl));
    return json.decode(response.body);
  }

  Widget updateTempWidget(String city) {
    double c = 1.8000;

    return FutureBuilder(
        future: getweather(util.apiID, city == null ? util.defaultCity : city),
        builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
          if (snapshot.hasData) {
            Map? content = snapshot.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Row(children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 80, 0, 0),
                      child: Text(
                        ((((content!['main']['temp']) - 32) / c))
                                .toStringAsFixed(0) +
                            "°",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 80.9,
                          color: Colors.green[200],
                          fontFamily: "Helvatic",
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.cloud,
                      size: 100,
                      color: Colors.white38,
                    ),
                  ]),
                ),
                Center(
                  child: Text(
                    // ignore: unnecessary_null_comparison
                    _cityEntered == null ? util.defaultCity : _cityEntered!,
                    style: const TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                        fontFamily: "Helvatic"),
                  ),
                ),
                Container(
                  height: 3,
                  width: 300,
                  color: Colors.white54,
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          "Humidity: ",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontStyle: FontStyle.normal,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                        child: Text(
                          " ${content['main']['humidity'].toString() + "  %"}",
                          style: const TextStyle(
                            fontFamily: "Helvatic",
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  width: 350,
                  color: Colors.white54,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          "Max: ",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontStyle: FontStyle.normal,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                        child: Text(
                          "${(((content['main']['temp_max']) - 32) / c).toStringAsFixed(1)} °C",
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontStyle: FontStyle.normal,
                            color: Colors.white54,
                            fontFamily: "Helvatic",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 1,
                  width: 350,
                  color: Colors.white54,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          "Min: ",
                          style: TextStyle(
                            fontSize: 17.0,
                            fontStyle: FontStyle.normal,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                        child: Text(
                          " ${(((content['main']['temp_min']) - 32) / c).toStringAsFixed(1)} °C",
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontFamily: "Helvatic",
                            fontStyle: FontStyle.normal,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          } else {
            return Container();
          }
        });
  }
}

class ClimateChange extends StatefulWidget {
  const ClimateChange({Key? key}) : super(key: key);

  @override
  _ClimateChangeState createState() => _ClimateChangeState();
}

class _ClimateChangeState extends State<ClimateChange> {
  final TextEditingController _cityFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green[350],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[350],
        elevation: 0,
        title: const Text(
          'Change City',
          style: TextStyle(
              fontFamily: "Helvatic",
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(0, 350, 0, 0),
          children: [
            RoundedInputField(
              icon: Icons.location_city_outlined,
              hintText: "Please enter city",
              field: _cityFieldController,
              keyboard: TextInputType.text,
            ),
            const SizedBox(height: 30),
            RoundButton(
              color: Colors.amber[600],
              text: "Press to get weather forecast",
              press: () {
                Navigator.pop(context, {'enter': _cityFieldController.text});
              },
            ),
          ],
        ),
      ),
    );
  }
}
