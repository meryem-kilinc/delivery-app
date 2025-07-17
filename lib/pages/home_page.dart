import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teslimat/components/my_current_location.dart';
import 'package:teslimat/components/my_description.dart';
import 'package:teslimat/components/my_drawer.dart';
import 'package:teslimat/components/my_food_tile.dart';
import 'package:teslimat/components/my_sliver_app_bar.dart';
import 'package:teslimat/components/my_tab_bar.dart';
import 'package:teslimat/models/food.dart';
import 'package:teslimat/models/restaurant.dart';
import 'package:teslimat/pages/food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  //tab controller
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = 
    TabController(
      length: FoodCategory.values.length, 
      vsync: this);
  }

@override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

List<Food> _filterMenuByCategory(FoodCategory category, List<Food>fulMenu){
  return fulMenu.where((food) => food.category == category).toList();

}

List<Widget> getFoodInThisCategory(List<Food> fulMenu) {
  return FoodCategory.values.map((category) {

    //get category menu
    List<Food> categoryMenu = _filterMenuByCategory(category, fulMenu);

    return ListView.builder(
    shrinkWrap: true,
    physics: const ClampingScrollPhysics(),
      itemCount: categoryMenu.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        // get individual food
        final food = categoryMenu[index];

        //return food tile UI
        return FoodTile(
        food: food,
        onTap: () {
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => 
          FoodPage(food: food),
          ),
          );
        },
        );
      },
    );
  }).toList();
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
      headerSliverBuilder: (context , innerBoxIsScrolled) => [
      MySliverAppBar(
        title: MyTabBar(tabController: _tabController),
        onTap: () { },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Divider(
              indent: 25,
              endIndent: 25,
              color: Theme.of(context).colorScheme.secondary,
            ),

            //my current location
           const MyCurrentLocation(),

            // description box
           const MyDescription(),
            
          ],
        )
        ),
      ], 
      body: Consumer<Restaurant>(
        builder: (context,restaurant,child) => TabBarView(
        controller: _tabController,
        children: getFoodInThisCategory(restaurant.menu)
        ),
      ),
     ),
    );
  }
}