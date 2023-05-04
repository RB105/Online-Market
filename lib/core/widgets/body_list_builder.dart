import 'package:changelang/model/my_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BodyListBuilder extends StatelessWidget {
  final List<MyModel> list;
  const BodyListBuilder({super.key,required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
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
                              list[index].imgUrl
                                            .toString()),
                                        fit: BoxFit.contain)),
                              )),
                              Positioned(
                                  top: 150,
                                  child: Column(
                                    children: [
                                      Text(
                                        list[index].productName
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "${list[index].sum.toString()} USD",
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
                        itemCount: list.length),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "see more".tr(),
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward),
                    color: Colors.blue.shade900,
                  )
                ],
              ),
            ],
          );
  }
}