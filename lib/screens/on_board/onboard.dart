import 'dart:async';
import 'package:Prismaa/models/user_model.dart';
import 'package:Prismaa/screens/login/login.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => OnboardState();
}

class OnboardState extends State<Onboard> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription subscription;
  late StreamSubscription internetSubscription;
  bool hasInternet = false;
  ConnectivityResult result = ConnectivityResult.none;
  bool buttonLoading = false;

  @override
  void initState() {
    super.initState();

    subscription = Connectivity().onConnectivityChanged.listen((result) {
      setState(() => this.result = result);
    });

    internetSubscription = InternetConnectionChecker().onStatusChange.listen((status) {
      final hasInternet = status == InternetConnectionStatus.connected;
      setState(() => this.hasInternet = hasInternet);
    });


    Timer(Duration(seconds: 3), () {
      checkLogin();
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    internetSubscription.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:

              Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                  width: 150.sp,child:
                  Image.asset("assets/images/loading.png", fit: BoxFit.fitWidth)),

        SizedBox(
                  width: 180.sp,
                  height: 60.sp,child:
                  Image.asset("assets/images/gray.png", fit: BoxFit.fitWidth)),]),
              ),
            ),




      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onTap: () async {
              hasInternet = await InternetConnectionChecker().hasConnection;

              result = await Connectivity().checkConnectivity();
 final text = hasInternet ? "Internet" : "No Internet";


              if(result == ConnectivityResult.none) {
                showSimpleNotification(
                  Text(text + ": No Network",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white
                    )),
                  background: Colors.red,
                  // position: NotificationPosition.bottom,
                );
              } else {
                try {
                  setState(() {
                    buttonLoading = true;
                    checkLogin();
                  });
                }
                catch(e)
              {}
              }
              // }
            },
            child: Container(
              height: 70.sp,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(40))
              ),
              child:null

            ),
          ),
        ),
      ),
    );
  }

  checkLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.remove("user.api_token");
    String? apiToken = prefs.getString("user.api_token");
    String? user_id = prefs.getString("user_id");
    String? company_id = prefs.getString("company_id");
    String? company_logo = prefs.getString("company_logo");
    String? company_code = prefs.getString("company_code");

    if(apiToken == null){

      navigationToLogin();
      buttonLoading = false;
      // }
    } else {
      UserModel.mainToken = apiToken;
      UserModel.userId=user_id!;
      UserModel.comapnyId=company_id!;
      UserModel.comapnyLogo=company_logo!;
      UserModel.comapnyCode=company_code!;
    navigationToHome();
     //navigationToLogin();
      buttonLoading = false;
      // await getUserInfo(apiToken);
    }

  }


  navigationToLogin () {
    if(mounted) {
    //  Navigator.pushReplacementNamed(context, "/login");

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Login(),
        ),
      );      // context.vxNav.clearAndPush(Uri.parse("/main_tabbar"));
      // context.vxNav.clearAndPush(Uri.parse("/test_page"));
    }
  }

  navigationToHome(){
    if(mounted) {

      Navigator.pushReplacementNamed(context, "/main_tab_bar");
    }
  }

}
