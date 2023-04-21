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
          ),
          bodySmall: TextStyle(
            fontFamily: 'dana',
            fontSize: 13,
            fontWeight: FontWeight.w300,
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
      body: Padding(
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
            )
          ],
        ),
      ),
    );
  }
}
