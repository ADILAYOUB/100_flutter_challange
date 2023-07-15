import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'app_theme.dart';
import 'model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String url =
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en';
  bool isDarkMode = AppTheme.isDarkModeEnabled;
  late Future<List<CoinDetails>> futureCoinDetail;
  List<CoinDetails> coinDetailsList = [];
  bool isSearchResult = true;
  @override
  void initState() {
    super.initState();
    futureCoinDetail = getCoinDetails();
  }

  Future<List<CoinDetails>> getCoinDetails() async {
    Uri uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200 || response.statusCode == 201) {
      List data = json.decode(response.body);
      List<CoinDetails> details =
          data.map((e) => CoinDetails.fromJson(e)).toList();
      return details;
    }
    return <CoinDetails>[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDarkMode ? Colors.white : Colors.black,
      appBar: AppBar(
        title: Text(
          "Cripto Currency",
          style: TextStyle(
            letterSpacing: 2,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        leading: Icon(
          Icons.menu,
          color: isDarkMode ? Colors.white : Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences pref = await SharedPreferences.getInstance();
              setState(() {
                isDarkMode = !isDarkMode;
              });
              await pref.setBool('isDarkMode', isDarkMode);
            },
            icon: Icon(
              isDarkMode ? Icons.dark_mode : Icons.wb_sunny,
              color: isDarkMode ? Colors.white : Colors.black,
              size: 24,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: futureCoinDetail,
        builder: (context, AsyncSnapshot<List<CoinDetails>> snapshot) {
          if (snapshot.hasData) {
            if (isSearchResult) {
              coinDetailsList = snapshot.data!;
              isSearchResult = false;
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 18.0),
                  child: TextField(
                    onChanged: (query) {
                      List<CoinDetails> searchResult = snapshot.data!.where(
                        (element) {
                          String coinName = element.name!;
                          bool isPresent = coinName.contains(query);
                          return isPresent;
                        },
                      ).toList();
                      setState(() {
                        coinDetailsList = searchResult;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search,
                          color: isDarkMode
                              ? Colors.black
                              : Colors
                                  .white), // Set the color of the prefix icon
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(14.0)),
                        borderSide: BorderSide(
                            color: isDarkMode
                                ? Colors.red
                                : Colors.blue), // Set the color of the border
                      ),
                      hintText: 'Search Coin',
                      hintStyle: TextStyle(
                          color: isDarkMode ? Colors.black : Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: coinDetailsList.isEmpty
                      ? const Center(
                          child: Text('Not Coin Found'),
                        )
                      : ListView.builder(
                          itemCount: coinDetailsList.length,
                          itemBuilder: ((context, index) {
                            return coinDetail(coinDetailsList[index]);
                          }),
                        ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget coinDetail(CoinDetails data) {
    return Column(
      children: [
        ListTile(
          leading: SizedBox(
              height: 50, width: 50, child: Image.network(data.image!)),
          title: Text(
            '${data.name} \n ${data.symbol}',
            style: TextStyle(
              fontSize: 16,
              color: isDarkMode ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              text: 'Rs.${data.currentPrice}\n',
              style: TextStyle(
                fontSize: 16,
                color: isDarkMode ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: '${data.priceChangePercentage24H}',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkMode ? Colors.red : Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
            height: 8), // Add a SizedBox with a desired height for spacing
        Container(
          height: 1,
          color: isDarkMode
              ? Colors.grey
              : Colors.grey.shade300, // Add a line color based on the theme
        ),
      ],
    );
  }
}
