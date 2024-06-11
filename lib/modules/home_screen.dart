import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/sports.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/general_screen.dart';
import 'package:news_app/shared/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          double screenHeight = MediaQuery.of(context).size.height;
          double screenWidth = MediaQuery.of(context).size.width;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  SizedBox(
                    height: screenHeight / 3,
                    width: screenWidth / 2,
                    child: InkWell(
                      onTap: () {
                        navigateTo(context, const GeneralScreen());
                      },
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        margin: const EdgeInsets.all(15.0),
                        elevation: 10.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Image(image: const AssetImage('assets/general2.png'),fit: BoxFit.fill,height: screenHeight / 3,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 2.0),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red,width:5.0),
                                      borderRadius: BorderRadius.circular(5.0)
                                    ),
                                      child: const Text('General News',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0,color: Colors.white),)),
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 3,
                    width: screenWidth / 2,
                    child: InkWell(
                      onTap: () {
                        navigateTo(context, const BusinessScreen());
                      },
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        margin: const EdgeInsets.all(15.0),
                        elevation: 10.0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Image(image: const AssetImage('assets/business.png'),fit: BoxFit.fill,height: screenHeight / 3,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 2.0),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.red,width:5.0),
                                          borderRadius: BorderRadius.circular(5.0)
                                      ),
                                      child: const Text('Business News',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0,color: Colors.white),)),
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: screenHeight / 3,
                    width: screenWidth / 2,
                    child: InkWell(
                      onTap: () {
                        navigateTo(context, const SportsScreen());
                      },
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        margin: const EdgeInsets.all(15.0),
                        elevation: 10.0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Image(image: const AssetImage('assets/sports2.jpg'),fit: BoxFit.fill,height: screenHeight / 3,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 2.0),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.red,width:5.0),
                                          borderRadius: BorderRadius.circular(5.0)
                                      ),
                                      child: const Text('Sports   News',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0,color: Colors.white),)),
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight / 3,
                    width: screenWidth / 2,
                    child: InkWell(
                      onTap: () {
                        navigateTo(context, const ScienceScreen());
                      },
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        margin: const EdgeInsets.all(15.0),
                        elevation: 10.0,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Image(image: const AssetImage('assets/science2.png'),fit: BoxFit.fill,height: screenHeight / 3,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 2.0),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.red,width:5.0),
                                          borderRadius: BorderRadius.circular(5.0)
                                      ),
                                      child: const Text('Science News',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0,color: Colors.white),)),
                                )
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
