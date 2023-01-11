import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testklk/constants.dart';

class Onboardingscreen extends StatefulWidget{
  const Onboardingscreen({Key? key}) : super (key: key);

  @override
  State<Onboardingscreen> createState() => _OnboardingscreenState();
}

class _OnboardingscreenState extends State<Onboardingscreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body:


      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(child: PageView.builder(
                itemCount: demo_data.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
    
                },
                itemBuilder: (context, index) => OnboardContent(
                  image: demo_data[index].image,
                  title: demo_data[index].title,
                  description: demo_data[index].description,

              ),
              ),
              ),
              Row(
                children: [
                  ...List.generate(demo_data.length, (index) => Padding(
                      padding: EdgeInsets.only(right: 5),
                    child: DotIndicator(isActive: index == _pageIndex),
                  ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed:  () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease) ;
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ), child: SvgPicture.asset("assets/icons/arrow.svg",
                    color: Colors.white,
                    ),
                    ),
                  ),
                ],
              )
            ],

          ),
        ),





        ),


    );


  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300) ,
      width: isActive ? 12 : 4,
      height: 4,
    decoration: BoxDecoration(color: isActive ? swatch2 : swatch2.withOpacity(0.4),
    borderRadius: BorderRadius.all(Radius.circular(12))),);
  }
}

class Onboard{
  final String image, title, description;
  Onboard({
    required this.image,
    required this.title,
    required this.description,

}) ;
}

final List<Onboard> demo_data = [
  Onboard(
        image: "assets/images/illu1.png",
      title: "Medical Expertise At Your Convenience",                                                       
     description: "The best doctors available to ensure your health issue is in the most suitable of hands"
  ),

   Onboard(
       image: "assets/images/illu2.png",
       title: "Book Appointments Easily",
    description: "The best doctors available to ensure your health issue is in the most suitable of hands"
   ),

  Onboard(image: "assets/images/illu3.png",
      title: "Chat With The Experts",
      description: "Get more insights on your condition outside of your appointment and at both you and the Expert’s convenience"
  ),
];
class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(image,
        height: 250,
        ),
        const Spacer(),
        Text(title,

        textAlign: TextAlign.center,
        selectionColor: Colors.cyan,
        style: TextStyle(color: Colors.white, ),
        ),
      const SizedBox(height: 16),

        Text(description,
      textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),

      ),
      const Spacer(),


      ],
    );
  }
}