

// آیتم کارد مشاهده ماموریت
import 'package:Prismaa/components/failResult_dialog.dart';
import 'package:Prismaa/components/result_dialog.dart';
import 'package:Prismaa/models/mission_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class ViewVerificationCardItems extends StatefulWidget {
  const ViewVerificationCardItems({Key? key}) : super(key: key);

  @override
  State<ViewVerificationCardItems> createState() => ViewVerificationCardItemsState();
}

class ViewVerificationCardItemsState extends State<ViewVerificationCardItems> {
  TextEditingController _controller= TextEditingController();
  TextEditingController _controller2= TextEditingController();
  @override
  void initState() {
    super.initState();
_controller.text="gfgfgf";
  }
  @override
  Widget build(BuildContext context) {
  TextEditingController _controller= TextEditingController();
  _controller.text="قبول نتیجه";
  _controller2.text="رد نتیجه";
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
                    // کادر خاکستری بالای کارد
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                          const SizedBox(width: 8),
                      // UserModel.picPath != "" ?
                      // CachedNetworkImage(
                      //   imageUrl: UserModel.picPath,
                      //   imageBuilder: (context, imageProvider) => CircleAvatar(
                      //     radius: 24,
                      //     backgroundColor: Colors.transparent,
                      //     backgroundImage: NetworkImage(UserModel.picPath),
                      //   ),
                      //   placeholder: (context, url) => const Center(child: SpinKitThreeBounce(color: Colors.black12, size: 25.0)),
                      //   errorWidget: (context, url, error) => const Icon(Icons.error),
                      // ):
                      //      const CircleAvatar(
                      //   radius: 24,
                      //   backgroundColor: Colors.transparent,
                      //   backgroundImage: AssetImage("assets/images/user_avatar.png"),
                      // ),
                      const SizedBox(width: 8),

                            Text('08:00' ,//+ missionsList[index].startTime,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12.sp),
                            ),

                            const Spacer(),
                            Text('زماندار مبتدی' ,//+ missionsList[index].startTime,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12.sp),
                            ),

])

                    ),

                    // محتوای درون کارد
                    Padding(
                      padding: EdgeInsets.all(16.sp),
                      child: Column(
                        children: [

                          SizedBox(
                            height: 5.sp,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                    Navigator.pushReplacementNamed(context, "/verification");
                                },child:
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(16.sp),
                                    color: Colors.white//.withOpacity(0.1)
                                ),
                                child: Text('مشاهده نتیجه',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 12.sp,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                              ),
                              SizedBox(width: 10,),

                              SizedBox(width:80,height: 40,child:


                              TextFormField(
                                //textAlignVertical: TextAlignVertical.top,
                                onTap: () {
                                  openFailResultDialog(setState,context, "j",_controller2);

                                },
                                textAlign: TextAlign.center,
                                readOnly: true,
                                controller: _controller2,

                                style:

                                Theme.of(context).textTheme.bodyText1!.copyWith(

                                    fontSize: 12.sp,
                                    color:_controller2.text=="رد شده" ?Colors.red: Colors.white
                                ),
                                decoration: InputDecoration(
                                  fillColor:_controller2.text=="رد شده" ?Colors.white:Colors.black, filled: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color:_controller2.text=="رد شده" ?Colors.white:Colors.black ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                    borderSide:  BorderSide(color:_controller2.text=="رد شده" ?Colors.white:Colors.black),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                    borderSide:  BorderSide(color: _controller2.text=="رد شده" ?Colors.white:Colors.black,),
                                  ),
                                ),
                              )),


                              SizedBox(width: 10,),

                            SizedBox(width:80,height: 40,child:


                            TextFormField(
      //textAlignVertical: TextAlignVertical.top,
                              onTap: () {
                                openResultDialog(setState,context, "j",_controller);

                              },
                                            textAlign: TextAlign.center,
                                          readOnly: true,
                                              controller: _controller,

                                              style:

                                              Theme.of(context).textTheme.bodyText1!.copyWith(

                                                         fontSize: 12.sp,
                                                         color:_controller.text=="قبول شده" ?Colors.green: Colors.white
                                                     ),
                                              decoration: InputDecoration(
                                                fillColor:_controller.text=="قبول شده" ?Colors.white:Colors.black, filled: true,
                                                     contentPadding: EdgeInsets.zero,
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(color:_controller.text=="قبول شده" ?Colors.white:Colors.black ),
                                                  borderRadius: BorderRadius.circular(16.0),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(16.0),
                                                  borderSide:  BorderSide(color:_controller.text=="قبول شده" ?Colors.white:Colors.black),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(16.0),
                                                  borderSide:  BorderSide(color: _controller.text=="قبول شده" ?Colors.white:Colors.black,),
                                                ),
                                          ),
                                    ))


                             //    ),
                             // ),
                            ],
                          ),
                          SizedBox(height: 16.sp),


                        ],
                      ),
                    )
                  ],
                )
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black.withOpacity(0.05)),
                ),
                child: Column(
                  children: [
                    // کادر خاکستری بالای کارد
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
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
                              // UserModel.picPath != "" ?
                              // CachedNetworkImage(
                              //   imageUrl: UserModel.picPath,
                              //   imageBuilder: (context, imageProvider) => CircleAvatar(
                              //     radius: 24,
                              //     backgroundColor: Colors.transparent,
                              //     backgroundImage: NetworkImage(UserModel.picPath),
                              //   ),
                              //   placeholder: (context, url) => const Center(child: SpinKitThreeBounce(color: Colors.black12, size: 25.0)),
                              //   errorWidget: (context, url, error) => const Icon(Icons.error),
                              // ):
                              //      const CircleAvatar(
                              //   radius: 24,
                              //   backgroundColor: Colors.transparent,
                              //   backgroundImage: AssetImage("assets/images/user_avatar.png"),
                              // ),
                              const SizedBox(width: 8),

                              Text('10:00' ,//+ missionsList[index].startTime,
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12.sp),
                              ),

                              const Spacer(),
                              Text('زماندار تصویری' ,//+ missionsList[index].startTime,
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12.sp),
                              ),

                            ])

                    ),

                    // محتوای درون کارد
                    Padding(
                      padding: EdgeInsets.all(16.sp),
                      child: Column(
                        children: [

                          SizedBox(
                            height: 5.sp,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  Navigator.pushReplacementNamed(context, "/verification");
                                },child:
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(16.sp),
                                    color: Colors.white//.withOpacity(0.1)
                                ),
                                child: Text('مشاهده نتیجه',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 12.sp,
                                      color: Colors.black
                                  ),
                                ),
                              ),
                              ),
                              const Spacer(),
                              SizedBox(width:80,height: 40,child:


                              TextFormField(
                                //textAlignVertical: TextAlignVertical.top,
                                onTap: () {
                                  openResultDialog(setState,context, "j",_controller);

                                },
                                textAlign: TextAlign.center,
                                readOnly: true,
                                controller: _controller,

                                style:

                                Theme.of(context).textTheme.bodyText1!.copyWith(

                                    fontSize: 12.sp,
                                    color:Colors.green
                                ),
                                decoration: InputDecoration(
                                  fillColor:Colors.white, filled: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color:Colors.white ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                    borderSide:  BorderSide(color:Colors.white),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                    borderSide:  BorderSide(color: Colors.white),
                                  ),
                                ),
                              ))


                              //    ),
                              // ),
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
}}