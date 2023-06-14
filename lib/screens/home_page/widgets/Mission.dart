import 'package:Prismaa/components/constants.dart';
import 'package:Prismaa/components/date_dialog.dart';
import 'package:Prismaa/components/user_controller.dart';
import 'package:Prismaa/models/taradod_list_model.dart';
import 'package:Prismaa/models/user_model.dart';
import 'package:Prismaa/screens/admin/widgets/view_kartabl_card_item.dart';
import 'package:Prismaa/services/services.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shamsi_date/shamsi_date.dart';

class Mission extends StatefulWidget {
  const Mission({Key? key,required  this.taradod}) : super(key: key);

 final TaradodListModel taradod;
  @override
  State<Mission> createState() => MissionState();
}

class MissionState extends State<Mission> {
  bool pageLoading = false;
  bool morkhasiKind = true;
  bool buttonLoading = false;
  final DateTime _dateTime = DateTime.now();
  TextEditingController _dateFromController= TextEditingController();
  TextEditingController _dateToController= TextEditingController();
  TextEditingController _startMinuteCtrl= TextEditingController();
  TextEditingController _startHourMinuteCtrl= TextEditingController();
  TextEditingController _endHourMinuteCtrl= TextEditingController();
  TextEditingController _startHourCtrl=TextEditingController();
  TextEditingController _endMinuteCtrl= TextEditingController();
  TextEditingController _endHourCtrl= TextEditingController();
  TextEditingController _addressCtrl= TextEditingController();
  final TextEditingController _missionName = TextEditingController();
  final TextEditingController _missionTitle = TextEditingController();
  final TextEditingController _missionDesc = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final FocusNode _focusNode3 = FocusNode();
  final FocusNode _focusNode4 = FocusNode();
  Jalali jNow = Jalali.now();
  refresh() {
    setState(() {
      if(mounted){
        // UserModel.name;
        // UserModel.family;
        // getProfilePic();
      }
    });
  }
  String getToday(Date d) {
    final f = d.formatter;
    return '${f.d} ${f.mN} ${f.yyyy}';
  }

