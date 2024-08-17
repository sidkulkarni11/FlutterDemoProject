import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo_project/color.dart';
import 'package:flutter_demo_project/constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: AppColors.netflixAppBarColor,
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  )),
              Spacer(),
              Text(
                "Netflix",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.netflixColor, fontSize: 24),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "International TV Shows",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Constants.trendingNowMovieListImageLinks.length,
                  // Number of items
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          height: double.infinity,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20), // Radius of the corners
                          ),
                          child: Image.network(
                              Constants.trendingNowMovieListImageLinks[index]),
                        ),
                        SizedBox(
                          width: 12,
                        )
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Fan Favorities",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Constants.fanFavoritiesMovieListImageLinks.length,
                  // Number of items
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          height: double.infinity,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20), // Radius of the corners
                          ),
                          child: Image.network(
                            Constants.fanFavoritiesMovieListImageLinks[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        )
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "TV Drama Links",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Constants.fanFavoritiesMovieListImageLinks.length,
                  // Number of items
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          height: double.infinity,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20), // Radius of the corners
                          ),
                          child: Image.network(
                            Constants.tvDramaImageLinks[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        )
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Anime",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
              Container(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Constants.animeImageLinks.length,
                  // Number of items
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          height: double.infinity,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20), // Radius of the corners
                          ),
                          child: Image.network(
                            Constants.animeImageLinks[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
