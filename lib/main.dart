import 'package:app_final/HistoryPage.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'helpers/Constants.dart';


void main() => runApp(const AppFinal());

class AppFinal extends StatefulWidget {
  const AppFinal({Key? key}) : super(key: key);

  @override
  State<AppFinal> createState() => _AppFinalState();
}

class _AppFinalState extends State<AppFinal> {

  final pages=[
    const HomePage(),
    HistoryPage(),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appTitle,
        theme: ThemeData(
          primaryColor: appThemeColor,
          scaffoldBackgroundColor: appBackgroundColor,
          appBarTheme: AppBarTheme(backgroundColor: appThemeColor),
          textTheme: const TextTheme(
              headline6: TextStyle(fontSize: 28.0, color: Color.fromRGBO(3,3,3,1.0)),
              bodyText1: TextStyle(fontSize: 16.0,color: Color.fromRGBO(3,3,3,1.0))),
        ),
        home: Scaffold(
            appBar: AppBar(),
            body: pages[index],
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.amber,
                currentIndex: index,
                onTap: (int idx){ //按下導覽按鈕
                  setState(() {
                    index = idx;
                  });
                },
                items:const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
                  BottomNavigationBarItem(icon: Icon(Icons.ad_units_outlined), label: 'history'),])

        )
    );
  }
}




