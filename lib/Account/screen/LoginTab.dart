import 'package:flutter/material.dart';
import 'package:ittierra_app/Account/screen/Login.dart';

import 'SignUp.dart';

class LoginTab extends StatelessWidget {
  final List<Tab> loginTabs = <Tab>[
    const Tab(text: '로그인'),
    const Tab(text: '회원가입')
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: loginTabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            bottom: TabBar(
                tabs: loginTabs,
                labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                unselectedLabelStyle: const TextStyle(fontSize: 14)),
          ),
        ),
        body: const TabBarView(children: [LogIn(), SignUp()]),
      ),
    );
  }
}
