import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/dimens.dart';
import '../widgets/horizontal_patients_list_view.dart';
import '../widgets/time_and_event_list_custom_layout.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  final List<Widget> screens =[
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();

  @override
  Widget build(BuildContext context) {
    final List<Events> listOfEvents = [
      Events(
          startTime: "08:00",
          endTime: "08:30",
          eventName: "Event 1",
          currentTimeFlag: true),
      Events(
          startTime: "09:00",
          endTime: "09:30",
          eventName: "Event 2",
          currentTimeFlag: false),
      Events(
          startTime: "10:00",
          endTime: "10:30",
          eventName: "Event 3",
          currentTimeFlag: false),
      Events(
          startTime: "11:00",
          endTime: "11:30",
          eventName: "Event 4",
          currentTimeFlag: false),
    ];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0.0,
            top: 0.0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                    Color.fromRGBO(25, 91, 183, 1),
                    Color.fromRGBO(18, 17, 151, 1)
                  ])),
              // color: BACKGROUND_COLOR,
            ),
          ),
          Positioned(
            left: 0.0,
            top: 250.0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color.fromRGBO(223, 235, 249, 1),
              // color: BACKGROUND_COLOR,
            ),
          ),
          Container(
            // color: Colors.lightBlue,
            margin: EdgeInsets.only(left: MARGIN_MEDIUM),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SearchView(),
                MyPatientsView(),
                Container(
                  height: 150,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                  // color: Colors.blue,
                  child: MyPatientsHorizontalListView(
                    backgroundColor: Color.fromRGBO(26, 105, 198, 1),
                    isDetailFlag: false,
                    listOfMyPatient: listOfPatients,
                  ),
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Time",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: TEXT_REGULAR_2X,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Event",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: TEXT_REGULAR_2X,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Expanded(
                    child: TimeAndEventListCustomLayout(
                  listOfEvents: listOfEvents,
                  onTapEvent: () {
                    navigateToEventDetailScreen(context);
                  },
                ))
              ],
            ),
          )
        ],
      ),
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 10,
          onPressed: () {},
          child: Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 14),
                shape: BoxShape.circle,
                color: Colors.blue
            ),
            child: Icon(Icons.add, size: 30),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                      onPressed: (){
                    setState(() {
                      currentScreen = HomePage();
                      currentTab = 0;
                    });
                  },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: currentTab == 0 ? Colors.blue : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = HomePage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: currentTab == 1 ? Colors.blue : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = HomePage();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.access_time,
                          color: currentTab == 2 ? Colors.blue : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        currentScreen = HomePage();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: currentTab == 3 ? Colors.blue : Colors.grey,
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<dynamic> navigateToEventDetailScreen(BuildContext context) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EventDetailPage()),
  );
}

class MyPatientsView extends StatelessWidget {
  const MyPatientsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MARGIN_MEDIUM),
      height: 70,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "My Patients",
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
                    "12 Totals",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                margin: EdgeInsets.all(8.0),
                height: 40,
                width: MediaQuery.of(context).size.width * 0.25,
                // color: Colors.white10,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(65, 135, 248, 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: MARGIN_MEDIUM_3, right: MARGIN_MEDIUM_3),
                  child: Stack(
                    children: const [
                      Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            "Today",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          )),
                      Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      height: 70,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            height: 40,
            width: MediaQuery.of(context).size.width * 0.80,
            // color: Colors.white10,
            decoration: BoxDecoration(
              color: SEARCH_BOX_COLOR,
              borderRadius: BorderRadius.circular(60),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: MARGIN_MEDIUM_3, right: MARGIN_MEDIUM_3),
              child: Stack(
                children: [
                  Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text(
                        "Search",
                        style: TextStyle(),
                      )),
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          ),
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('asset/esdeath.png'),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
