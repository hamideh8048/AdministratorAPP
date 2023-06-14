import 'package:Prismaa/components/constants.dart';

import 'package:Prismaa/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';

import '../models/companyLeave_model.dart';


Future<void> openFailRequestDialog(StateSetter setState3, BuildContext context, String id,List<CompanyLeave>leaves,int index) async {
  TextEditingController _detailController= TextEditingController();
  final FocusNode _focusNode = FocusNode();
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.45,
            width: MediaQuery.of(context).size.width * 0.8,
            child:
            Column(
              children: [
              Text("دلیل رد کردن درخواست را بنویسید",

              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,

              ),
            ),
              SizedBox(height: 40,),
              SizedBox(
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width * 0.7,
            child:
            TextFormField(
              controller: _detailController,
              maxLines: 7,
              //obscureText: ,
              keyboardType: TextInputType.text,
              textDirection: TextDirection.rtl,
              autofillHints: const [AutofillHints.password],
              style: Theme.of(context).textTheme.bodyText1,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                labelText: 'توضیحات',
                labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22.sp),
                hintText: '',

                hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 14.sp,
                    color: Colors.black26
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide: const BorderSide(color: Colors.black12, width: 1.5),
                ),

              ),
              focusNode: _focusNode,
              onFieldSubmitted: null,
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
                            onTap: ()async{
                              //  Navigator.of(context).pop();

                               var response = await (Services()).sendConfirmRejectLeave(id,"2",_detailController.text);
                              if(response[0]["res"] == 1) {
                                 Navigator.of(context).pop();
                               String result = response[0]['msg'];
                               showSimpleNotification(
                               Text(result,
                               style: Theme.of(context).textTheme.bodyText1!.copyWith(
                               color: Colors.white
                               )),
                               background: Colors.green,
                               );
                                 setState3(() {
                                   leaves.removeAt(index);
                                 });
                             } else if(response[0]["res"] == 0){
                               String result = response[0]['msg'];
                               showSimpleNotification(
                               Text(result,
                               style: Theme.of(context).textTheme.bodyText1!.copyWith(
                               color: Colors.white
                               )),
                               background: Colors.red,
                               );

                               }
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
