import 'package:flutter/material.dart';

// BottomNavBar que a pessoa pode customizar a vontade para servir de atalho.
// Ela pode escolher até 3 funções, porem a principal sempre estará no canto direito(Ou esquerdo)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Selecione Apenas 3 controles',
            ),
            Container(
              height: 300,
              width: 300,
              child: GridButtons(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

const iconList = [
  Icons.add_alert_outlined,
  Icons.baby_changing_station,
  Icons.cabin,
  Icons.dangerous,
  Icons.e_mobiledata,
  Icons.face,
  Icons.g_mobiledata,
  Icons.h_mobiledata,
  Icons.ice_skating,
];

class GridButtons extends StatefulWidget {
  const GridButtons({Key? key}) : super(key: key);

  @override
  State<GridButtons> createState() => _GridButtonsState();
}

class _GridButtonsState extends State<GridButtons> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      children: iconList.map(
        (icon) => InkWell(
          onTap: (){
            print(icon);
          },
          child: Container(
            margin: EdgeInsets.all(8),
            color: Colors.red,
            child: Center(
              child: Icon(icon),
            ),
          ),
        ),
      ).toList(),
    );
  }
}

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return const _DemoBottomAppBar();
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
    this.icons = const [
      Icons.menu,
      Icons.search,
      Icons.favorite,
    ],
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  final List<IconData> icons;

  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.blue,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            IconButton(
              tooltip: 'Open navigation menu',
              icon: Icon(icons[0]),
              onPressed: () {},
            ),
            if (centerLocations.contains(fabLocation)) const Spacer(),
            IconButton(
              tooltip: 'Search',
              icon: Icon(icons[1]),
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'Favorite',
              icon: Icon(icons[2]),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
