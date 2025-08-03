import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotreport/model/app_state.dart';
import 'package:spotreport/screens/settings_screens/change_password_screen.dart';
import 'package:spotreport/widgets/login_register_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsScreen();
}

class _SettingsScreen extends State<SettingsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      gettingEmail();
    });
    super.initState();
  }

  Future<void> gettingEmail() async {
    await Provider.of<AppState>(context, listen: false).getUserEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            //-- App Logo ---
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Sp",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: "o",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: "tReport",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
          //-- Settings buttons --
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 15,
                ),
                child: Text(
                  "Settings",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //- User Email -
                  ColoredBox(
                    color:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                    child: SizedBox(
                      height: 70,
                      child: Center(
                        child: Text(
                          "${state.userEmail}",
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  // - Change Password button -
                  SizedBox(
                    width: double.infinity,
                    child: TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChangePassword(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.person,
                        size: 26,
                      ),
                      label: Text(
                        "Change Password",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          alignment: Alignment.centerLeft),
                    ),
                  ),
                  //- Notifications
                  SizedBox(
                    width: double.infinity,
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.mail,
                        size: 26,
                      ),
                      label: Text(
                        "Notifications",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          alignment: Alignment.centerLeft),
                    ),
                  ),
                  //- Privacy & security button -
                  SizedBox(
                    width: double.infinity,
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.lock,
                        size: 26,
                      ),
                      label: Text(
                        "Privacy and Security",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          alignment: Alignment.centerLeft),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  //- Logout button -
                  Center(
                    child: LogoutWidget(),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
