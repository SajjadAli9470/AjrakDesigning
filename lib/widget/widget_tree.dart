import 'package:design_ajrak2/auth/user_auth.dart';
import 'package:design_ajrak2/screens/GetLogged.dart';
import 'package:design_ajrak2/widget/Drawer.dart';
import 'package:flutter/cupertino.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Drawwer();
          } else {
            return const GetLoggedIN();
          }
        });
  }
}
