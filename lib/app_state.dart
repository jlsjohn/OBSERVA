import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _animalActive = prefs.getBool('ff_animalActive') ?? _animalActive;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _animalActive = false;
  bool get animalActive => _animalActive;
  set animalActive(bool _value) {
    _animalActive = _value;
    prefs.setBool('ff_animalActive', _value);
  }

  final _listViewLocalManager = StreamRequestManager<List<CitiesRecord>>();
  Stream<List<CitiesRecord>> listViewLocal({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CitiesRecord>> Function() requestFn,
  }) =>
      _listViewLocalManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearListViewLocalCache() => _listViewLocalManager.clear();
  void clearListViewLocalCacheKey(String? uniqueKey) =>
      _listViewLocalManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
