import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:staggered_recyclerview/screen/home/provider/home_provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProvider;

  @override
  Widget build(BuildContext context) {
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black12,
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text("Straged  RecyclerView"),
            centerTitle: true,
          ),
          body: GridView.custom(
            gridDelegate: SliverWovenGridDelegate.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              pattern: [
                WovenGridTile(1),
                WovenGridTile(
                  5 / 7,
                  crossAxisRatio: 0.9,
                  alignment: AlignmentDirectional.centerEnd,
                ),
              ],
            ),
            childrenDelegate: SliverChildBuilderDelegate(
              childCount: 5,
                  (context, index) => Tile(index: index),
            ),
          ),
        ));
  }

  Tile({required int index}) {
    return Container(
      color: Colors.black38,
      // alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            height: double.infinity,
            child: Image.asset(
              "${homeProvider!.Images[index]}",
              fit: BoxFit.cover,
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  color: Colors.white,
                  height: 25,
                  width:  double.infinity,
                  alignment: Alignment.center,
                  child: Text("${homeProvider!.Name[index]}",style: TextStyle(fontSize: 18,color: Colors.black),
                  )
              )
          ),
        ],
      ),
    );
  }
}