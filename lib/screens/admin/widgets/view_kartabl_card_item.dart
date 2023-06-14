
import 'package:Prismaa/models/companyLeave_model.dart';
import 'package:Prismaa/models/mission_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


Widget viewKartablCardItems(  int index,List<CompanyLeave> leaveList) {
  TextEditingController _controller= TextEditingController();
  _controller.text="dfsd";
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState){
      return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 5.sp),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black.withOpacity(0.05)),
                ),
                child: Column(
                  children: [

                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 5.sp),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.sp),
                              topRight: Radius.circular(15.sp)
                          )
                      ),
                      child:

                      Row(
                          children: [
                          const SizedBox(width: 8),

                           const CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage("assets/images/user_avatar.png"),
                      ),
                      const SizedBox(width: 8),

                            Text( leaveList[index].name,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12.sp),
                            ),

                            const Spacer(),
                            SizedBox(height: 20,width: 120,child:

                        Text( leaveList[index].title,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12.sp),
                            )),
                          ])


                    ),


                    Padding(
                      padding: EdgeInsets.all(16.sp),
                      child: Column(
                        children: [

                          SizedBox(
                            height: 5.sp,
                          ),

                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.only(right: 16.sp)),
                                  Image(
                                      height: 16.sp,
                                      image: const AssetImage('assets/images/clock.png')),
                                  SizedBox(width: 4.sp),
                                  Text('از ساعت: ' +leaveList[index].startTime,
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.sp),
                                  ),
                                  SizedBox(
                                    width: 30.sp,
                                  ),
                                  Text('  تا ساعت:'+leaveList[index].endTime,
                                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.sp)
                                  ),
                                  SizedBox(
                                    width: 20.sp,
                                  ),

                                ],
                              ),
                          SizedBox(height: 24.sp),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _controller.text.contains("قبول")? SizedBox(width: 1,):
                              GestureDetector(
                                onTap: (){
                                  setState(() {

                                  });
                                },
                                child:
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                                decoration: BoxDecoration(
                                    border:_controller.text.contains("رد")? Border.all(color: Colors.white): Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(16.sp),
                                    color: Colors.white//.withOpacity(0.1)
                                ),
                                child: Text(_controller.text.contains("رد")?"رد شده ":'رد درخواست',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 12.sp,
                                      color:_controller.text.contains("رد")?Colors.red: Colors.black
                                  ),
                                ),
                              )),
                              SizedBox(width: 10,),
                              _controller.text.contains("رد")? SizedBox(width: 1,):
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                                decoration: BoxDecoration(
                                    border:_controller.text.contains("قبول")? Border.all(color: Colors.white): Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(16.sp),
                                    color: _controller.text.contains("قبول")?Colors.white: Colors.black//.withOpacity(0.1)
                                ),
                                child:
                                            GestureDetector(
                                                onTap: ()async{
                                          // var response = await (Services()).sendConfirmRejectLeave(leaveList[index].id,"1","");
                                          //
                                          //         if(response[0]["res"] == 1) {
                                          //           String result = response[0]['msg'];
                                          //           showSimpleNotification(
                                          //             Text(result,
                                          //                 style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          //                     color: Colors.white
                                          //                 )),
                                          //             background: Colors.green,
                                          //           );
                                          //           // setState3(() {
                                          //           //   controller2.text = "رد شده";
                                          //           // });
                                          //           //  //  setState(() {//    buttonLoading = false;});
                                          //         } else if(response[0]["res"] == 0){
                                          //           String result = response[0]['msg'];
                                          //           showSimpleNotification(
                                          //             Text(result,
                                          //                 style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          //                     color: Colors.white
                                          //                 )),
                                          //             background: Colors.red,
                                          //           );
                                          //           // setState(() => buttonLoading = false);
                                          //         }
                                                  setState(()
                                                    {
                                                      if (index <leaveList.length){
                                                    leaveList.removeAt(index);
                                                    // Navigator.of(context).pop();
                                                    }});



                                                  //  controller2.text = "رد شده";

                                                },

                                                child:
                                                          Text(_controller.text.contains("قبول")?'تایید شده':'قبول درخواست',

                                                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                                          fontSize: 12.sp,
                                                          color:_controller.text.contains("قبول")?Colors.green: Colors.white
                                                          ),
                                            ),

                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 16.sp),


                        ],
                      ),
                    )
                  ],
                )
            ),
          ],
        ),
      );
    },
  );
}

// ویو دکمه شروع
Widget startButton(BuildContext context, StateSetter setState, Function(String id) sendStartMission, List<MissionModel> missionsList, int index){
  return GestureDetector(
      onTap: () {
        setState(() {
          sendStartMission(missionsList[index].id);
        });
      },
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.sp),
            color: Colors.blue,
          ),
          child: Center(
              child: Text('شروع',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 16.sp,
                    color: Colors.white
                ),
              )
          )
      )
  );
}


// ویو دکمه توقف و ثبت توضیح
Widget endButton(BuildContext context, StateSetter setState, Function(String id) sendEndMission, List<MissionModel> missionsList, int index, bool showStopButton, Function(String id, MissionModel missionModel) explainRecord){
  return Column(
    children: [
      // ردیف نمایش مدت زمان گذشته
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('مدت زمان گذشته',
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 14.sp,
                color: Colors.black.withOpacity(0.6)
            ),
          ),
          const Spacer(),

          // باکس نمایش مدت دقیقه گذشته
          Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 6.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      border: Border.all(color: Colors.black.withOpacity(0.2))
                  ),
                  child: Text("- -",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 17.sp),
                  )
              ),
              Text('دقیقه',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 12.sp,
                    color: Colors.black.withOpacity(0.3)
                ),
              )
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.sp),
            child: Text(' : ',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 17.sp),
            ),
          ),

          // باکس نمایش مدت ساعت گذشته
          Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 6.sp),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      border: Border.all(color: Colors.black.withOpacity(0.2))
                  ),
                  child: Text("- -",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 17.sp),
                  )
              ),
              Text('ساعت',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 12.sp,
                    color: Colors.black.withOpacity(0.3)
                ),
              )
            ],
          ),
        ],
      ),
      SizedBox(height: 8.sp),

      // دکمه های توقف و ثبت توضیح
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // دکمه توقف
          if(showStopButton)
            GestureDetector(
              onTap: () {
                setState((){
                  sendEndMission(missionsList[index].id);
                });
              },
              child: Container(
                width: Get.width * 0.58,
                decoration: BoxDecoration(
                  color: const Color(0xfff19e38),
                  borderRadius: BorderRadius.circular(30.sp)
                ),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Center(
                  child: Text('توقف',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16.sp,
                        color: Colors.white
                    ),
                  )
                )
              )
          ),

          // دکمه ثبت توضیح
          GestureDetector(
              onTap: () {
                explainRecord(missionsList[index].id, missionsList[index]);
              },
              child: Container(
                width: Get.width * 0.25,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.sp),
                color: Colors.black.withOpacity(0.6),
                ),
                child: Center(
                  child: Text('ثبت توضیح',
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16.sp,
                        color: Colors.white
                    ),
                  )
                )
              )
          ),
        ],
      )
    ],
  );
}