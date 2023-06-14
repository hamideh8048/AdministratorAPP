
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import '../home2.dart';
// import 'package:network_info_plus/network_info_plus.dart';

class localAuth extends StatefulWidget {
  const localAuth({Key? key}) : super(key: key);

  @override
  State<localAuth> createState() => localAuthState();
}

class localAuthState extends State<localAuth> {

 LocalAuthentication auth = LocalAuthentication();
  @override
  void initState() {
    super.initState();

  }


  @override
  void dispose() {
    super.dispose();

  }
 Future authenticate() async {
   final bool isBiometricsAvailable = await auth.isDeviceSupported();

   if (!isBiometricsAvailable) return false;

   try {
     return await auth.authenticate(
       localizedReason: 'Scan Fingerprint To Enter Vault',
       options: const AuthenticationOptions(
         useErrorDialogs: true,

         stickyAuth: true,
       ),
     );
   } on PlatformException {
     return;
   }
 }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body:Column(
        children: <Widget>[

          ElevatedButton(
             onPressed: () async {
    bool isAuthenticated = await authenticate();

    if (isAuthenticated) {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) {
    return const Home2();
    },
    ),
    );
    } else {
    Container();
    }
    },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text('Authenticate'),
                Icon(Icons.perm_device_information),
              ],
            ),
          ),
        ],
      ),
    );
  }

}


