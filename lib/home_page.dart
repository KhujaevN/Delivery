import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'info_page.dart';

class Home_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.all(40.10),
          color: Color(0xFF181A20),
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 40,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/profile');
                                },
                                child: const CircleAvatar(
                                  backgroundImage:
                                  AssetImage('assets/profile-logo.png'),
                                )),

                        ],
                      ),
                    ),
                    const SizedBox(width: 30),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Delivery Address',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 1),
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Амир Темур, 107Б',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 20,
                                    height: 20,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 5.83),
                                          child: const Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 13),
              Container(
                width: 380,
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: ShapeDecoration(
                  color: Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Color(0xFFBDBDBD),
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Padding(
                padding: EdgeInsets.symmetric(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Popular',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      height: 200.0,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 200.0,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 1,
                          enableInfiniteScroll: false,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 10),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: false,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/popular_carousel_img.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/popular_carousel_img.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/popular_carousel_img.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 20),
              const Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          child: Image(
                            image: AssetImage(
                                'assets/popular_carousel_img.png'),
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          'Plov',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Row(
                          children: [
                            Icon(Icons.directions_car,
                                color: Color(0xFF1BAC4B)),
                            SizedBox(width: 5),
                            Text(
                              '40 min',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                        trailing: Text(
                          '35000 Sum',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1BAC4B)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              GestureDetector(  onTap:(){Navigator.pushNamed(context, '/food_info');},
                child:  const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: ListTile(

                          leading: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(16.0)),
                            child: Image(
                              image: AssetImage(
                                  'assets/salad.png'),
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            'Salad',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Icon(Icons.directions_car,
                                  color: Color(0xFF1BAC4B)),
                              SizedBox(width: 5),
                              Text(
                                '20 min',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          trailing: Text(
                            '18000 Sum',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1BAC4B)),
                          ),

                        ),
                      ),
                    ),
                  ],

                )
              ),
            ],
          )),
    );
  }
}
