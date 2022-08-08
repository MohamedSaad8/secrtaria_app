import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDateInputFelid extends StatelessWidget {
  final void Function(DateTime) onChange;


  const CustomDateInputFelid({Key? key, required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10.0),
      ),
      height: 80.h,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.date,
        initialDateTime: DateTime(1998, 8, 8),
        onDateTimeChanged: onChange ,
        maximumDate: DateTime.now(),
        minimumDate: DateTime(1960, 1, 1),
        
      ),
    );
  }
}
