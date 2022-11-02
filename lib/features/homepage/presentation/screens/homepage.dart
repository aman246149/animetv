import 'package:animetv/core/modules/firebasemodules.dart';
import 'package:animetv/core/presentation/widgets/vspace.dart';
import 'package:animetv/core/routes/router.gr.dart';
import 'package:animetv/features/adminpanel/admin_constant.dart';
import 'package:animetv/features/homepage/data/model/anime_model.dart';
import 'package:animetv/features/homepage/presentation/bloc/anime_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import "package:auto_route/auto_route.dart";

import '../../../../core/utils/common_methods.dart';

class HomePage extends StatefulWidget {
  final FirebaseAuth auth;
  const HomePage({Key? key, required this.auth}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AnimeModel> anime = [];
  String name = "";
  String genere = "";
  String season = "";
  String rating = "";
  String? selectedImage;

  @override
  void initState() {
    context.read<AnimeBloc>().add(GetAnimeEvent());
    selectedImage =
        "https://img.freepik.com/free-vector/gradient-japanese-architecture-temple-illustration_52683-44723.jpg?w=900&t=st=1666847864~exp=1666848464~hmac=605327792b10723766bc7e2ee25d324b01f249639f674c03bc6fe319d7d898fa";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<AnimeBloc, AnimeState>(
      listener: (context, state) {
        if (state is GetAnimeLoadingState) {
          setState(() {
            showOverlayLoader(context);
          });
        } else if (state is GetAnimeSuccessFullState) {
          setState(() {
            hideOverlayLoader(context);
            anime = state.anime;
            selectedImage = anime[0].imageUrl;
            name = anime[0].name;
            genere = anime[0].genere;
            season = anime[0].seasons;
            rating = anime[0].rating;
          });
        } else if (state is GetAnimeFailureState) {
          setState(() {
            hideOverlayLoader(context);
            showErrorSnackbar(context, state.error);
          });
        }
      },
      child: Scaffold(
        floatingActionButton: Visibility(
          visible: widget.auth.currentUser!.uid == adminId,
          child: FloatingActionButton(
            onPressed: () => context.router.push(UploadAnimePageqRoute()),
            child: Icon(Icons.add),
          ),
        ),
        appBar: AppBar(
          title: Text("WHAT TO WATCH NEXT?"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children: [
            Container(
              height: size.height,
              width: double.infinity,
            ),
            Container(
              height: size.height / 2.5,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: CachedNetworkImage(
                  imageUrl: selectedImage ?? "",
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      LoadingAnimationWidget.twistingDots(
                    leftDotColor: Color.fromARGB(255, 255, 255, 255),
                    rightDotColor: const Color(0xFFEA3799),
                    size: 50,
                  ),
                  placeholder: (_, val) => LoadingAnimationWidget.twistingDots(
                    leftDotColor: Color.fromARGB(255, 255, 255, 255),
                    rightDotColor: const Color(0xFFEA3799),
                    size: 50,
                  ),
                ),
              ),
            ),
            Container(
              height: size.height / 2.5,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.3), Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2),
                    ),
                    Vspace(8),
                    Text(
                      genere,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16),
                    ),
                    Vspace(8),
                    Text(
                      "Seasons $season",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16),
                    ),
                    Vspace(8),
                    Text(
                      "Rating $rating",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.height / 2.2),
              height: size.height / 3.5,
              width: double.infinity,
              // color: Colors.white,
              child: CarouselSlider(
                options: CarouselOptions(
                    pageSnapping: true,
                    viewportFraction: 0.6,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    onScrolled: (double? index) {
                      double num1 = double.parse((index!).toStringAsFixed(0));
                      var num = num1.toString().split('.');
                      int ind = int.parse(num[0]);
                      name = anime[ind].name;
                      genere = anime[ind].genere;
                      season = anime[ind].seasons;
                      rating = anime[ind].rating;

                      setState(() {
                        selectedImage = anime[ind].imageUrl;
                        print(selectedImage);
                      });
                    }),
                items: anime.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          padding: EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            child: CachedNetworkImage(
                              imageUrl: i.imageUrl,
                              fit: BoxFit.cover,
                              placeholder: (_, val) =>
                                  LoadingAnimationWidget.twistingDots(
                                leftDotColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                rightDotColor: const Color(0xFFEA3799),
                                size: 50,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
