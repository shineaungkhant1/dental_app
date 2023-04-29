import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/dimens.dart';
import '../widgets/custom_time_circle_painter.dart';
import '../widgets/horizontal_patients_list_view.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromRGBO(18, 17, 151, 1),
        centerTitle: true,
        title: const Text(
          "Today",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.menu_rounded,
            color: Colors.white,
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          const Positioned(
            left: 0.0,
            top: 0.0,
            right: 0,
            child: PartOneBackground(),
          ),
          const Positioned(
            left: 0.0,
            top: 240.0,
            right: 0,
            child: PartTwoBackground(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MARGIN_MEDIUM_2, left: MARGIN_MEDIUM_2),
                  child: EventInformationView(),
                ),
              ),

              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(MARGIN_LARGE),
                child: Container(
                    height: 130,
                    width: double.infinity,
                    margin: const EdgeInsets.all(MARGIN_LARGE),
                    child: const CustomPaintCircleView()
                ),
              ),
              const SizedBox(height: 80),
              SizedBox(
                height: 200,
                width: 500,
                child: MyPatientsHorizontalListView(
                  backgroundColor: const Color.fromRGBO(26, 105, 198, 1),
                  isDetailFlag: true,
                  listOfMyPatient: listOfPatients1,
                ),
              )
            ],
          ),
          Positioned(
            left: 70.0,
            top: 300.0,
            //right: 230,
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 4,
                ),
                image: const DecorationImage(
                  image: AssetImage('asset/esdeath.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            // left: 0.0,
            top: 350.0,
            right: 170,
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 4,
                ),
                image: const DecorationImage(
                  image: AssetImage('asset/esdeath.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            // left: 0.0,
            top: 150.0,
            right: 30,
            child: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 4,
                ),
                image: const DecorationImage(
                  image: AssetImage('asset/esdeath.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            left: 180.0,
            top: 200.0,
            //  right: 0.0,
            child: Column(
              children: const [
                Text(
                  "2:45",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: TEXT_HEADING_2X,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "PM",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: TEXT_REGULAR,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomPaintCircleView extends StatelessWidget {
  const CustomPaintCircleView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(100, 100),
      painter: CustomTimeCirclePainter(),
    );
  }
}

class EventInformationView extends StatelessWidget {
  const EventInformationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Office No.248",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          "3 Patients",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 10,
          ),
        )
      ],
    );
  }
}

class PartTwoBackground extends StatelessWidget {
  const PartTwoBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: const Color.fromRGBO(12, 68, 145, 1),
    );
  }
}

class PartOneBackground extends StatelessWidget {
  const PartOneBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height * 0.5,
      height: 240,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(18, 17, 151, 1),
            Color.fromRGBO(25, 91, 183, 1),
          ],
        ),
      ),
    );
  }
}
