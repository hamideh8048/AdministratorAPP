import 'package:Prismaa/components/constants.dart';
import 'package:Prismaa/components/login_text_feild.dart';
import 'package:Prismaa/models/user_model.dart';
import 'package:Prismaa/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => LoginState();
}

class LoginState extends State<Login> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool pageLoading = false;
  bool obscurePassword = true;
  String passCtrl = "";
  bool showPass = true;
  final FocusNode _focusNode = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  LocalAuthentication auth = LocalAuthentication();
  // AnimationController? _animationController;

  // =======================================


  Future authenticate() async {


    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics && await auth.isDeviceSupported();
    ///
  //  final bool isBiometricsAvailable = await auth.isDeviceSupported();


    if (canAuthenticate)
{
    try {
      return await auth.authenticate(
        localizedReason: 'please enter your finger print',
        options: const AuthenticationOptions(
          useErrorDialogs: false,
        ),
      );
    }
    on PlatformException catch (e) {
    if (e.code == auth_error.notEnrolled) {
    // Add handling of no hardware here.
    } else if (e.code == auth_error.lockedOut ||
    e.code == auth_error.permanentlyLockedOut) {
    } else {
      AlertDialog alert = AlertDialog(
        title: Text("خطا"),
        content: Text("تنظیمات دستگاه شما برای اثر انگشت فعال نیست"),
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
    }
    }
}
    else
   return false;
  }

  @override
  void initState() {
    super.initState();

    // _focusNode.addListener(() {
    //   if (_focusNode.hasFocus) {
    //     _animationController!.forward();
    //   } else {
    //     _animationController!.reverse();
    //   }
    // });
    // _username.text = "mehdi";
    // _password.text = "635241";
  }
  // =======================================

  @override
  void dispose() {
    // _animationController!.dispose();
    _username.dispose();
    _password.dispose();
    _focusNode.dispose();
    _focusNode2.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          leadingWidth: 0,
          leading: const SizedBox(),
        ),
      ),

      body: pageLoading
          ? const Center(child: SpinKitThreeBounce(color: Colors.black12, size: 25.0))
          : SingleChildScrollView(
        child: GestureDetector(
          onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(

            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: backgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //SizedBox(height: 50.sp),

                SizedBox(
                  height: MediaQuery.of(context).size.height*0.45,

                  child:
                  Stack(
                    // alignment: Alignment.topLeft,
                    // clipBehavior: Clip.none,
                    children: [
                      Positioned(
                  top: 50.sp,
                      left:160.sp
                      ,child:
                      Text("مدیریت",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: buttonColor,
                          fontSize: 25.sp,
                        ),)
                      ),
                      Positioned(
                        top: 100.sp,
                        left: -30.sp,
                        child: Image.asset(

                          'assets/images/loginImage.png',
                         // fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.width*0.8,
                         // width: MediaQuery.of(context).size.width,

                        ),
                      ),
                      Positioned(
                        top: 120.sp,
                        left:200.sp,
                        child: Image.asset(
                          'assets/images/loginimg2.png',
                        //  fit: BoxFit.cover,
                          width: 83.sp,
                          height: 225.sp,
                        ),
                      ),
                    ],
                  )

                ),

               // SizedBox(height: 50.sp),

                Form(
                  key: _formKey,
                  child: Column(
                   // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      LoginTextFeild(
                          labelText: 'ایمیل/شماره مبایل',
                          hintText: 'ایمیل/شماره مبایل خود را وارد کنید',
                          prefixIcon: const Icon(Icons.account_circle_outlined, color: Colors.black12,),
                          controller: _username,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          autofillHints: const [AutofillHints.username],
                          validator: (String? value){
                            if(value == ""){
                              return "این فیلد نباید خالی باشد";
                            } else {
                              return null;
                            }
                          },
                          focusNode: _focusNode,
                          textDirection: TextDirection.ltr,
                          onFieldSubmitted: _focusNode2
                      ),
                      SizedBox(height: 20.sp),

                      // فیلد رمز عبور
                      TextFormField(
                        controller: _password,
                        obscureText: showPass,
                        keyboardType: TextInputType.number,
                        validator: (String? value){
                          if(value == ""){
                            return "این فیلد نباید خالی باشد";
                          } else {
                            return null;
                          }
                        },
                        textDirection: TextDirection.ltr,
                        autofillHints: const [AutofillHints.password],
                        style: Theme.of(context).textTheme.bodyText1,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            labelText: 'رمز عبور',
                            labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22.sp),
                            hintText: 'رمز عبور خود را وارد کنید',
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
                            prefixIcon: const Icon(Icons.lock_outlined, color: Colors.black12),
                            suffixIcon: GestureDetector(
                                onTap: () => setState(() => showPass = !showPass),
                                child: showPass
                                    ?
                                Container(
                                  height: 25.sp, width: 30.sp,
                                  margin: EdgeInsets.symmetric(horizontal: 12.0.sp),
                                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/doesn't_show_pass.png"))),
                                )
                                    :
                                Container(
                                  height: 22.sp, width: 27.sp,
                                  margin: EdgeInsets.symmetric(horizontal: 13.0.sp),
                                  decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/show_pass.png"))),
                                )
                            )
                        ),
                        focusNode: _focusNode2,
                        onFieldSubmitted: null,
                      ),

                    ],
                  ),
                ),
                // SizedBox(height: 40.sp),
                // GestureDetector(
                //   onTap: (){
                //     Navigator.pushNamed(context, "/reset_password");
                //   },
                //   child: Text("رمز عبور خود را فراموش کرده اید؟",
                //     style: Theme.of(context).textTheme.bodyText1!.copyWith(
                //       fontSize: 14.sp,
                //       color: Colors.blue,
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: pageLoading
          ? const SizedBox()
          :
      Padding(
          padding: const EdgeInsets.all(16),

          child:
          SizedBox(height: 200,child:
            Column(

              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 5),
                  GestureDetector(
                  onTap: (){
                  // if(_formKey.currentState!.validate()){
                 //   openGetDateDialog(setState, context, _dateFromController);


                 //    AlertDialog alert = AlertDialog(
                 //      title: Text("My title"),
                 //      content: Text("This is my message."),
                 //    );
                 //
                 //    showDialog(
                 //      context: context,
                 //      builder: (BuildContext context) {
                 //        return alert;
                 //      },
                 //    );
                   sendLoginDataFormToServer(_username.text, _password.text);
                  ///}
                  },
                  child:
                Container(
                  height: 70.sp,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.all(Radius.circular(40))
                  ),
                  child: Center(
                    child: Text("ورود به پنل کاربری",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: Colors.white
                      ),
                    ),
                  ),
                )),
                const SizedBox(height: 5),
               GestureDetector(
    onTap: () async {
    if(UserModel.mainToken==null||UserModel.mainToken.length<5){
      AlertDialog alert = AlertDialog(
        title: Text("خطا"),
        content: Text("لطفا بار اول از طریق نام کاربری و رمز ورود وارد شوید"),
      );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
    }
    else
    {
      bool isAuthenticated = await authenticate();
     //  var snackBar = SnackBar(content: Text('Hello World'));
     //  ScaffoldMessenger.of(context).showSnackBar(snackBar);

      if (isAuthenticated) {
        Navigator.pushReplacementNamed(context, "/main_tab_bar");

      } else {
           AlertDialog alert = AlertDialog(
             title: Text("خطا"),
             content: Text("تنظیمات دستگاه شما برای اثر انگشت فعال نیست"),
           );

           showDialog(
             context: context,
             builder: (BuildContext context) {
               return alert;
             },
           );
      }}

    },child:
                Container(
                  height: 70.sp,
                  width: MediaQuery.of(context).size.width,
                  decoration:

                   BoxDecoration(

                      color:  Colors.white,
                      border: Border.all(color: buttonColor),
                      borderRadius: BorderRadius.all(Radius.circular(40))

                  ),
                  child: Center(
                    child: Text("ورود با اثر انگشت ",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          color: buttonColor
                      ),
                    ),
                  ),
                )),
              ],
            ))

      ),
    );
  }

  sendLoginDataFormToServer(String username, String password) async {
    setState(() => pageLoading = true);
    //var response = await (Services()).sendLoginDataFormToServer(username, password);
   // var response = await (Services()).sendPostLoginDataFormToServer("kolsoumshirali@gmail.com", "123456");
    var response = await (Services()).sendPostLoginDataFormToServer(_username.text.trim(), _password.text.trim());
    //var response = await (Services()).getPersonelTrafficToServer("34","","50","1");
    if (response[0]["res"] == 1) {

        String tokenResult = response[0]['token'];
        UserModel.companyQR = response[0]["company_qrcode"];
        getOtherPersonelItems(response[0]['token']);
        UserModel.mainToken = response[0]["token"];
        UserModel.comapnyName = response[0]["company_name"];
        UserModel.comapnyId = response[0]["company_id"];
        UserModel.userId = response[0]["user_id"];
        UserModel.comapnyLogo = response[0]["company_logo"];
        UserModel.comapnyCode = response[0]["company_code"];
        storeUserToken(tokenResult);
        storeCompanyName(UserModel.comapnyName);
        storeCompanyId(UserModel.comapnyId);
        storeUserId(UserModel.userId);
        storeCompanyLogo(UserModel.comapnyLogo);
        storeCompanyCode(UserModel.comapnyCode);
        Navigator.pushReplacementNamed(context, "/main_tab_bar");

      setState(() => pageLoading = false);
    } else {
      String result = response[0]['msg'];
      showSimpleNotification(
        Text(result,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: Colors.white
            )),
        background: Colors.red,
      );
      setState(() => pageLoading = false);
    }
  }

  getOtherPersonelItems(String token) async {
    var response = await (Services()).getOtherPersonelItems(token);
    if(response[0]["res"] == 1){
      UserModel.name = response[0]["name"];
      UserModel.family = response[0]["family"];
      UserModel.picPath = response[0]["pic_path"];
      UserModel.nationalCode = response[0]["national_code"];
      UserModel.mobile = response[0]["mobile"];
      UserModel.email = response[0]["email"];
      UserModel.userRoleId = response[0]["user_role_id"];
      UserModel.username = response[0]["username"];
      UserModel.comapnyCode = response[0]["company_code"];

    }
  }

  void storeUserToken(String tokenResult) async {
    print("dfdf : " + tokenResult);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("user.api_token", tokenResult);
    // getUserInfo(tokenResult);
  }
  void storeUserId(String userId) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("user_id", userId);
    // getUserInfo(tokenResult);
  }
  void storeCompanyName(String companyName) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("company_name", companyName);
    // getUserInfo(tokenResult);
  }
  void storeCompanyCode(String companyName) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("company_code", companyName);
    // getUserInfo(tokenResult);
  }
  void storeCompanyLogo(String companylogo) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("company_logo", companylogo);
    // getUserInfo(tokenResult);
  }
  void storeCompanyId(String companyId) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("company_id", companyId);
    // getUserInfo(tokenResult);
  }
}

