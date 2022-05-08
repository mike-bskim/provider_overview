import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum AppState {
  initial,
  loading,
  success,
  error,
}

class AppProvider with ChangeNotifier {
  AppState _state = AppState.initial;
  AppState get state => _state;

  Future<void> getResult(String searchTerm) async {
    _state = AppState.loading;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    try {
      if (searchTerm == 'fail') {
        throw 'Something went wrong';
      }

      _state = AppState.success;
      notifyListeners();
      // Navigator.push(context, MaterialPageRoute(
      //   builder: (context) {
      //     return SuccessPage();
      //   },
      // ));
    } catch (e) {
      _state = AppState.error;
      notifyListeners();
      // rethrow; // 이걸 한번더 해줘야 호출한 main.dart 에서도 catch 문이 동작함.
      // showDialog(
      //   context: context,
      //   builder: (context) {
      //     return AlertDialog(
      //       content: Text('Something went wrong'),
      //     );
      //   },
      // );
    }
  }
}
