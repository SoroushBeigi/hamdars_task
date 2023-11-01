import 'package:hamdars_task/common/utils/persian_numbers.dart';

class TimeConverter {
  static String minToClockFormat(int minutes) {
    int hours = minutes ~/ 60;
    int remainder = minutes.remainder(60);
    String hoursStr = hours < 10 ? '0$hours' : '$hours';
    String minutesStr = remainder < 10 ? '0$remainder' : '$remainder';
    return PersianNumbers.convertEnToFa('$hoursStr:$minutesStr');
  }
}
