import 'package:Prismaa/components/constants.dart';
import 'package:Prismaa/components/get_persian_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Future<void> openFailResultDialog(StateSetter setState3, BuildContext context, String text,TextEditingController controller2) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.48,
            width: MediaQuery.of(context).size.width * 0.8,
            child:
            Column(
              children: [
              Text("دلیل رد کردن نتیجه را بنویسید",
              maxLines: 7,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,

              ),
            ),
              SizedBox(height: 20,),
              SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.7,
            child:
            Text("ناقص بودن جزییات",
                maxLines: 7,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                //  fontWeight: FontWeight.bold,
                  fontSize: 14,
              ),
            ),
                    ),
                Row(
                  children: [
                    // دکمه مرخصی روزانه
                    // Expanded(
                    //   flex: 1,
                    //   child:  Container(
                    //       height: 50,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(40),
                    //       //  color:     Colors.blue,
                    //         border: Border.all(color: buttonColor),
                    //       ),
                    //       child: Center(
                    //         child: Text("رد نتیجه",
                    //           style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    //             fontSize: 14,
                    //             fontWeight: FontWeight.bold,
                    //             color: buttonColor,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    //
                    // SizedBox(width: 20.sp),
                    // دکمه مرخصی ساعتی
                    Expanded(
                      flex: 1,

                        child:
                        GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                              setState3(() {
                                controller2.text="رد شده";

                                // componentText("")
                                //  _controller.text = date;
                              });
                            },
                            child:
                        Container(
                          height: 50.sp,
                          decoration: BoxDecoration(
                            color:      buttonColor,

                            borderRadius: BorderRadius.circular(40),
                          ),
                          child:

                          Center(
                            child: Text("ثبت",
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                          ),)
                        ),
                      ),

                  ],
                ),
])
            // GetPersianDate(dateChangeListener: (String date) {
            //   setState2(() {
            //
            //   });
            // })
        ),
      );
    },
  );
}
