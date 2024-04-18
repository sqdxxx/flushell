import 'package:flushell/flushell.dart';
import 'package:flushell/ui/page/webview_page.dart';
import 'package:flutter/material.dart';
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("关于我们"),
        ),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                    ),
                    Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Image.asset("images/logo.png")),
                    const SizedBox(height: 20,),
                    Text(sh.packageInfo.version),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 30),
                      child: Center(child: Text(sh.env.icp)),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WebViewPage(url: sh.env.agreementUrl)),
                              );
                            },
                            child: Text("用户协议",
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.blue)),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => WebViewPage(url: sh.env.privateUrl)),
                              );
                            },
                            child: Text("隐私政策",
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.blue)),
                          ),
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
