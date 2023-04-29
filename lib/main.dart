import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:world_currency/model/Currency.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'dana',
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
          headlineSmall: TextStyle(
            fontFamily: 'dana',
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          bodySmall: TextStyle(
            fontFamily: 'dana',
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.white,
          ),
          labelMedium: TextStyle(
            fontFamily: 'dana',
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.red,
          ),
          labelLarge: TextStyle(
            fontFamily: 'dana',
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: Colors.green,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), //farsi
      ],
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Currency> currency = [];


//get data from server
  Future getResponse(BuildContext context) async {
    var url =
        "https://sasansafari.com/flutter/api.php?access_key=flutter123456";
    var value = await http.get(Uri.parse(url));
    //developer.log(value.body,name: 'getResponse12345');
    print(value.statusCode);
    if (value.statusCode == 200 && currency.isEmpty) {
      _showSnackBar(context, 'به روز رسانی اطلاعات با موفقیت انجام شد');
      List jsonList = convert.jsonDecode(value.body);
      if (jsonList.isNotEmpty) {
        for (int i = 0; i < jsonList.length; i++) {
          setState(() {
            currency.add(Currency(
                id: jsonList[i]['id'],
                title: jsonList[i]['title'],
                price: jsonList[i]['price'],
                changes: jsonList[i]['changes'],
                status: jsonList[i]['status']));
          });
        }
      }
    }
    return value;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getResponse(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          Image.asset('assets/images/dollar.png'),
          const SizedBox(width: 10),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'قیمت به روز سکه و ارز',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                'assets/images/menu.png',
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/question.png',
                    width: 22,
                    height: 22,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'نرخ ارز آزاد چیست؟',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'نرخ ارزها در معاملات نقدی و رایج روزانه'
                ' است معاملات نقدی معملاتی هستند که خریدار و فروشنده'
                ' به محض انجام معامله، ارز و ریال را با هم تبادل میکنند.',
                style: Theme.of(context).textTheme.labelSmall,
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 24),
              Container(
                height: 35,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(1000),
                  ),
                  color: Color.fromARGB(255, 130, 130, 130),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'نام آزاد ارز',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'قیمت',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      'تغییر',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              //Listview & FutureBuilder
              SizedBox(
                width: double.infinity,
                height: 350,
                child: listFutureBuilder(context),
              ),
              const SizedBox(height: 12),
              //update button box
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 232, 232, 232),
                  borderRadius: BorderRadius.circular(1000),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 50,
                      child: TextButton.icon(
                        onPressed: () {
                          currency.clear();
                          listFutureBuilder(context);
                        },
                        icon: const Icon(CupertinoIcons.refresh_bold),
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                          child: Text(
                            'به روز رسانی',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 202, 193, 255),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1000),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text('آخرین به روز رسانی  ${_getTime()}'),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<dynamic> listFutureBuilder(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: currency.length,
                itemBuilder: (BuildContext context, int position) {
                  return MyItem(position, currency);
                },
                separatorBuilder: (BuildContext context, int index) {
                  if (index % 9 == 0) {
                    return const AddItem();
                  }
                  return const SizedBox.shrink();
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
      future: getResponse(context),
    );
  }

  String _getTime() {
    return '20:45';
  }
}

void _showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        msg,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      backgroundColor: Colors.green,
    ),
  );
}

class MyItem extends StatelessWidget {
  int position;
  List<Currency> currency;

  MyItem(
    this.position,
    this.currency, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: const <BoxShadow>[
            BoxShadow(
              blurRadius: 1.0,
              color: Colors.grey,
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              currency[position].title!,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              currency[position].price!,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              currency[position].changes!,
              style: currency[position].status == 'n'
                  ? Theme.of(context).textTheme.labelMedium
                  : Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class AddItem extends StatelessWidget {
  const AddItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          boxShadow: const <BoxShadow>[
            BoxShadow(
              blurRadius: 1.0,
              color: Colors.grey,
            )
          ],
          color: Colors.red,
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'تبلیغات',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
