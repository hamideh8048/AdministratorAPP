

// آیتم کارد مشاهده ماموریت
import 'package:Prismaa/components/failRequest_dialog.dart';
import 'package:Prismaa/components/failResult_dialog.dart';
import 'package:Prismaa/components/result_dialog.dart';
import 'package:Prismaa/models/mission_model.dart';
import 'package:flutter/material.dart';
import 'package:Prismaa/models/companyLeave_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class view_kartable2_card_item extends StatefulWidget {
  const view_kartable2_card_item({Key? key,required this.index,required this. leaveList}) : super(key: key);
  final int index;
  final List<CompanyLeave> leaveList;

  @override
  State<view_kartable2_card_item> createState() => view_kartable2_card_itemState();
}

class view_kartable2_card_itemState extends State<view_kartable2_card_item> {
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
                              const CircleAvatar(
                                radius: 24,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage("assets/images/user_avatar.png"),
                              ),
                              const SizedBox(width: 8),

                              Text(widget. leaveList[widget. index].name,
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12.sp),
                              ),

                              const Spacer(),
                              SizedBox(height: 20,width: 120,child:

                              Text(widget. leaveList[widget. index].title,
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
                              Text('از ساعت: ' +widget. leaveList[widget. index].startTime,
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15.sp),
                              ),
                              SizedBox(
                                width: 30.sp,
                              ),
                              Text('  تا ساعت:'+widget. leaveList[widget. index].endTime,
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
                           //   _controller.text.contains("قبول")? SizedBox(width: 1,):
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

                                    setState(()
                                    {
                                      if (widget.index <widget. leaveList.length){
                                        widget.leaveList.removeAt(widget.index);
                                        // Navigator.of(context).pop();
                                      }});

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
}}
