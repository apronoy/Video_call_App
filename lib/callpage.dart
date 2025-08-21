import 'package:flutter/material.dart';
import 'package:videocall_app/call_invite.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class Callpage extends StatefulWidget {
  const Callpage({super.key});

  @override
  State<Callpage> createState() => _CallpageState();
}

class _CallpageState extends State<Callpage> {
  final userid = TextEditingController();
  final username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar ..
        appBar: AppBar(title: const Text('Video call ')),
      // body section ..
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // textfield userid ..
              TextField(
                controller: userid,
                decoration: const InputDecoration(labelText: 'UserId'),
              ),
              const SizedBox(height: 10),
              // textfield username .. 
              TextField(
                controller: username,
                decoration: const InputDecoration(labelText: 'UserName'),
              ),
              const SizedBox(height: 10),
              // with this button callInvitation service will be initialize ...
              ElevatedButton(
                  onPressed: () async {
                    await ZegoUIKitPrebuiltCallInvitationService().init(
                        appID: 1519039056,
                        appSign:
                            'f6191917081e6e496014bf3bbce349d439e427c90798ef863088ca71f9f1f596' /*input your AppSign*/,
                        userID: userid.text.trim(),
                        userName: username.text.trim(),
                        plugins: [ZegoUIKitSignalingPlugin()]);

                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => const CallInvite()));
                  },
                  child: const Text('Invite'))
            ],
          ),
        ));
  }
}
