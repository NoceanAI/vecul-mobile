import 'package:flutter/cupertino.dart';
import 'package:vecul/core/data_sources/car_data_source.dart';
import 'package:vecul/core/models/car.dart';
import 'package:vecul/ui/exports.dart';

class DashboardViewModel extends BaseViewModel {
  final CarDataSource _carDataSource = CarDataSource();
  final NavigatorService _navService = locator<NavigatorService>();
  final DialogService _dialogService = locator<DialogService>();
  late final TextEditingController queryController = TextEditingController();

  List<Car> _cars = [];
  List<Car> filteredCars = [];
  String query = '';

  void initialise() {
    queryController.addListener(() {
      query = queryController.text;
      print(query);
      setFilteredData();
    });
    if (_cars.isNotEmpty) {
      return _listCarsInTheBackground();
    }
    return listCars();
  }

  void listCars() async {
    setBusy(true);
    try {
      _cars = await _carDataSource.listCars();
      setFilteredData();
      setBusy(false);
    } catch (e) {
      setBusy(false);
      _dialogService.showWarningDialog(e.toString());
    }
  }

  void _listCarsInTheBackground() async {
    try {
      _cars = await _carDataSource.listCars();
      setFilteredData();
    } catch (e) {
      _dialogService.showWarningDialog(e.toString());
    }
  }

  void setFilteredData() {
    filteredCars = _cars.where((car) {
      return [
        car.carDetail.model.contains(query.trim()),
        car.carDetail.make.contains(query.trim()),
      ].any((element) => element);
    }).toList();
    print(filteredCars);
    notifyListeners();
  }

  @override
  void dispose() {
    queryController.dispose();
    super.dispose();
  }
}
