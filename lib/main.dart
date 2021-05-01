import 'package:flutter/material.dart';
import 'package:flutter_mvp/counter/counter_presenter.dart';
import 'package:flutter_mvp/counter/counter_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVP',
      home: Scaffold(
        appBar: AppBar(
          title: Text('MVP'),
        ),
        body: Counter(),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  Counter({Key key}) : super(key: key);

  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> implements CounterView {
  int count = 0;
  CounterPresenter presenter;
  _CounterState() {
    presenter = CounterPresenter();
    presenter.attachView(this);
  }

  @override
  dispose() {
    super.dispose();
    if (presenter != null) {
      presenter.deattachView();
    }
  }

  onMinus() {
    presenter.decrement();
  }

  onPlus() {
    presenter.increment();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: onMinus,
            child: Text(
              '-',
              style: TextStyle(fontSize: 50),
            ),
          ),
          Text(
            count.toString(),
            style: TextStyle(fontSize: 50),
          ),
          TextButton(
            onPressed: onPlus,
            child: Text(
              '+',
              style: TextStyle(fontSize: 50),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onDecrement(int value) {
    setState(() {
      count = value;
    });
  }

  @override
  void onIncrement(int value) {
    setState(() {
      count = value;
    });
  }
}
