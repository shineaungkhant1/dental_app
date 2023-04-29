import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/dimens.dart';

class MyPatientsHorizontalListView extends StatelessWidget {
  final Color bgColor;
  final bool isDetailFlag;
  List<MyPatient> patientList;

  MyPatientsHorizontalListView(
      {super.key,
        required this.bgColor,
        required this.isDetailFlag,
        required this.patientList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return HorizontalListEachItemView(
          backgroundColor: bgColor,
          myPatient: patientList[index],
          isDetailFlag: isDetailFlag,
        );
      },
    );
  }
}

class HorizontalListEachItemView extends StatelessWidget {
  final Color backgroundColor;
  final MyPatient myPatient;
  final bool isDetailFlag;

  const HorizontalListEachItemView(
      {super.key,
        required this.backgroundColor,
        required this.myPatient,
        required this.isDetailFlag});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: isDetailFlag ? Colors.white : backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Visibility(
            visible: !isDetailFlag,
            child: Container(
              width: 10,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(99, 168, 252, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(MARGIN_MEDIUM_3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: !isDetailFlag,
                    child: RichText(
                      text: TextSpan(
                        text: myPatient.title,
                        style: TextStyle(
                            color:
                            isDetailFlag ? Colors.black45 : Colors.white70,
                            fontSize: TEXT_REGULAR_2X,
                            fontWeight: FontWeight.w500),
                        children: <TextSpan>[
                          TextSpan(
                            text: " /3 patients",
                            style: TextStyle(
                                color: isDetailFlag
                                    ? Colors.black45
                                    : Colors.white70,
                                fontSize: TEXT_REGULAR,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: MARGIN_MEDIUM,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: isDetailFlag ? Colors.black45 : Colors.white70,
                        size: 18,
                      ),
                      const SizedBox(
                        width: MARGIN_MEDIUM,
                      ),
                      Text(
                        myPatient.timeRange,
                        style: TextStyle(
                            color:
                            isDetailFlag ? Colors.black45 : Colors.white70,
                            fontSize: TEXT_REGULAR,
                            fontWeight: FontWeight.w400),
                      ),
                      Visibility(
                        visible: isDetailFlag,
                        child: const SizedBox(
                          width: MARGIN_MEDIUM_3,
                        ),
                      ),
                      Visibility(
                        visible: isDetailFlag,
                        child: Container(
                          // color: Colors.white10,
                          padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(214, 246, 230, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "Confirmed",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(181, 219, 202, 1),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: MARGIN_MEDIUM,
                  ),
                  Visibility(
                    visible: !isDetailFlag,
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.50,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage('asset/esdeath.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(99, 168, 252, 1),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: isDetailFlag,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          myPatient.eventTitle,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black26,
                            fontSize: MARGIN_MEDIUM_3,
                          ),
                        ),
                        const SizedBox(height: MARGIN_MEDIUM),
                        Text(
                          myPatient.eventDescription,
                          maxLines: 3,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        (!isDetailFlag)
                            ? HomePagePatientListImageView(myPatient: myPatient)
                            : const Padding(
                          padding: EdgeInsets.only(
                              top: MARGIN_CARD_MEDIUM_2),
                          child: DetailPagePatientImageAndNameView(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DetailPagePatientImageAndNameView extends StatelessWidget {
  const DetailPagePatientImageAndNameView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30.0,
          width: 30.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image:
              AssetImage('asset/esdeath.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: MARGIN_MEDIUM),
        const Text(
          "Gojo Satoru",
          style: TextStyle(
            color: Colors.black38,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class HomePagePatientListImageView extends StatelessWidget {
  const HomePagePatientListImageView({
    super.key,
    required this.myPatient,
  });

  final MyPatient myPatient;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 60, // width: MediaQuery.of(context).size.width * 0.50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              height: 30.0,
              width: 30.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('asset/esdeath.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
