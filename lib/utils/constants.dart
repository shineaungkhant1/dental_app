import 'package:flutter/material.dart';

class Events {
  final String startTime;
  final String endTime;
  final String eventName;
  final bool currentTimeFlag;

  Events(
      {required this.startTime,
      required this.endTime,
      required this.eventName,
      required this.currentTimeFlag});
}

class MyPatient {
  final String title;
  final String timeRange;
  final String eventTitle;
  final String eventDescription;
  final String patientProfile;
  final String patientName;

  MyPatient({
    required this.title,
    required this.timeRange,
    required this.eventTitle,
    required this.eventDescription,
    required this.patientProfile,
    required this.patientName,
  });
}

final List<Events> eventList = [
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


final List<MyPatient> patientList = [
  MyPatient(
      title: "Office No.248",
      timeRange: "8:30AM - 02:00PM",
      eventTitle: "Teeth Drilling",
      eventDescription:
          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Vel fugit eligendi rem voluptate, officia quas ex nisi rerum molestiae, iusto repellat, quo eveniet sed nesciunt eaque architecto repellendus pariatur quis.",
      patientProfile: 'asset/esdeath.png',
      patientName: "Gojo"),
  MyPatient(
      title: "Office No.248",
      timeRange: "9:30AM - 03:00PM",
      eventTitle: "Teeth Drilling",
      eventDescription:
          "A dental drill or handpiece is a hand-held, mechanical instrument used to perform a variety of common dental procedures, including removing decay, polishing fillings, performing cosmetic dentistry, and altering prostheses. The handpiece itself consists of internal mechanical components which initiate a rotational force and provide power to the cutting instrument, usually a dental burr. ",
      patientProfile: 'asset/esdeath.png',
      patientName: "Sukuna"),
  MyPatient(
      title: "Office No.248",
      timeRange: "10:30AM - 04:00PM",
      eventTitle: "Teeth Drilling",
      eventDescription:
      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Vel fugit eligendi rem voluptate, officia quas ex nisi rerum molestiae, iusto repellat, quo eveniet sed nesciunt eaque architecto repellendus pariatur quis.",
      patientProfile: 'asset/esdeath.png',
      patientName: "Zoro"),
  MyPatient(
      title: "Office No.248",
      timeRange: "11:30AM - 05:00PM",
      eventTitle: "Teeth Drilling",
      eventDescription:
      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Vel fugit eligendi rem voluptate, officia quas ex nisi rerum molestiae, iusto repellat, quo eveniet sed nesciunt eaque architecto repellendus pariatur quis.",
      patientProfile: 'asset/esdeath.png',
      patientName: "Makima"),
  MyPatient(
      title: "Office No.248",
      timeRange: "12:30AM - 06:00PM",
      eventTitle: "Teeth Drilling",
      eventDescription:
      "Lorem ipsum dolor sit amet consectetur adipisicing elit. Vel fugit eligendi rem voluptate, officia quas ex nisi rerum molestiae, iusto repellat, quo eveniet sed nesciunt eaque architecto repellendus pariatur quis.",
      patientProfile: 'asset/esdeath.png',
      patientName: "Saitama"),
];



List<String> testFunction() {
  List<String> timesInterval = [];
  final interval = const Duration(minutes: 30);
  final startTime = TimeOfDay(hour: 8, minute: 0);
  final endTime = TimeOfDay(hour: 16, minute: 0);

  var time = startTime;
  while (time.hour < endTime.hour ||
      (time.hour == endTime.hour && time.minute <= endTime.minute)) {

    time = time.replacing(
      hour: (time.hour + (time.minute + interval.inMinutes) ~/ 60) % 24,
      minute: (time.minute + interval.inMinutes) % 60,
    );

    final timeString =
        '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    print("time = " + timeString);
    timesInterval.add(timeString);
  }

  final Map<String, List<String>> timeIntervals1 = {};

  for (final time in timesInterval) {
    final hourMinute = time.split(':');
    final hour = hourMinute[0];
    final minute = hourMinute[1];
    final formattedTime = '$hour:$minute';

    if (!timeIntervals1.containsKey(formattedTime)) {
      timeIntervals1[formattedTime] = [];
    }

    timeIntervals1[formattedTime]!.add(time);
  }

  print(timeIntervals1);

  return timesInterval;
}


