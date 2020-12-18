import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'dart:convert';
import './model/Customer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.teal,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String host ="http://10.0.2.2:8000/prestashop/api/";
  Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Basic QzIxMk1ZUkg1U05DNkRFNVFKNTFRRVFQR0NDR0E5Qk0'
  };

  Customer customer= new  Customer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCustomer();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers:<Widget> [
          const SliverAppBar(
            title: Text('WoodToys'),
            expandedHeight: 150.0,
            floating: true,
            snap: true,
            pinned: true,


            flexibleSpace: FlexibleSpaceBar(

            ),
          ),

          SliverPadding(
             padding: const EdgeInsets.all(20),
             sliver: SliverGrid.count(
             crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children:<Widget> [
                Container( padding: const EdgeInsets.all(8),
                    child: Image.asset("images/woodtoys.png"),
                    color: Colors.green[100],
                 ),
                Container(
                    padding: const EdgeInsets.all(8),
                    child: Text("text"),
                  color: Colors.green[200],
                    ),
                    RaisedButton(child: Text('OK'),onPressed: getCustomer())
              ],
           )

            // itemExtent: 50.0,
            /* delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
           return Container(
             alignment: Alignment.center,
              color: Colors.lightBlue[100 * (index % 9)],
            child: Text('List Item $index'),


          );
          }
      )*/
          )
        ],

      ),
      drawer: Drawer(
          child: ListView(
            children:<Widget> [
              DrawerHeader(
                  child:Center(
                    child: CircleAvatar(
                      child: Text( 'Moi'),
                      radius: 40.0,
                    ),
                  ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,Colors.blueAccent
                    ]
                  )
                ),
              ),

            ],
          )
      ),

    );
  }

   getCustomer(){
    print("hhhhhhhhhh");
    var data;
    http.get(host+ "products/1",headers: this.header)
        .then((value) =>{
          data =jsonDecode(value.body),
      print(data),
    })
    .then((err) => print(err));


  }
}
