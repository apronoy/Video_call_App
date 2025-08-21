import 'package:flutter/material.dart';
import 'package:videocall_app/callpage.dart';
 import 'package:zego_uikit/zego_uikit.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
// flutter binding ensurelized .. 
  WidgetsFlutterBinding.ensureInitialized();
// ZegoUIKitPrebuiltCallInvitationService set with navigatorkey ..
  ZegoUIKitPrebuiltCallInvitationService().setNavigatorKey(navigatorKey);
   
    await ZegoUIKit().initLog().then((value) async {
    await ZegoUIKitPrebuiltCallInvitationService().useSystemCallingUI(
      [ZegoUIKitSignalingPlugin()],
    );

    runApp(MyApp(navigatorKey: navigatorKey));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.navigatorKey});
 final GlobalKey<NavigatorState> navigatorKey;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Video call App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Callpage(),
    );
  }
}
