import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotreport/model/app_state.dart';
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
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //- User Email -
                Text(
                  "${state.userEmail}",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                // const Divider(
                //   height: 1,
                //   thickness: 0.5,
                // ),
                //- Change Password button -
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text("Change Password"),
                  ),
                ),
                //- Privacy & security button
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: Text("Privacy and Security"),
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
          ),
        );
      },
    );
  }
}
