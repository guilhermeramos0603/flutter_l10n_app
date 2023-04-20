import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;
  final String counterDescription;
  final void Function(int) onTapBottomBar;

  const HomePage(
      {super.key,
      required this.title,
      required this.counterDescription,
      required this.onTapBottomBar});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<int> _indexBottomBar = ValueNotifier<int>(0);

  void _incrementCounter() {
    _counter.value++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.counterDescription),
            ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, _) {
                  return Text(
                    value.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: _indexBottomBar,
          builder: (context, value, _) {
            return BottomNavigationBar(
              currentIndex: value,
              onTap: onTapBottomBar,
              items: [
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 25,
                    child: Image.asset('icons/flags/png/br.png',
                        package: 'country_icons'),
                  ),
                  label: 'Brasileiro',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 25,
                    child: Image.asset('icons/flags/png/us.png',
                        package: 'country_icons'),
                  ),
                  label: 'English',
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 25,
                    child: Image.asset('icons/flags/png/es.png',
                        package: 'country_icons'),
                  ),
                  label: 'Espanõl',
                ),
              ],
            );
          }), //
    );
  }

  void onTapBottomBar(int index) {
    _indexBottomBar.value = index;
    widget.onTapBottomBar(index);
  }
}
