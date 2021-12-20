import 'package:flutter/material.dart';
import '/dice.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dice game',
      debugShowCheckedModeBanner: false,
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.teal,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Builder(
        builder: (context) {
          // GestureDetector - 사용자의 행동을 감지하는 위젯
          return GestureDetector(
            onTap: () {
              // 화면을 탭하면 활성화된 포커스가 풀려서 키보드가 내려가게끔
              FocusScope.of(context).unfocus();
            },
            // 키보드가 textFormField를 가리지 않게 하기 위해 사용
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 50)),
                  Center(
                    child: Image(
                      image: AssetImage('images/chef.gif'),
                      width: 250,
                      height: 200,
                    ),
                  ),
                  Form(
                    child: Theme(
                      data: ThemeData(
                        primaryColor: Colors.blueGrey,
                        inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(40),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              // autofocus: true, // 화면에 접속하자마자 입력창 활성화
                              controller: controller,
                              decoration: InputDecoration(
                                labelText: 'Enter "dice"',
                              ),
                              keyboardType:
                                  TextInputType.emailAddress, // 키보드타입 지정
                            ),
                            TextField(
                              controller: controller2,
                              decoration: InputDecoration(
                                labelText: 'Enter Password',
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true, // 패스워드 처리, 입력값 암호화
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ButtonTheme(
                              minWidth: 100,
                              height: 50,
                              child: ElevatedButton(
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 30,
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.amber,
                                ),
                                onPressed: () {
                                  if (controller.text == 'dice' &&
                                      controller2.text == '1234') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                Dice()));
                                  } else if (controller.text == 'dice' &&
                                      controller2.text != '1234') {
                                    showSnackBar2(context);
                                  } else if (controller.text != 'dice' &&
                                      controller2.text == '1234') {
                                    showSnackBar3(context);
                                  } else {
                                    showSnackBar(context);
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('로그인 정보를 다시 확인하세요', textAlign: TextAlign.center),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blueGrey,
  ));
}

void showSnackBar2(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('비밀번호가 일치하지 않습니다', textAlign: TextAlign.center),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blueGrey,
  ));
}

void showSnackBar3(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      'dice의 철자를 확인하세요',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blueGrey,
  ));
}
