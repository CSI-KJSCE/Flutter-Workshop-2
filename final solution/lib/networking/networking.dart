import 'package:startingtemplate/Data/currentData.dart';
import 'package:startingtemplate/Data/data.dart';

dynamic getCurrentData() {
  dynamic data = CurrentData().currentData;
  print(data);
  return data;
}

dynamic getCityData(String cityName) {
  dynamic data = Data().data[cityName];
  if (data != null) {
    return data;
  } else {
    return getCurrentData();
  }
}
