import 'package:ecommerceadmin/model/team_modal.dart';
import 'package:ecommerceadmin/viewModals/team_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class TeamPage extends StatefulWidget {
  const TeamPage({super.key});

  @override
  State<TeamPage> createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  late TeamRegisterModel teamRegisterResponse;
  late TeamLoginModel teamLoginResponse;
  late TeamViewModel _teamViewModel;

  TextEditingController mobileNoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    _teamViewModel = Provider.of<TeamViewModel>(context, listen: false);
    // _teamViewModel.teamRegister();
    // TeamLoginModel teamBody = TeamLoginModel(
    //     bussiness_id: '63a3ca0ad05360f32ab039cc',
    //     mobile: mobileNoController.text,
    //     password: passwordController.text);
    // _teamViewModel.teamLogin(teamBody);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Image.asset(
              'assets/teamlogo.png',
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.height * 0.30,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            margin: new EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 5),
                  child: const Text(
                    'Team Login Page',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w300,
                        fontSize: 30),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text('Sign in', style: TextStyle(fontSize: 20)),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: mobileNoController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Mobile No.'),
                  ),
                ),
                Container(
                  // padding: const EdgeInsets.all(10),
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Password'),
                  ),
                ),
                TextButton(
                    onPressed: () {}, child: const Text('Forget Password ?')),
                Container(
                  height: 50,
                  width: 400,
                  // padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () async {
                      // _teamViewModel.teamLogin(mobileNoController.text, passwordController.text);
                      TeamLoginModel teamBody = TeamLoginModel(
                          bussiness_id: '63a3ca0ad05360f32ab039cc',
                          mobile: mobileNoController.text,
                          password: passwordController.text);
                      var temp = await _teamViewModel.teamLogin(teamBody);
                    },
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     const Text("Didn't have account?"),
                //     TextButton(
                //         onPressed: (() {}),
                //         child: const Text(
                //           'Sign Up',
                //           style: TextStyle(fontSize: 20),
                //         ))
                //   ],
                // )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
