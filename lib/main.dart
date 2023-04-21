import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
                    return const MyItem();
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
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.refresh_bold),
                  label: Text(
                    'به روز رسانی',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 202, 193, 255),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyItem extends StatelessWidget {
  const MyItem({
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
              'دلار',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              '160000',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              '+3',
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
