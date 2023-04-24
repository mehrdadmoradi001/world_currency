import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:world_currency/model/Currency.dart';

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
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
              SizedBox(
                width: double.infinity,
                height: 350,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int position) {
                    return  MyItem();
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    if (index % 9 == 0) {
                      return const AddItem();
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
              const SizedBox(height: 12),
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
                        onPressed: () => _showSnackBar(
                            context, 'به روز رسانی با موفقیت انجام شد'),
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
   MyItem({
    super.key,
  });
  List<Currency> currency = [];

  @override
  Widget build(BuildContext context) {
    currency.add(Currency(id: '1', title: 'دلار آمریکا', price: '25000', change: '+0.2', status: 'p'));
    currency.add(Currency(id: '2', title: 'دلار استرالیا', price: '76000', change: '+0.2', status: 'p'));
    currency.add(Currency(id: '3', title: 'دلار یوگن', price: '13000', change: '+0.5', status: 'p'));
    currency.add(Currency(id: '4', title: 'دلار سترلی', price: '95000', change: '-0.2', status: 'n'));
    currency.add(Currency(id: '5', title: 'دلار عتیسی', price: '215000', change: '+0.2', status: 'p'));
    currency.add(Currency(id: '6', title: 'دلار زکی', price: '52000', change: '-0.8', status: 'n'));

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
              currency[1].title!,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              currency[1].price!,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              currency[1].change!,
              style: Theme.of(context).textTheme.headlineSmall,
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
