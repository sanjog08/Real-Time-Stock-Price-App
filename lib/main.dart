// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:real_time_stock_prices/api.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Stock Prices(Real Time)',
//       debugShowCheckedModeBanner: false,
//       home: homepage(),
//     );
//   }
// }
//
//
//
// class homepage extends StatefulWidget {
//
//   @override
//   State<homepage> createState() => _homepageState();
// }
//
// class _homepageState extends State<homepage> {
//   // some variable data, url
//   late String url;
//   var Data;
//   String rate = 'rate shown';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Real Time Stock Prices'),
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 10,),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onChanged: (value) {
//                 // url of python is written here
//                 url = 'http://127.0.0.1:5000/get_price?ticker=$value';
//               },
//               decoration: InputDecoration(
//                 hintText: 'Stock Name',
//                 suffixIcon: GestureDetector(
//                   onTap: ()async{
//                      Data = await GetData(url);
//                      var decodedData = jsonDecode(Data);
//                      setState(() {
//                         rate  = decodedData['Rate shown here'];
//                      });
//                   },child: Icon(Icons.search),
//                 )
//               ),
//             ),
//           ),
//           SizedBox(height: 10,),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(rate, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
//           )
//         ],
//       ),
//     );
//   }
// }


// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Stock Prices(Real Time)',
//       debugShowCheckedModeBanner: false,
//       home: Homepage(),
//     );
//   }
// }
//
// class Homepage extends StatefulWidget {
//   @override
//   State<Homepage> createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//
//   String baseUrl = 'http://127.0.0.1:5000/get_price/';
//   late String ticker;
//   String rate = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Real Time Stock Prices'),
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onChanged: (value) {
//                 // Update the ticker symbol when the text field value changes
//                 setState(() {
//                   ticker = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 hintText: 'Stock Name',
//                 suffixIcon: GestureDetector(
//                   onTap: () async {
//                     // Call the API when the search icon is tapped
//                     await fetchStockPrice();
//                     print(rate);
//                   },
//                   child: Icon(Icons.search),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               rate,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Future<void> fetchStockPrice() async {
//     try {
//       final response = await http.get(Uri.parse(baseUrl + ticker));
//       if (response.statusCode == 200) {
//         var decodedData = jsonDecode(response.body);
//         setState(() {
//           rate = decodedData['rate'];
//         });
//       } else {
//         print('Failed to fetch stock price: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error: $e');
//     }
//   }
// }


// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Stock Prices(Real Time)',
//       debugShowCheckedModeBanner: false,
//       home: Homepage(),
//     );
//   }
// }
//
// class Homepage extends StatefulWidget {
//   @override
//   State<Homepage> createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage> {
//
//   // String baseUrl = 'http://192.168.1.11:6000/get_price/';
//   String baseUrl = 'http://127.0.0.1:5000/get_price/';
//   late String ticker;
//   String rate = 'RATE';
//
//   Future<void> fetchStockPrice() async {
//     try {
//       final response = await http.get(Uri.parse(baseUrl + ticker));
//       if (response.statusCode == 200) {
//         setState(() {
//           rate = response.body;
//         });
//       } else {
//         print('Failed to fetch stock price: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching stock price: $e');
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Real Time Stock Prices'),
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               onChanged: (value) {
//                 // Update the ticker symbol when the text field value changes
//                 setState(() {
//                   ticker = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 hintText: 'Stock Name',
//                 suffixIcon: GestureDetector(
//                   onTap: () async {
//                     // Call the API when the search icon is tapped
//                     await fetchStockPrice();
//                     print(rate);
//                   },
//                   child: Icon(Icons.search),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               rate,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//
//   // Future<void> fetchStockPrice() async {
//   //   try {
//   //     final response = await http.get(Uri.parse(baseUrl + ticker));
//   //     if (response.statusCode == 200) {
//   //       setState(() {
//   //         print(response.body);
//   //         rate = response.body; // Update rate with the response body directly
//   //         print(rate);
//   //       });
//   //     } else {
//   //       print('Failed to fetch stock price: ${response.statusCode}');
//   //     }
//   //   } catch (e) {
//   //     print('Error: $e');
//   //   }
//   // }
// }




import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stock Prices',
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late TextEditingController _controller;
  String _price = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Prices'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter stock name',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String stockName = _controller.text.trim();
                if (stockName.isNotEmpty) {
                  String price = await fetchStockPrice(stockName);
                  print(price);
                  setState(() {
                    _price = price;
                  });
                }
              },
              child: Text('Get Price'),
            ),
            SizedBox(height: 20),
            Text(
              'Price: ${_price}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Future<String> fetchStockPrice(String stockName) async {
    String url = 'http://192.168.1.21:7000/get_rate/$stockName';
    // String url = 'http://localhost:5000/get_price/$stockName';

    // String url = 'http://127.0.0.1:5000/get_price/$stockName';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.body;
      } else {
        print('Failed to fetch stock price: ${response.statusCode}');
        return 'Failed to fetch price';
      }
    } catch (e) {
      // print('Error: $e');
      return 'Error: $e';
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
