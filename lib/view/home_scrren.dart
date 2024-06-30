import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:musicapp/model/music.dart';
import 'package:musicapp/model/popularSingleitem.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home_Icon extends StatefulWidget {
  const Home_Icon({super.key});
  State createState() => _FavoriteState();
}

class _FavoriteState extends State {
  List<Discographyitem> discographyitem = const [
    Discographyitem(
        imageUrl: "asset/images/Rectangle1.png",
        name: "Dead inside",
        year: "2020"),
    Discographyitem(
        imageUrl: "asset/images/Rectangle1.png",
        name: "Dead inside",
        year: "2020"),
    Discographyitem(
        imageUrl: "asset/images/Rectangle1.png",
        name: "Dead inside",
        year: "2020"),
    Discographyitem(
        imageUrl: "asset/images/Rectangle1.png",
        name: "Dead inside",
        year: "2020")
  ];

  List<PopularSingleitem> popularSingleitem = [
    const PopularSingleitem(
        imageUrl: "asset/images/Rectangle2.png",
        name: "we are chaos",
        year: "2023",
        Description: "Easy Living"),
    const PopularSingleitem(
        imageUrl: "asset/images/Rectangle2.png",
        name: "we are chaos",
        year: "2023",
        Description: "Easy Living"),
        const PopularSingleitem(
        imageUrl: "asset/images/Rectangle2.png",
        name: "we are chaos",
        year: "2023",
        Description: "Easy Living"),
        const PopularSingleitem(
        imageUrl: "asset/images/Rectangle2.png",
        name: "we are chaos",
        year: "2023",
        Description: "Easy Living")
  ];
  List images = [
    "asset/images/ss.png",
    "asset/images/ss.png",
    "asset/images/ss.png",
  ];
  int activeIndex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CarouselSlider.builder(
                    itemCount: images.length,
                    itemBuilder: ((context, index, realindex) {
                      final imageUrl = images[index];
                      return buildImage(imageUrl, index);
                    }),
                    options: CarouselOptions(
                      viewportFraction:1,
                      height: MediaQuery.of(context).size.height * 0.415,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 4),
                      onPageChanged: (index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      },
                    )),
                const SizedBox(
                  height: 12,
                ),
                buildPageIndicator(),
                SizedBox(
                  height: 3,
                ),
                Column(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      child: Row(
                        children: [
                          Text(
                            "Discography",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(255, 46, 0, 1)),
                          ),
                          Spacer(),
                          Text(
                            "See all",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(248, 162, 69, 1)),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                        height: 180,
                        child: ListView.builder(
                            itemCount: discographyitem.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return buildDescrographicCard(
                                  discographyitem[index]);
                            })),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                      child: Row(
                        children: [
                          Text(
                            "Popular singles",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(203, 200, 200, 1)),
                          ),
                          Spacer(),
                          Text(
                            "See all",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(248, 162, 69, 1)),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Column(
                        children:
                            List.generate(popularSingleitem.length, (index) {
                      return buildPopularSingleitemCard(
                          popularSingleitem[index]);
                    }))
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Widget buildImage(String imageUrl, int index) {
    return Stack(
      children: [
        Container(
          height: 367,
          margin: const EdgeInsets.symmetric(horizontal: 3.5),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.41,
          child: Container(
            width: 350,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(24, 24, 24, 1),
                blurRadius: 200,
                spreadRadius: 80,
              )
            ]),
          ),
        ),
        Positioned(
          top: 224,
          left: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "A.L.O.N.E",
                style: TextStyle(
                  letterSpacing: 0,
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 46, 0, 1),
                    borderRadius: BorderRadius.all(Radius.circular(21)),
                  ),
                  height: 37,
                  width: 127,
                  alignment: Alignment.center,
                  child: const Text(
                    "Subscribe",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color.fromRGBO(9, 19, 19, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPageIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: images.length,
      effect: const ExpandingDotsEffect(
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: Color.fromRGBO(255, 61, 0, 1),
      ),
    );
  }

  Widget buildDescrographicCard(Discographyitem discographyitem) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 140,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  discographyitem.imageUrl,
                  fit: BoxFit.cover,
                ),
              )),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            child: Text(
              maxLines: 1,
              discographyitem.name,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(203, 200, 200, 1)),
            ),
          )
        ],
      ),
    );
  }

  Widget buildPopularSingleitemCard(PopularSingleitem popularSingleitem) {
    return Padding(
        padding: const EdgeInsets.only(right: 14, left: 14, top: 7, bottom: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 72,
              width: 67,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  popularSingleitem.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    popularSingleitem.name,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(203, 200, 200, 1)),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    SizedBox(
                        child: Text(
                      popularSingleitem.year,
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(132, 125, 125, 1)),
                    )),
                    const SizedBox(
                      width: 8,
                    ),
                    const CircleAvatar(
                      radius: 2.2,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      child: Text(
                        popularSingleitem.Description,
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(132, 125, 125, 1)
                            ),
                      ),
                    ),
                    
                  ],
                ),
                
              ],
            ),
            const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.more_vert,
                        size: 28,
                        color: Colors.white,
                      ),
                    )
                  ],
                )



          ],
        ));
  }
}
