import 'package:animetv/core/presentation/widgets/vspace.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    "https://img.freepik.com/free-vector/gradient-japanese-architecture-temple-illustration_52683-44723.jpg?w=900&t=st=1666847864~exp=1666848464~hmac=605327792b10723766bc7e2ee25d324b01f249639f674c03bc6fe319d7d898fa",
    "https://img.freepik.com/free-vector/flat-design-samurai-background_52683-70562.jpg?w=996&t=st=1666855057~exp=1666855657~hmac=faf3baf6a17ecd1c5bb2414ea9d5bb74931026e541a604b93ec1d5994d5f1de7",
    "https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69459.jpg?w=996&t=st=1666855058~exp=1666855658~hmac=e9ec04907a3c2560e0a360a65c395c151a4bfa9049811d236ee09bbf09fd1f2e",
    "https://img.freepik.com/free-vector/gradient-samurai-dawn-background_23-2149050331.jpg?w=996&t=st=1666855059~exp=1666855659~hmac=64881d6da36545434a39a173d83a57a16a22de324d19b74627b95e7dda961fca",
    "https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69458.jpg?w=996&t=st=1666855061~exp=1666855661~hmac=54c90aa446b67118a8de4f4481290087243511980b6e562fe7d1bddd6e758a03",
    "https://img.freepik.com/free-vector/buildings-tokio-neon-lights_52683-46235.jpg?w=996&t=st=1666855063~exp=1666855663~hmac=622c141a5ce8694b2aac47cf99180629a0a6f5980597914c6d6f01dbb10e19f4"
        "https://img.freepik.com/free-vector/gradient-japanese-architecture-temple-illustration_52683-44723.jpg?w=900&t=st=1666847864~exp=1666848464~hmac=605327792b10723766bc7e2ee25d324b01f249639f674c03bc6fe319d7d898fa",
    "https://img.freepik.com/free-vector/flat-design-samurai-background_52683-70562.jpg?w=996&t=st=1666855057~exp=1666855657~hmac=faf3baf6a17ecd1c5bb2414ea9d5bb74931026e541a604b93ec1d5994d5f1de7",
    "https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69459.jpg?w=996&t=st=1666855058~exp=1666855658~hmac=e9ec04907a3c2560e0a360a65c395c151a4bfa9049811d236ee09bbf09fd1f2e",
    "https://img.freepik.com/free-vector/gradient-samurai-dawn-background_23-2149050331.jpg?w=996&t=st=1666855059~exp=1666855659~hmac=64881d6da36545434a39a173d83a57a16a22de324d19b74627b95e7dda961fca",
    "https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69458.jpg?w=996&t=st=1666855061~exp=1666855661~hmac=54c90aa446b67118a8de4f4481290087243511980b6e562fe7d1bddd6e758a03",
    "https://img.freepik.com/free-vector/buildings-tokio-neon-lights_52683-46235.jpg?w=996&t=st=1666855063~exp=1666855663~hmac=622c141a5ce8694b2aac47cf99180629a0a6f5980597914c6d6f01dbb10e19f4"
        "https://img.freepik.com/free-vector/gradient-japanese-architecture-temple-illustration_52683-44723.jpg?w=900&t=st=1666847864~exp=1666848464~hmac=605327792b10723766bc7e2ee25d324b01f249639f674c03bc6fe319d7d898fa",
    "https://img.freepik.com/free-vector/flat-design-samurai-background_52683-70562.jpg?w=996&t=st=1666855057~exp=1666855657~hmac=faf3baf6a17ecd1c5bb2414ea9d5bb74931026e541a604b93ec1d5994d5f1de7",
    "https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69459.jpg?w=996&t=st=1666855058~exp=1666855658~hmac=e9ec04907a3c2560e0a360a65c395c151a4bfa9049811d236ee09bbf09fd1f2e",
    "https://img.freepik.com/free-vector/gradient-samurai-dawn-background_23-2149050331.jpg?w=996&t=st=1666855059~exp=1666855659~hmac=64881d6da36545434a39a173d83a57a16a22de324d19b74627b95e7dda961fca",
    "https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69458.jpg?w=996&t=st=1666855061~exp=1666855661~hmac=54c90aa446b67118a8de4f4481290087243511980b6e562fe7d1bddd6e758a03",
    "https://img.freepik.com/free-vector/buildings-tokio-neon-lights_52683-46235.jpg?w=996&t=st=1666855063~exp=1666855663~hmac=622c141a5ce8694b2aac47cf99180629a0a6f5980597914c6d6f01dbb10e19f4"
        "https://img.freepik.com/free-vector/gradient-japanese-architecture-temple-illustration_52683-44723.jpg?w=900&t=st=1666847864~exp=1666848464~hmac=605327792b10723766bc7e2ee25d324b01f249639f674c03bc6fe319d7d898fa",
    "https://img.freepik.com/free-vector/flat-design-samurai-background_52683-70562.jpg?w=996&t=st=1666855057~exp=1666855657~hmac=faf3baf6a17ecd1c5bb2414ea9d5bb74931026e541a604b93ec1d5994d5f1de7",
    "https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69459.jpg?w=996&t=st=1666855058~exp=1666855658~hmac=e9ec04907a3c2560e0a360a65c395c151a4bfa9049811d236ee09bbf09fd1f2e",
    "https://img.freepik.com/free-vector/gradient-samurai-dawn-background_23-2149050331.jpg?w=996&t=st=1666855059~exp=1666855659~hmac=64881d6da36545434a39a173d83a57a16a22de324d19b74627b95e7dda961fca",
    "https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69458.jpg?w=996&t=st=1666855061~exp=1666855661~hmac=54c90aa446b67118a8de4f4481290087243511980b6e562fe7d1bddd6e758a03",
    "https://img.freepik.com/free-vector/buildings-tokio-neon-lights_52683-46235.jpg?w=996&t=st=1666855063~exp=1666855663~hmac=622c141a5ce8694b2aac47cf99180629a0a6f5980597914c6d6f01dbb10e19f4"
        "https://img.freepik.com/free-vector/gradient-japanese-architecture-temple-illustration_52683-44723.jpg?w=900&t=st=1666847864~exp=1666848464~hmac=605327792b10723766bc7e2ee25d324b01f249639f674c03bc6fe319d7d898fa",
    "https://img.freepik.com/free-vector/flat-design-samurai-background_52683-70562.jpg?w=996&t=st=1666855057~exp=1666855657~hmac=faf3baf6a17ecd1c5bb2414ea9d5bb74931026e541a604b93ec1d5994d5f1de7",
    "https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69459.jpg?w=996&t=st=1666855058~exp=1666855658~hmac=e9ec04907a3c2560e0a360a65c395c151a4bfa9049811d236ee09bbf09fd1f2e",
    "https://img.freepik.com/free-vector/gradient-samurai-dawn-background_23-2149050331.jpg?w=996&t=st=1666855059~exp=1666855659~hmac=64881d6da36545434a39a173d83a57a16a22de324d19b74627b95e7dda961fca",
    "https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69458.jpg?w=996&t=st=1666855061~exp=1666855661~hmac=54c90aa446b67118a8de4f4481290087243511980b6e562fe7d1bddd6e758a03",
    "https://img.freepik.com/free-vector/buildings-tokio-neon-lights_52683-46235.jpg?w=996&t=st=1666855063~exp=1666855663~hmac=622c141a5ce8694b2aac47cf99180629a0a6f5980597914c6d6f01dbb10e19f4"
        "https://img.freepik.com/free-vector/gradient-japanese-architecture-temple-illustration_52683-44723.jpg?w=900&t=st=1666847864~exp=1666848464~hmac=605327792b10723766bc7e2ee25d324b01f249639f674c03bc6fe319d7d898fa",
    "https://img.freepik.com/free-vector/flat-design-samurai-background_52683-70562.jpg?w=996&t=st=1666855057~exp=1666855657~hmac=faf3baf6a17ecd1c5bb2414ea9d5bb74931026e541a604b93ec1d5994d5f1de7",
    "https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69459.jpg?w=996&t=st=1666855058~exp=1666855658~hmac=e9ec04907a3c2560e0a360a65c395c151a4bfa9049811d236ee09bbf09fd1f2e",
    "https://img.freepik.com/free-vector/gradient-samurai-dawn-background_23-2149050331.jpg?w=996&t=st=1666855059~exp=1666855659~hmac=64881d6da36545434a39a173d83a57a16a22de324d19b74627b95e7dda961fca",
    "https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69458.jpg?w=996&t=st=1666855061~exp=1666855661~hmac=54c90aa446b67118a8de4f4481290087243511980b6e562fe7d1bddd6e758a03",
    "https://img.freepik.com/free-vector/buildings-tokio-neon-lights_52683-46235.jpg?w=996&t=st=1666855063~exp=1666855663~hmac=622c141a5ce8694b2aac47cf99180629a0a6f5980597914c6d6f01dbb10e19f4"
        "https://img.freepik.com/free-vector/gradient-japanese-architecture-temple-illustration_52683-44723.jpg?w=900&t=st=1666847864~exp=1666848464~hmac=605327792b10723766bc7e2ee25d324b01f249639f674c03bc6fe319d7d898fa",
    "https://img.freepik.com/free-vector/flat-design-samurai-background_52683-70562.jpg?w=996&t=st=1666855057~exp=1666855657~hmac=faf3baf6a17ecd1c5bb2414ea9d5bb74931026e541a604b93ec1d5994d5f1de7",
    "https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69459.jpg?w=996&t=st=1666855058~exp=1666855658~hmac=e9ec04907a3c2560e0a360a65c395c151a4bfa9049811d236ee09bbf09fd1f2e",
    "https://img.freepik.com/free-vector/gradient-samurai-dawn-background_23-2149050331.jpg?w=996&t=st=1666855059~exp=1666855659~hmac=64881d6da36545434a39a173d83a57a16a22de324d19b74627b95e7dda961fca",
    "https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69458.jpg?w=996&t=st=1666855061~exp=1666855661~hmac=54c90aa446b67118a8de4f4481290087243511980b6e562fe7d1bddd6e758a03",
    "https://img.freepik.com/free-vector/buildings-tokio-neon-lights_52683-46235.jpg?w=996&t=st=1666855063~exp=1666855663~hmac=622c141a5ce8694b2aac47cf99180629a0a6f5980597914c6d6f01dbb10e19f4"
        "https://img.freepik.com/free-vector/gradient-japanese-architecture-temple-illustration_52683-44723.jpg?w=900&t=st=1666847864~exp=1666848464~hmac=605327792b10723766bc7e2ee25d324b01f249639f674c03bc6fe319d7d898fa",
    "https://img.freepik.com/free-vector/flat-design-samurai-background_52683-70562.jpg?w=996&t=st=1666855057~exp=1666855657~hmac=faf3baf6a17ecd1c5bb2414ea9d5bb74931026e541a604b93ec1d5994d5f1de7",
    "https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69459.jpg?w=996&t=st=1666855058~exp=1666855658~hmac=e9ec04907a3c2560e0a360a65c395c151a4bfa9049811d236ee09bbf09fd1f2e",
    "https://img.freepik.com/free-vector/gradient-samurai-dawn-background_23-2149050331.jpg?w=996&t=st=1666855059~exp=1666855659~hmac=64881d6da36545434a39a173d83a57a16a22de324d19b74627b95e7dda961fca",
    "https://img.freepik.com/free-vector/realistic-samurai-illustrated-background_52683-69458.jpg?w=996&t=st=1666855061~exp=1666855661~hmac=54c90aa446b67118a8de4f4481290087243511980b6e562fe7d1bddd6e758a03",
    "https://img.freepik.com/free-vector/buildings-tokio-neon-lights_52683-46235.jpg?w=996&t=st=1666855063~exp=1666855663~hmac=622c141a5ce8694b2aac47cf99180629a0a6f5980597914c6d6f01dbb10e19f4"
  ];

  String selectedImage = "";

  @override
  void initState() {
    selectedImage = images[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("ANIME TV"),
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage(selectedImage), fit: BoxFit.cover)),
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
                    "Naruto",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Vspace(8),
                  Text(
                    "Action, Comedy, Thriller",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Vspace(8),
                  Text(
                    "Seasons- 1",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Vspace(8),
                  Text(
                    "IMDB rating- 8.8",
                    style: Theme.of(context).textTheme.bodyText2,
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
                    setState(() {
                      selectedImage = images[int.parse(num[0])];
                      print(selectedImage);
                    });
                  }),
              items: images.map((i) {
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
                            imageUrl: i,
                            fit: BoxFit.cover,
                            placeholder: (_, val) =>
                                LoadingAnimationWidget.twistingDots(
                              leftDotColor: Color.fromARGB(255, 255, 255, 255),
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
    );
  }
}
