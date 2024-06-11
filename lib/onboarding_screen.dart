import 'package:flutter/material.dart';
import 'package:news_app/layout/layout_screen.dart';

class OnboardingScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Welcome to News App!',
      'description': 'You will enjoy this very interesting application\n',
      'imagePath': 'assets/news.jpg',
    },
    {
      'title': 'Find out news about Egypt',
      'description': 'You will know all possible news about Egypt.\n',
      'imagePath': 'assets/news.jpg',
    },
    {
      'title': 'Start Exploring Now',
      'description':
      'Do not waste your time and start discovering what is new about Egypt.',
      'imagePath': 'assets/news.jpg',
    },
  ];

  OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingData.length,
        itemBuilder: (context, index) {
          return OnboardingPage(
            title: onboardingData[index]['title']!,
            description: onboardingData[index]['description']!,
            imagePath: onboardingData[index]['imagePath']!,
            onPageChanged: (index) {
              if (index == onboardingData.length - 1) {
                // Last page reached, navigate to the next screen
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => NewsLayoutScreen()));
              }
            },
            isLastPage: index == onboardingData.length - 1,
            onNextPressed: () {
              if (_pageController.page != onboardingData.length - 1) {
                _pageController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease);
              } else {
                // Navigate to home screen
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => NewsLayoutScreen()));
              }
            },
          );
        },
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final Function(int) onPageChanged;
  final bool isLastPage;
  final VoidCallback onNextPressed;

  const OnboardingPage({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onPageChanged,
    required this.isLastPage,
    required this.onNextPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: screenHeight / 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          Text(description,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
          SizedBox(height: 16),
          Container(
            height: screenHeight / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image(
              image: AssetImage(imagePath),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 16.0,),
          if (isLastPage)
            ElevatedButton(
              onPressed: onNextPressed,
              child: Text('Get Started'),
            )
          else
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth/3),
              child: ElevatedButton(
                onPressed: onNextPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Next'),
                    Icon(Icons.navigate_next),
                  ],
                ),
              ),
            ),
          SizedBox(height: 16.0,),
        ],
      ),
    );
  }
}
