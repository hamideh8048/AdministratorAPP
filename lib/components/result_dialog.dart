import 'package:Prismaa/components/constants.dart';
import 'package:Prismaa/components/get_persian_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


Future<void> openResultDialog(StateSetter setState2, BuildContext context, String text,TextEditingController controller) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.52,
            width: MediaQuery.of(context).size.width * 0.8,
            child:
            Column(
              children: [
              Text("زمان انجام کار: امروز  ساعت 12",
              maxLines: 7,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,

              ),
            ),
              SizedBox(height: 20,),
              SizedBox(
            height: MediaQuery.of(context).size.height * 0.39,
            width: MediaQuery.of(context).size.width * 0.7,
            child:
            Text("به اطلاع مدیریت محترم می‌رسانم که به دلیل درخواست شرکت مشتری‌مان، توانستیم درخواست طراحی لوگوی جدید شرکت را به خوبی انجام دهیم. در این پروژه، ما با تیم طراحی شرکت همکاری کردیم و پس از چندین نسخه طرح، نهایتاً تصویری را ارائه کردیم که به نظر مشتری جذاب و شناور بود. لوگوی جدید شرکت شامل یک طرح نوین با رنگ‌های شاد و قابل توجه است. این لوگوی جدید در تمام مستندات شرکت، وب‌سایت و محصولات به صورت کامل استفاده می‌شود.با توجه به رضایت مشتری، ما به اطمینان کامل می‌توانیم این پروژه را به پایان رسانده‌ایم.",
                maxLines: 14,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                //  fontWeight: FontWeight.bold,
                  fontSize: 14,
              ),
            ),
                    ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,

                      child: Container(
                          height: 50.sp,
                          decoration: BoxDecoration(
                            color:      buttonColor,

                            borderRadius: BorderRadius.circular(40),
                          ),
                          child:
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                              setState2(() {
                                controller.text="قبول شده";

                                // componentText("")
                                //  _controller.text = date;
                              });
                            },
                            child:
                            Center(
                              child: Text("رد نتیجه",
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),
                              ),
                            ),)
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      flex: 1,

                        child: Container(
                          height: 50.sp,
                          decoration: BoxDecoration(
                            color:      buttonColor,

                            borderRadius: BorderRadius.circular(40),
                          ),
                          child:
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).pop();
                              setState2(() {
                                controller.text="قبول شده";

                                // componentText("")
                              //  _controller.text = date;
                              });
                            },
                            child:
                          Center(
                            child: Text("تایید نتیجه",
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
