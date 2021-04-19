import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget  {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;
  TabController _tabController;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        child: Stack(
          children: [
            TabBarView(controller: _tabController ,
                children: [
                  Center(
                    child: MyTab('first'),
                  ),
                  Center(
                    child: MyTab('second'),
                  ),
                  Center(
                    child: MyTab('third'),
                  ),
                  Center(
                    child: MyTab('third'),
                  ),
                  Center(
                    child: MyTab('third'),
                  ),
                  Center(
                    child: MyTab('third'),
                  ),
            ]),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.8)),
                child: TabBar(
                    indicator: CustomTabIndicator(),
                    isScrollable: true,
                    controller: _tabController,
                    tabs: [
                      Tab(text: 'Информация'),
                      Tab(text: 'Активный спикер',),
                      Tab(text: 'Арбитр'),
                      Tab(text: 'Игроки'),
                      Tab(text: 'Секунданты'),
                      Tab(text: 'Судьи'),
                    ]
                ),
              ),
            )

          ],
        ),
      )
    );
  }
}

class MyTabLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
      child: Text('test'),
    );
  }

}

// ignore: must_be_immutable
class MyTab extends StatefulWidget {

  String title;

  MyTab(this.title);

  @override
  State<StatefulWidget> createState() => MyTabState();
}

class MyTabState extends State<MyTab> {
  @override
  void initState() {
    super.initState();
    print('init ${this.widget.title}');
  }
  @override
  void dispose() {
    print('dispose ${this.widget.title}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(this.widget.title);
  }
}

class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback onChanged]) {
    return new _CustomPainter(this, onChanged);
  }
  
}

class _CustomPainter extends BoxPainter {
  final CustomTabIndicator decoration;
  _CustomPainter(this.decoration, VoidCallback onChanged)
    :assert(decoration != null),
    super(onChanged);


  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);


    final Rect rect = offset & configuration.size;
    final Paint paint = Paint();
    paint.color = Colors.blueAccent;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(10.0)), paint);
  }
}