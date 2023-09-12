import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterchallenge/Integration%20of%20ChatGPT/lib/main.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<String> items = [];
//   @override
//   void initState() {
//     super.initState();
//     getDataFromApi();
//   }

//   Future<void> getDataFromApi() async {
//     try {
//       final data = await ApiService.getCoinDetails();
//       setState(() {
//         items = data;
//       });
//     } catch (e) {
//       print('Error fetching data: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             return ListTile(
//               leading: const Icon(Icons.favorite),
//               title: Text(items[index]),
//             );
//           }),
//     );
//   }
// }

// class ApiService {
//   static Future<List<String>> getCoinDetails() async {
//     Uri uri = Uri.parse(
//         'https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en');
//     final response = await http.get(uri);
//     if (response.statusCode == 200) {
//       print(response.body);
//       List<dynamic> details = json.decode(response.body);
//       return details.map((items) => items.toString()).toList();
//     } else {
//       throw Exception('Failed to load data from the API');
//     }
//   }
// }

// void main() => runApp(const Asign());

// class Asign extends StatelessWidget {
//   const Asign({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: App(),
//     );
//   }
// }

// class App extends StatefulWidget {
//   const App({super.key});
//   @override
//   State<App> createState() => _AppState();
// }

// class _AppState extends State<App> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SafeArea(
//       child: ListView.builder(
//           itemCount: 10,
//           itemBuilder: (context, int index) {
//             return Container(
//               margin: EdgeInsets.only(
//                 top: index == 0 ? 16.0 : 0.0,
//                 bottom: 32.0,
//               ),
//               height: 52,
//               decoration: const BoxDecoration(
//                   color: Colors.greenAccent,
//                   borderRadius: BorderRadius.all(Radius.circular(24.0))),
//               child: ListTile(
//                 title: Text('hi $index'),
//                 trailing: const SizedBox(
//                   height: 24,
//                   width: 24,
//                   child: Icon(Icons.person),
//                 ),
//               ),
//             );
//           }),
//     ));
//   }
// }

// void main() => runApp(const Mapp());

// class Mapp extends StatelessWidget {
//   const Mapp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: Asg(),
//     );
//   }
// }

// class Asg extends StatefulWidget {
//   const Asg({super.key});
//   @override
//   State<Asg> createState() => _AsgState();
// }

// class _AsgState extends State<Asg> {
//   late Future<List<Coins>> futureCoins;

