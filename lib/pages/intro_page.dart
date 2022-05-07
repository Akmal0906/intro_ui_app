import 'package:flutter/material.dart';
import 'package:intro_ui_app/Strings/string_content.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);
  static const String id = 'intro_page';

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int _selectedPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
    _selectedPage = 0;
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
      backgroundColor: Colors.black,
      appBar: AppBar(

        elevation: 1,
        backgroundColor: Colors.black,
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text('Skip',style: TextStyle(color: Colors.green,fontSize: 18),),
            ),
          ),

        ],
      ),
      body:Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _selectedPage = index;
              });
            },
            children: [
              makePage(
                image: 'assets/images/image_1.png',
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
              ),
              makePage(
                image: 'assets/images/image_2.png',
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent,
              ),
              makePage(
                image: 'assets/images/image_3.png',
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
              ),
            ],
          ),
             Container(
               margin: const EdgeInsets.only(bottom: 56),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children:_buildIndicator(),
               ),
             )
        ],
      )
    );
  }

  Widget makePage({image, title, content}) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 30,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                content,
                style: const TextStyle(color: Colors.green, fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _indicator(bool isActive){
    return AnimatedContainer(duration: const Duration(milliseconds: 300),
    height: 6,
      width: isActive? 30:6,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
  List<Widget> _buildIndicator(){
    List<Widget> indicators=[];
    for(int i=0;i<3;i++){
      if(_selectedPage==i){
        indicators.add(_indicator(true));
      }else{
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
