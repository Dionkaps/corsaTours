import 'package:flutter/material.dart';
import 'package:level_map/level_map.dart';

class LevelMapPage extends StatefulWidget {
  const LevelMapPage({super.key});

  @override
  State<LevelMapPage> createState() => _LevelMapPageState();
}

class _LevelMapPageState extends State<LevelMapPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LevelMap(
          backgroundColor: Colors.white,
          levelMapParams: LevelMapParams(
            enableVariationBetweenCurves: false,
            maxVariationFactor: 0,
            levelHeight: MediaQuery.of(context).size.height/5,
            levelCount: 5,
            currentLevel: 2.5,
            pathColor: Colors.black,
            currentLevelImage: ImageParams(
              path: "assets/traffic_light.png",
              size: Size(40, 47),
            ),
            lockedLevelImage: ImageParams(
              path: "assets/traffic_light.png",
              size: Size(40, 42),
            ),
            completedLevelImage: ImageParams(
              path: "assets/traffic_light.png",
              size: Size(40, 42),
            ),
            bgImagesToBePaintedRandomly: [
              ImageParams(
                  path: "assets/traffic_light.png",
                  size: Size(80, 80),
                  repeatCountPerLevel: 0.5),
              ImageParams(
                  path: "assets/university.png",
                  size: Size(80, 80),
                  repeatCountPerLevel: 0.25),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(
            Icons.bolt,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              //Just to visually see the change of path's curve.
            });
          },
        ),
      ),
    );
  }
}
