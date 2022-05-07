import 'package:flutter/material.dart';
import 'package:intro_ui_app/Strings/string_content.dart';
import 'package:intro_ui_app/pages/home_page.dart';

class IntroUI1 extends StatefulWidget {
  const IntroUI1({Key? key}) : super(key: key);
  static const String id = 'intro_ui1';

  @override
  State<IntroUI1> createState() => _IntroUI1State();
}

class _IntroUI1State extends State<IntroUI1>with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _selectedPage = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

_pageController=PageController(initialPage: 0);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _selectedPage = index;
              });
            },
            children: [
              _makePage(
                image: 'assets/images/image_1.png',
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
              ),
              _makePage(
                image: 'assets/images/image_2.png',
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
              ),
              _makePage(
                image: 'assets/images/image_3.png',
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
              ),
            ],
          ),


       Padding(padding: const EdgeInsets.all(20),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.end,
         children: _buildindicator(),
       ),),
        ],
      ),
    );
  }

  Widget _makePage({image, title, content}) {
    return Container(
      padding: const EdgeInsets.only(
        left: 50,
        right: 50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.red, fontSize: 30),
          ),
          Text(
            content,
            style: const TextStyle(color: Colors.grey, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(image),
            ),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isLastPage) {
    return AnimatedContainer(

      duration: const Duration(milliseconds: 400),
      height: isLastPage ? 20 : 0,
      width: isLastPage ? 50 : 0,
      child: GestureDetector(
        child: const Text('Skip',style: TextStyle(color: Colors.green,fontSize: 17),),
        onTap: (){
          Navigator.pushReplacementNamed(context, HomePage.id);
        },
      ),
    );
  }

  List<Widget> _buildindicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if ((_selectedPage == 2) && (i == 2)) {
        indicators.add(
          _indicator(true),
        );
      } else {
        indicators.add(
          _indicator(false),
        );
      }
    }
    return indicators;
  }
}