  @override
  void dispose() {
    //_dateController.dispose();
    _startHourCtrl.dispose();
    _startMinuteCtrl.dispose();
    _endHourCtrl.dispose();
    _endMinuteCtrl.dispose();
    _endHourMinuteCtrl.dispose();
    _startHourMinuteCtrl.dispose();
    _dateFromController.dispose();
    _dateToController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                            height: 45.sp,
                            width: 45.sp,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black87),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset("assets/images/arrow_back.png")
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text("ثبت ماموریت",
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 26.sp,
                            ),
                          ),
                          Text(getToday(jNow),
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              // fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                color: Colors.black38
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 30.sp,
                        width: 28.sp,
                        child: Image.asset("assets/images/notification_kartabl.png", fit: BoxFit.fill),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
      ),

      body: pageLoading
      ? const Center(child: SpinKitThreeBounce(color: Colors.black12, size: 25.0))
      :
      NestedScrollView(
        headerSliverBuilder: (context, value){
          return [
            SliverAppBar(
              floating: false,
              pinned: false,
              expandedHeight: MediaQuery.of(context).size.height.sp * 0.3,
              backgroundColor: Colors.white,
              centerTitle: false,
              stretch: true,
              leading: const SizedBox(),
              leadingWidth: 0,

              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left:16.0.sp,right:16.0.sp,top:0.0.sp),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // عکس پروفایل
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                // حاشیه سفید عکس پروفایل
                                Container(
                                  height: 150.sp,
                                  width: 150.sp,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 2,
                                        blurRadius: 10,
                                        offset: const Offset(0, 0), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                ),

                                widget.taradod.personel_pic != ""
                                ?
                                CachedNetworkImage(
                                  imageUrl: widget.taradod.personel_pic ,
                                  imageBuilder: (context, imageProvider) => Container(
                                    height: 135.sp,
                                    width: 135.sp,
                                    // padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      image: DecorationImage(
                                        image: NetworkImage( widget.taradod.personel_pic ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) => const Center(child: SpinKitThreeBounce(color: Colors.black12, size: 25.0)),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                )
                                :
                                // تصویر پروفایل
                                Container(
                                  height: 135.sp,
                                  width: 135.sp,
                                  // padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: const DecorationImage(
                                      image: AssetImage("assets/images/user_avatar.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                           SizedBox(height: 16.sp),
                            Text(  widget.taradod.personel,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black.withOpacity(0.8),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10.sp),
                            Text("کد پرسنلی : " +   widget.taradod.personel_code,
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                color: Colors.black.withOpacity(0.7),
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                            ),
                            SizedBox(height: 10.sp),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),


            ),
          ];
        },

        body: SingleChildScrollView(
          child:
    Padding(
    padding: EdgeInsets.only(left:16.0.sp,right:26.0.sp,top:10.0.sp),
    child:
    Column(
            children: [
              SizedBox(height: 20,),

              TextFormField(
                controller: _missionTitle,
                //obscureText: ,
                keyboardType: TextInputType.text,
                validator: (String? value){
                  if(value == ""){
                    return "این فیلد نباید خالی باشد";
                  } else {
                    return null;
                  }
                },
                textDirection: TextDirection.rtl,

                style: Theme.of(context).textTheme.bodyText1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  labelText: 'موضوع ماموریت',
                  labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22.sp),
                  hintText: '',
                  hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 12.sp,
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
                focusNode: _focusNode2,
                onFieldSubmitted: null,
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: _missionDesc,
                maxLines: 5,
                //obscureText: ,
                keyboardType: TextInputType.multiline,
               // keyboardType: TextInputType.text,
                textDirection: TextDirection.rtl,
                autofillHints: const [AutofillHints.password],
                style: Theme.of(context).textTheme.bodyText1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  labelText: 'َشرح ماموریت',
                  labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22.sp),
                  hintText: '',

                  hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 12.sp,
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
                focusNode: _focusNode3,
                onFieldSubmitted: null,
              ),
              SizedBox(height: 20.sp),
              Row(
                children: [
                  // دکمه ماموریت روزانه
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => setState(() {
                       morkhasiKind = false;
                      }),
                      child: Container(
                        height: 60.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          color:      !morkhasiKind ?  Colors.black:Colors.white,

                        ),
                        child: Center(
                          child: Text("ماموریت روزانه",
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: morkhasiKind ?  Colors.black:Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.sp),
                  // دکمه ماموریت ساعتی
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () => setState(() {
                      morkhasiKind = true;
                      }),
                      child: Container(
                        height: 60.sp,
                        decoration: BoxDecoration(
                            color:         morkhasiKind ?  Colors.black:Colors.white,
                            borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text("ماموریت ساعتی",
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color:         !morkhasiKind ?  Colors.black:Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.sp),
              Material(
                color: backgroundColor,
                child: TextFormField(
                  readOnly: true,
                  controller: _dateFromController,
                  onTap: (){
                    setState(() {
                      openGetDateDialog(setState, context, _dateFromController);
                    });
                  },
                  validator: (String? value){
                    if(value == ""){
                      return "این فیلد نباید خالی باشد";
                    } else {
                      return null;
                    }
                  },
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    suffixIcon: _dateFromController.text != ""
                        ? IconButton(
                        onPressed: (){
                          setState(() => _dateFromController.text = "");
                        },
                      icon: Image.asset(
                        'assets/images/filter2.png',
                      ),
                    )
                        : const SizedBox(),
                    labelText: morkhasiKind?"تاریخ": "از تاریخ",
                    labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22.sp),
                    hintText: "لطفا یک تاریخ انتخاب کنید",
                    hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14.sp,
                        color: Colors.black26
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: const BorderSide(
                          color: Colors.black12, width: 1.5),
                    ),
                    // prefixIcon: Icon(prefixIcon, color: Colors.black12),
                  ),
                ),
              ),
              SizedBox(height: 20.sp),
              morkhasiKind?
              SizedBox(height: 1,):
              Material(
                color: backgroundColor,
                child: TextFormField(
                  readOnly: true,
                  controller: _dateToController,
                  onTap: (){
                    setState(() {
                      openGetDateDialog(setState, context, _dateToController);
                    });
                  },
                  validator: (String? value){
                    if(value == ""){
                      return "این فیلد نباید خالی باشد";
                    } else {
                      return null;
                    }
                  },
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    suffixIcon:
                    _dateFromController.text != "" ?
                    IconButton(
                        onPressed: (){
                          setState(() => _dateFromController.text = "");
                        },
                        icon: Image.asset(
                          'assets/images/filter2.png',
                        ),
                    )
                        : const SizedBox(),
                    labelText: "تا تاریخ",
                    labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22.sp),
                    hintText: "لطفا یک تاریخ انتخاب کنید",
                    hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14.sp,
                        color: Colors.black26
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: const BorderSide(
                          color: Colors.black12, width: 1.5),
                    ),
                    // prefixIcon: Icon(prefixIcon, color: Colors.black12),
                  ),
                ),
              ),
              SizedBox(height: 20.sp),
              Material(
                color: backgroundColor,
                child: TextFormField(
                  readOnly: true,
                  controller: _startHourMinuteCtrl,
                  onTap: (){
                    setState(() {
                      chooseTime(context, _startMinuteCtrl, _startHourCtrl, _dateTime);

                     // openGetDateDialog(setState, context, _dateToController);
                    });
                  },
                  validator: (String? value){
                    if(value == ""){
                      return "این فیلد نباید خالی باشد";
                    } else {
                      return null;
                    }
                  },
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    suffixIcon:
                    _startHourMinuteCtrl.text.trim() != "" ?
                    IconButton(
                        onPressed: (){
                          setState(() => _startHourMinuteCtrl.text = "");
                        },
                        icon: const Icon(Icons.cancel_outlined)
                    )
                        : const SizedBox(),
                    labelText: " از ساعت",
                    labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22.sp),
                    hintText: "لطفا یک ساعت انتخاب کنید",
                    hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14.sp,
                        color: Colors.black26
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: const BorderSide(
                          color: Colors.black12, width: 1.5),
                    ),
                    // prefixIcon: Icon(prefixIcon, color: Colors.black12),
                  ),
                ),
              ),
              SizedBox(height: 20.sp),
              Material(
                color: backgroundColor,
                child: TextFormField(
                  readOnly: true,
                  controller: _endHourMinuteCtrl,
                  onTap: (){
                    setState(() {
                      chooseTime2(context, _endMinuteCtrl, _endHourCtrl, _dateTime);

                      // openGetDateDialog(setState, context, _dateToController);
                    });
                  },
                  validator: (String? value){
                    if(value == ""){
                      return "این فیلد نباید خالی باشد";
                    } else {
                      return null;
                    }
                  },
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    suffixIcon:
                    _endHourMinuteCtrl.text.trim() != "" ?
                    IconButton(
                        onPressed: (){
                          setState(() => _endHourMinuteCtrl.text = "");
                        },
                        icon: const Icon(Icons.cancel_outlined)
                    )
                        : const SizedBox(),
                    labelText: "تا ساعت",
                    labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22.sp),
                    hintText: "لطفا یک ساعت انتخاب کنید",
                    hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14.sp,
                        color: Colors.black26
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: const BorderSide(
                          color: Colors.black12, width: 1.5),
                    ),
                    // prefixIcon: Icon(prefixIcon, color: Colors.black12),
                  ),
                ),
              ),
              SizedBox(height: 20.sp),
              TextFormField(
                controller: _addressCtrl,
                maxLines: 5,
                //obscureText: ,
                keyboardType: TextInputType.multiline,
                // keyboardType: TextInputType.text,
                textDirection: TextDirection.rtl,
               // autofillHints: const [AutofillHints.password],
                style: Theme.of(context).textTheme.bodyText1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  labelText: 'آدرس',
                  labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22.sp),
                  hintText: '',

                  hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 12.sp,
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

                onFieldSubmitted: null,
              ),
              SizedBox(height: 20.sp),
      GestureDetector(
        onTap: ()async{
          setState(() => buttonLoading = true);
          if(_dateToController.text.trim().length<2)
            _dateToController.text=_dateFromController.text;
          //var response = await (Services()).addPeronelActivity("exp","49","34","salam","16:00","13402/03/03");
          var response = await (Services()).addMission(_missionDesc.text,widget.taradod.company_personel_id,UserModel.comapnyId,_missionTitle.text,_dateFromController.text,_dateToController.text,_startHourMinuteCtrl.text,_endHourMinuteCtrl.text,"1",_addressCtrl.text,"a","31","31",morkhasiKind==true?"1":"2");//روزانه 1
          //var response = await (Services()).getPersonelTrafficToServer("34","","50","1");
          if(response[0]["res"] == 1) {
            Navigator.of(context).pop();
            _dateToController.clear();
            _endHourMinuteCtrl.clear();
            _startHourMinuteCtrl.clear();
            _dateFromController.clear();
            _startHourCtrl.clear();
            _startMinuteCtrl.clear();
            _endHourCtrl.clear();
            _endMinuteCtrl.clear();
            String result = response[0]['msg'];
            showSimpleNotification(
              Text(result,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white
                  )),
              background: Colors.green,
            );
            setState(() {buttonLoading = false;});
          } else if(response[0]["res"] == 0){
            String result = response[0]['msg'];
            showSimpleNotification(
              Text(result,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white
                  )),
              background: Colors.red,
            );
            setState(() => buttonLoading = false);
          } else { // when it is -1
            Navigator.pushReplacementNamed(context, "/");
            setState(() => buttonLoading = false);
          }

        },

        child:
        buttonLoading
            ?   const Center(child: SpinKitThreeBounce(color: Colors.blue, size: 25.0))
            :
              Container(
                height: 70.sp,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: buttonColor,
                    borderRadius: BorderRadius.all(Radius.circular(40))
                ),
                child: Center(
                  child: Text("ثبت",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: Colors.white
                    ),
                  ),
                ),
              )),
              // Row(
              //   children: [
              //     // زمان شروع
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text("زمان شروع",
              //           style: Theme
              //               .of(context)
              //               .textTheme
              //               .bodyText1!
              //               .copyWith(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 16.sp,
              //           ),
              //         ),
              //         SizedBox(height: 12.sp),
              //         Row(
              //           children: [
              //             GestureDetector(
              //                 onTap: (){
              //                   chooseTime(context, _startMinuteCtrl, _startHourCtrl, _dateTime);
              //                 },
              //                 child: timeTextForm(_startHourCtrl, context)
              //             ),
              //             Text("  :  ",
              //               style: Theme
              //                   .of(context)
              //                   .textTheme
              //                   .bodyText1!
              //                   .copyWith(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 20.sp,
              //               ),
              //             ),
              //             GestureDetector(
              //                 onTap: (){
              //                   chooseTime(context, _startMinuteCtrl, _startHourCtrl, _dateTime);
              //                 },
              //                 child: timeTextForm(_startMinuteCtrl, context)
              //             ),
              //           ],
              //         )
              //       ],
              //     ),
              //     const Spacer(),
              //
              //     // زمان پایان
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text("زمان پایان",
              //           style: Theme
              //               .of(context)
              //               .textTheme
              //               .bodyText1!
              //               .copyWith(
              //             fontWeight: FontWeight.bold,
              //             fontSize: 16.sp,
              //           ),
              //         ),
              //         const SizedBox(height: 12),
              //         Row(
              //           children: [
              //             GestureDetector(
              //                 onTap: (){
              //                   chooseTime2(context, _endHourCtrl, _endMinuteCtrl, _dateTime);
              //                 },
              //                 child: timeTextForm(_endMinuteCtrl, context)
              //             ),
              //             Text("  :  ",
              //               style: Theme
              //                   .of(context)
              //                   .textTheme
              //                   .bodyText1!
              //                   .copyWith(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 20.sp,
              //               ),
              //             ),
              //             GestureDetector(
              //               onTap: (){
              //                 chooseTime2(context, _endHourCtrl, _endMinuteCtrl, _dateTime);
              //               },
              //               child: timeTextForm(_endHourCtrl, context),
              //             ),
              //           ],
              //         )
              //       ],
              //     ),
              //   ],
              // ),
            ],
          ),)
        ),
      )


    );
  }


  chooseTime(BuildContext context, TextEditingController _startHourCtrl, TextEditingController _startMinuteCtrl, DateTime _dateTime) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (BuildContext context){
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState){
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  color: backgroundColor,
                  padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(flex: 1, child: SizedBox()),
                      // مشاهده دکمه  تایید ساعت
                      Expanded(
                        flex: 5,
                        child: InkWell(
                            onTap: (){
                              _startHourCtrl.text = _dateTime.toJalali().hour.toString();
                              _startMinuteCtrl.text = _dateTime.toJalali().minute.toString();
                              _startHourMinuteCtrl.text= _dateTime.toJalali().hour.toString()+":"+ _dateTime.toJalali().minute.toString();
                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: EdgeInsets.all(12.0.sp),
                              child: Text("تایید ساعت",
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            )
                        ),
                      ),


                      // مشاهده زمان برای انتخاب
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            SizedBox(height: 8.sp),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 26.sp, vertical: 8.sp),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("دقیقه",
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 30.sp),

                                  Text("ساعت",
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.grey.withOpacity(0.3), indent: 16.sp, height: 12.sp, thickness: 1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: TimePickerSpinner(
                                    is24HourMode: true,
                                    normalTextStyle: TextStyle(
                                      fontSize: 20.0.sp,
                                    ),
                                    highlightedTextStyle: TextStyle(
                                      fontSize: 20.0.sp,
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    // spacing: 50,
                                    itemHeight: 55.sp,
                                    isForce2Digits: true,
                                    onTimeChange: (time) {
                                      setState(() {
                                        _dateTime = time;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Expanded(flex: 1, child: SizedBox()),

                    ],
                  ),
                );
              }
          );
        }
    );
  }



  chooseTime2(BuildContext context, TextEditingController _endHourCtrl, TextEditingController _endMinuteCtrl, DateTime _dateTime) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        builder: (BuildContext context){
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState){
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.35,
                  color: backgroundColor,
                  padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Expanded(flex: 1, child: SizedBox()),
                      // مشاهده دکمه  تایید ساعت
                      Expanded(
                        flex: 5,
                        child: InkWell(
                            onTap: (){
                              _endHourCtrl.text = _dateTime.toJalali().hour.toString();
                              _endMinuteCtrl.text = _dateTime.toJalali().minute.toString();
                              _endHourMinuteCtrl.text= _dateTime.toJalali().hour.toString()+":"+ _dateTime.toJalali().minute.toString();

                              Navigator.of(context).pop();
                            },
                            child: Padding(
                              padding: EdgeInsets.all(12.0.sp),
                              child: Text("تایید ساعت",
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            )
                        ),
                      ),


                      // مشاهده زمان برای انتخاب
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            SizedBox(height: 8.sp),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 26.sp, vertical: 8.sp),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("دقیقه",
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 30.sp),

                                  Text("ساعت",
                                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(color: Colors.grey.withOpacity(0.3), indent: 16.sp, height: 12.sp, thickness: 1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: TimePickerSpinner(
                                    is24HourMode: true,
                                    normalTextStyle: TextStyle(
                                      fontSize: 20.0.sp,
                                    ),
                                    highlightedTextStyle: TextStyle(
                                      fontSize: 20.0.sp,
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    // spacing: 50,
                                    itemHeight: 55.sp,
                                    isForce2Digits: true,
                                    onTimeChange: (time) {
                                      setState(() {
                                        _dateTime = time;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Expanded(flex: 1, child: SizedBox()),

                    ],
                  ),
                );
              }
          );
        }
    );
  }

}
