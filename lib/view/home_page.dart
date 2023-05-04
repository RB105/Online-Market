import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:changelang/model/my_model.dart';
import 'package:changelang/provider/home_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final List<MyModel> _list = [
    MyModel("Apple Watch", 359,
        "https://www.pngkey.com/png/detail/871-8710663_apple-watch-png-apple-watch-icon-png.png"),
    MyModel("Apple Watch", 319,
        "https://banner2.cleanpng.com/20180310/xve/kisspng-apple-watch-series-2-apple-watch-series-3-smartwat-black-smart-watch-5aa3dc83b87036.0463837515206882597555.jpg"),
    MyModel("Smart Watch", 210,
        "https://d2d22nphq0yz8t.cloudfront.net/88e6cc4b-eaa1-4053-af65-563d88ba8b26/https://media.croma.com/image/upload/v1605338825/Croma%20Assets/Communication/Wearable%20Devices/Images/8921639583774.png/mxw_640,f_auto"),
    MyModel("Apple Watch", 300,
        "https://support.apple.com/library/content/dam/edam/applecare/images/en_US/applewatch/watchos8-series7-watch-turn-on.png"),
    MyModel("Samsung Watch", 250,
        "https://d2d22nphq0yz8t.cloudfront.net/88e6cc4b-eaa1-4053-af65-563d88ba8b26/https://media.croma.com/image/upload/v1605338825/Croma%20Assets/Communication/Wearable%20Devices/Images/8921639583774.png/mxw_640,f_auto")
  ];

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => HomeProvider(),
      builder: (context, child) => _scaffold(context),
    );
  }

  Scaffold _scaffold(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text("search".tr()),
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          actions: [
            Text(context.locale.languageCode.toString(),
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            IconButton(
                onPressed: () async {
                  Provider.of<HomeProvider>(context, listen: false)
                      .changeLang();
                  await context.setLocale(Locale(
                      Provider.of<HomeProvider>(context, listen: false).langs[
                          Provider.of<HomeProvider>(context, listen: false)
                              .currentIndex]));
                },
                icon: const Icon(Icons.language))
          ],
          bottom: TabBar(tabs: [
            Text("wearable".tr(),
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Text("laptops".tr(),
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            Text("phones".tr(),
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold))
          ]),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Text(
                "centertext".tr(),
                style: const TextStyle(fontSize: 34),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 300,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              height: 270,
                              width: 250,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Positioned(
                                child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          _list[index].imgUrl.toString()),
                                      fit: BoxFit.contain)),
                            )),
                            Positioned(
                                top: 150,
                                child: Column(
                                  children: [
                                    Text(
                                      _list[index].productName.toString(),
                                      style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${_list[index].sum.toString()} USD",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w900),
                                    )
                                  ],
                                ))
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 20,
                          ),
                      itemCount: _list.length),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "see more".tr(),
                  style: TextStyle(
                      color: Colors.blue.shade900, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward),
                  color: Colors.blue.shade900,
                )
              ],
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton.extended(
                onPressed: () {
                  if (AdaptiveTheme.of(context).mode==AdaptiveThemeMode.dark) {
                    AdaptiveTheme.of(context).setLight();
                  } else {
                    AdaptiveTheme.of(context).setDark();
                  }
                },
                label: const Text("Change Theme")),
          ],
        ));
  }
}
