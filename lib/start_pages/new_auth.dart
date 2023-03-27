import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

//import 'login_register_page.dart';
import 'new_login.dart';
import 'new_register_page.dart';

class NewAuthPage extends StatefulWidget {
  const NewAuthPage({super.key});

  @override
  State<NewAuthPage> createState() => _NewAuthPageState();
}

class _NewAuthPageState extends State<NewAuthPage> {
  bool showLoginPage = true;
  void toggleScreens(){
      setState(() {
        showLoginPage = !showLoginPage;
      });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return NewLoginPage(showRegisterPage: toggleScreens);
    } else {
      return NewRegisterPage(showLoginPage: toggleScreens);
    }
  }
}
