import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/common/utils.dart';
import 'package:pokedex/controllers/home_controller.dart';
import 'package:pokedex/repositories/home_repository_imp.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _homeController = HomeController(HomeRepositoryImp());

  var offset = 15.0;

  @override
  void initState() {
    super.initState();

    _homeController.fetchPokemons();

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text('Pokedex'),
      // ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Text(
              "Pokedex",
              style: TextStyle(fontSize: 35),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: AnimatedBuilder(
                animation: Listenable.merge(
                    [_homeController.pokemons, _homeController.loading]),
                builder: (_, __) => GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemCount: _homeController.pokemons.value.length,
                  padding: EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    return Card(
                      color: Utils.getColorByType(
                          _homeController.pokemons.value[index].types[0]),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('/details',
                              arguments: _homeController.pokemons.value[index]);
                        },
                        child: Column(
                          children: [
                            CachedNetworkImage(
                              height: 95,
                              imageUrl:
                                  _homeController.pokemons.value[index].imgUrl,
                            ),

                            Container(
                              padding: EdgeInsets.all(2),
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(bottom: 5),
                              child: Text(
                                _homeController.pokemons.value[index].name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            showTypes(index)

                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // child: GridView.builder(
              //   shrinkWrap: true,
              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
              //   itemCount: 10,
              //   padding: EdgeInsets.all(8),
              //   itemBuilder: (context, index) {
              //     return Container(
              //       alignment: Alignment.center,
              //       color: Colors.green,
              //       child: Text("Testanso"),
              //     );
              //   },
              // ),
            )
          ],
        ),

        // AnimatedBuilder(
        //   animation: Listenable.merge(
        //       [_homeController.pokemons, _homeController.loading]),
        //   builder: (_, __) => _homeController.loading.value
        //       ? showGridViewShimmer()
        //       : GridView.builder(
        //           shrinkWrap: true,
        //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //               crossAxisCount: 2,
        //               crossAxisSpacing: 6,
        //               mainAxisSpacing: 6),
        //           padding: EdgeInsets.all(8),
        //           itemCount: _homeController.pokemons.value.length,
        //           itemBuilder: (context, index) => Card(
        //             color: Utils.getColorByType(
        //                 _homeController.pokemons.value[index].types[0]),
        //             shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.all(Radius.circular(8))),
        //             child: InkWell(
        //               onTap: () {
        //                 Navigator.of(context).pushNamed('/details',
        //                     arguments:
        //                         _homeController.pokemons.value[index]);
        //               },
        //               child: Column(
        //                 children: [
        //                   CachedNetworkImage(
        //                     height: 95,
        //                     imageUrl: _homeController
        //                         .pokemons.value[index].imgUrl,
        //                   ),
        //                   Container(
        //                       padding: EdgeInsets.all(2),
        //                       alignment: Alignment.center,
        //                       margin: EdgeInsets.only(bottom: 5),
        //                       child: Text(
        //                         _homeController.pokemons.value[index].name,
        //                         style: TextStyle(
        //                             color: Colors.white,
        //                             fontSize: 17,
        //                             fontWeight: FontWeight.bold),
        //                       )),
        //                   showTypes(index)
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        // ),
      ),
    );
  }

  Widget showTypes(index) {
    List<Widget> widgets = [];

    for (var type in _homeController.pokemons.value[index].types) {
      widgets.add(Card(
        color: Colors.white70.withOpacity(0.1),
        child: Container(
          padding: EdgeInsets.all(4),
          child: Text(type,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w500)),
        ),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets,
    );
  }

  Widget showGridViewShimmer() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 6, mainAxisSpacing: 6),
      padding: EdgeInsets.all(8),
      itemCount: 10,
      itemBuilder: (context, index) => Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: Card()),
    );
  }
}
