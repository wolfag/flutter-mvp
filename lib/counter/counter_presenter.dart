import 'package:flutter_mvp/counter/counter_view.dart';
import 'package:flutter_mvp/mvp/presenter.dart';

class CounterPresenter extends Presenter<CounterView> {
  int count = 0;
  increment() {
    count++;
    getView().onIncrement(count);
  }

  decrement() {
    count--;
    getView().onDecrement(count);
  }
}
