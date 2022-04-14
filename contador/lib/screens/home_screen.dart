import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contador',
        ),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Número de clicks',
                style: titleStyle,
              ),
              Text('$counter', style: titleStyle)
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CounterButtons(
        increaseFn: increase,
        decreaseFn: decrease,
        resetFn: reset,
      ),
    );
  }
}

class CounterButtons extends StatelessWidget {
  final Function increaseFn, decreaseFn, resetFn;

  const CounterButtons({
    Key? key,
    required this.increaseFn,
    required this.decreaseFn,
    required this.resetFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () => decreaseFn(),
          child: const Icon(Icons.exposure_minus_1_outlined),
        ),
        const SizedBox(width: 25),
        FloatingActionButton(
          onPressed: () => resetFn(),
          child: const Icon(Icons.refresh_outlined),
        ),
        const SizedBox(width: 25),
        FloatingActionButton(
          onPressed: () => increaseFn(),
          child: const Icon(Icons.exposure_plus_1_outlined),
        ),
      ],
    );
  }
}
