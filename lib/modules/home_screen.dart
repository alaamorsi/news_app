import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/Science.dart';
import 'package:news_app/modules/Sports.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/general_screen.dart';
import 'package:news_app/shared/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          double screenHeight = MediaQuery.of(context).size.height;
          double screenWidth = MediaQuery.of(context).size.width;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 5.0,),
              Row(
                children: [
                  SizedBox(
                    height: screenHeight/3,
                    width: screenWidth/2,
                    child: InkWell(
                      onTap: (){
                        navigateTo(context, GeneralScreen());
                      },
                      child: Card(
                        child: Center(child: Text('General',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),
                        color: Theme.of(context).primaryColor,
                        margin: EdgeInsets.all(15.0),
                        elevation: 10.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight/3,
                    width: screenWidth/2,
                    child: InkWell(
                      onTap: (){
                        navigateTo(context, BusinessScreen());
                      },
                      child: Card(
                        child: Center(child: Text('Business',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),
                        color: Theme.of(context).primaryColor,
                        margin: EdgeInsets.all(15.0),
                        elevation: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    height: screenHeight/3,
                    width: screenWidth/2,
                    child: InkWell(
                      onTap: (){
                        navigateTo(context, SportsScreen());
                      },
                      child: Card(
                        child: Center(child: Text('Sports',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),
                        color: Theme.of(context).primaryColor,
                        margin: EdgeInsets.all(15.0),
                        elevation: 10.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight/3,
                    width: screenWidth/2,
                    child: InkWell(
                      onTap: (){
                        navigateTo(context, ScienceScreen());
                      },
                      child: Card(
                        child: Center(child: Text('Science',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),)),
                        color: Theme.of(context).primaryColor,
                        margin: EdgeInsets.all(15.0),
                        elevation: 10.0,
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