//   @override
//   void initState() {
//     super.initState();
//     futureCoins = fetchDateFromApi();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Api Call'),
//         centerTitle: true,
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Center(
//           child: FutureBuilder<List<Coins>>(
//         future: futureCoins,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator(); // Display a loading indicator.
//           } else if (snapshot.hasError) {
//             return Text('Error: ${snapshot.error}');
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Text(
//                 'No data available'); // Handle the case when there is no data.
//           } else {
//             // Here, you can display information for each coin in the list.
//             final coinsList = snapshot.data;
//             return ListView.builder(
//               itemCount: coinsList!.length,
//               itemBuilder: (context, index) {
//                 final coin = coinsList[index];
//                 return ListTile(
//                   title: Text(coin.name),
//                   subtitle: Text('Price: ${coin.currentPrice}'),
//                   // Add more fields as needed.
//                 );
//               },
//             );
//           }
//         },
//       )),
//     );
//   }
// }

// Future<List<Coins>> fetchDateFromApi() async {
// // // i can also do 1. parse
// //   Uri url = Uri.parse(
// //       'https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en');
// // // then create an object to assign the uri
// //   final data = await http.get(url);
// // print(data.body);

// //OR
//   // pase and add it to the object
//   final response = await http.get(Uri.parse(
//       'https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en'));

//   // check if connect staus is good that is 200
//   if (response.statusCode == 200) {
//     final List<dynamic> jsonResponse = jsonDecode(response.body);
//     final List<Coins> coinsList = jsonResponse.map((coinData) {
//       return Coins.fromJson(coinData);
//     }).toList();
//     return coinsList;
//   } else {
//     throw Exception('Failed to get the data form Api');
//   }
// }

// // Model

// class Coins {
//   const Coins({
//     required this.name,
//     required this.image,
//     required this.currentPrice,
//   });

//   final String name;
//   final String image;
//   final double currentPrice;

//   factory Coins.fromJson(Map<String, dynamic> json) {
//     return Coins(
//         name: json['name'],
//         image: json['image'],
//         currentPrice: json['current_price']);
//   }
// }
/**
 
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Api Call',
      debugShowCheckedModeBanner: false,
      home: Api(),
    );
  }
}

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  late Future<List<DataModel>> getData;

  @override
  void initState() {
    super.initState();
    getData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<DataModel>>(
          future: getData,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Text('No data available');
            } else {
              final name = snapshot.data;
              return ListView.builder(
                itemCount: name!.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(name[index].title),
                  );
                }),
              );
            }
          }),
        ),
      ),
    );
  }
}

// Api function

Future<List<DataModel>> fetchData() async {
  // first pase the url
  final Uri url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    //get the data
    final List<dynamic> jsonResponse = jsonDecode(response.body);
    final List<DataModel> data =
        jsonResponse.map((nameList) => DataModel.fromJson(nameList)).toList();
    return data;
  } else {
    throw Exception('Failed to load Data ');
  }
}

// Model
class DataModel {
  const DataModel(
      {required this.id, required this.userId, required this.title});
  final int userId;
  final int id;
  final String title;

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
    );
  }
}


void main() => runApp(const Asgn());

class Asgn extends StatelessWidget {
  const Asgn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<ModelData>> items;
  @override
  void initState() {
    super.initState();
    items = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Api call'),
      ),
      body: Center(
          child: FutureBuilder<List<ModelData>>(
        future: items,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No Items ');
          } else {
            final items = snapshot.data;
            return ListView.builder(
              itemCount: items!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index].title),
                  textColor: Colors.amber,
                );
              },
            );
          }
        }),
      )),
    );
  }
}

// Api call
Future<List<ModelData>> getData() async {
  final Uri url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    Exception('Api call success ');
    final List<dynamic> jsonResponse = jsonDecode(response.body);
    final List<ModelData> getData =
        jsonResponse.map((item) => ModelData.jsonDecode(item)).toList();
    return getData;
  } else {
    throw Exception('Api call fail ');
  }
}

// Model
class ModelData {
  const ModelData({
    required this.id,
    required this.userId,
    required this.title,
  });
  final int id;
  final int userId;
  final String title;

  factory ModelData.jsonDecode(Map<String, dynamic> json) {
    return ModelData(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
    );
  }
}


 */

// void main() => runApp(const Api());

// class Api extends StatelessWidget {
//   const Api({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         useMaterial3: true,
//       ),
//       home: const Home(),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   late Future<List<DataModel>> title;
//   @override
//   void initState() {
//     title = getData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Api call'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: FutureBuilder<List<DataModel>>(
//           future: title,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               const CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text(snapshot.error.toString());
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return const Text('No Item');
//             }
//             final items = snapshot.data;
//             return ListView.builder(
//               itemCount: items!.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(items[index].title),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// //Api function
// Future<List<DataModel>> getData() async {
//   //parse data first
//   final Uri url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
//   //response
//   final response = await http.get(url);
//   // check the status code
//   if (response.statusCode == 200) {
//     final List<dynamic> jsonResponse = jsonDecode(response.body);
//     final List<DataModel> data =
//         jsonResponse.map((title) => DataModel.jsonDecode(title)).toList();
//     return data;
//   } else {
//     throw Exception('Faild to get the data from Api');
//   }
// }

// //Model

// class DataModel {
//   const DataModel(
//       {required this.id, required this.userId, required this.title});
//   final int id;
//   final int userId;
//   final String title;

//   factory DataModel.jsonDecode(Map<String, dynamic> json) {
//     return DataModel(
//       id: json['id'],
//       userId: json['userId'],
//       title: json['title'],
//     );
//   }
// }

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Api(),
    );
  }
}

class Api extends StatefulWidget {
  const Api({super.key});
  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  // url
  final _baseUrl = 'https://jsonplaceholder.typicode.com/posts';
  int _initialPage = 0;
  final int _pageLimit = 10;
  bool _nextPage = true;
  bool _isFirstLoading = false;
  bool _isLoading = false;
  List _post = [];
  late ScrollController _controller;
  void _firstLoad() async {
    setState(() {
      _isFirstLoading = true;
    });

    try {
      final response = await http
          .get(Uri.parse("$_baseUrl?_page= $_nextPage&_limit=$_pageLimit"));

      setState(() {
        _post = jsonDecode(response.body);
      });
    } catch (e) {
      throw Exception('$e');
    }
    setState(() {
      _isFirstLoading = false;
    });
  }
  // scroll User

  void _loadMore() async {
    if (_nextPage == true &&
        _isLoading == false &&
        _isFirstLoading &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoading = true;
      });
      _initialPage += 1;
    }
    try {
      final response = await http
          .get(Uri.parse("$_baseUrl?_page=$_initialPage&_limit=$_pageLimit"));
      final List fetchedPost = jsonDecode(response.body);
      if (fetchedPost.isNotEmpty) {
        setState(() {
          _post.addAll(fetchedPost);
        });
      } else {
        setState(() {
          _nextPage = false;
        });
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api call'),
      ),
      body: _isFirstLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(children: [
              Expanded(
                child: ListView.builder(
                  controller: _controller,
                  itemCount: _post.length,
                  itemBuilder: (_, index) => Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: ListTile(
                      title: Text(_post[index]['title']),
                      subtitle: Text(_post[index]['body']),
                    ),
                  ),
                ),
              ),

              // when the _loadMore function is running
              if (_isLoading == true)
                const Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 40),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              // when nothing else is running
              if (_nextPage == false)
                Container(
                  padding: const EdgeInsets.only(top: 30, bottom: 40),
                  color: Colors.amber,
                  child: const Center(
                    child: Text('You have fetched all of the content'),
                  ),
                ),
            ]),
    );
  }
}
