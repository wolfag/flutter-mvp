import 'package:flutter_mvp/mvp/mvp_view.dart';

class Presenter<T extends MVPView> {
  T view;
  attachView(T view) {
    this.view = view;
  }

  deattachView() {
    this.view = null;
  }

  T getView() {
    return this.view;
  }
}
