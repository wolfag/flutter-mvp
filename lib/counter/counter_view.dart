import 'package:flutter_mvp/mvp/mvp_view.dart';

abstract class CounterView extends MVPView {
  void onIncrement(int value);
  void onDecrement(int value);
}
