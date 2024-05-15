import 'package:congniguard_admain/views/doctors_view.dart';
import 'package:flutter/material.dart';
class VolunteersViewList {
  final String name;
  final String image;
  final String bio;
  final String phone;

  const VolunteersViewList (
      {required this.name,
      required this.image,
      required this.bio,
      required this.phone});
}

class VolunteersView extends StatelessWidget {
  const VolunteersView({super.key});

  final List<VolunteersViewList> volunteers = const [
    VolunteersViewList(
        name: "V : mohammed",
        image: "assets/images/my_photo.jpg",
        bio:
            "hello i am a dr john doe , i  am a good doctor in the field of Medicine , i can help you",
        phone: "012345678910"),
    VolunteersViewList(
        name: "V : mohammed",
        image: "assets/images/my_photo.jpg",
        bio:
            "hello i am a dr john doe , i  am a good doctor in the field of Medicine , i can help you",
        phone: "012345678910"),
    VolunteersViewList(
        name: "V : mohammed",
        image: "assets/images/my_photo.jpg",
        bio:
            "hello i am a dr john doe , i  am a good doctor in the field of Medicine , i can help you",
        phone: "012345678910"),
    VolunteersViewList(
        name: "V : mohammed",
        image: "assets/images/my_photo.jpg",
        bio:
            "hello i am a dr john doe , i  am a good doctor in the field of Medicine , i can help you",
        phone: "012345678910"),
    VolunteersViewList(
        name: "V : mohammed",
        image: "assets/images/my_photo.jpg",
        bio:
            "hello i am a dr john doe , i  am a good doctor in the field of Medicine , i can help you",
        phone: "012345678910"),
    VolunteersViewList(
        name: "V : mohammed",
        image: "assets/images/my_photo.jpg",
        bio:
            "hello i am a dr john doe , i  am a good doctor in the field of Medicine , i can help you",
        phone: "012345678910"),
    VolunteersViewList(
        name: "V : mohammed",
        image: "assets/images/my_photo.jpg",
        bio:
            "hello i am a dr john doe , i  am a good doctor in the field of Medicine , i can help you",
        phone: "012345678910"),
  ];

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 235, 235),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildDoctorsList(volunteers[index], context),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8.0,
                    ),
                itemCount: volunteers.length),
          ],
        ),
      ),
    );
  }
}

Widget buildDoctorsList(VolunteersViewList model, context) => Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                    radius: 25, backgroundImage: AssetImage(model.image)),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            model.name,
                            style: const TextStyle(
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                      Text(model.bio,
                          style: const TextStyle(
                            color: Colors.grey,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15.0,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
              ),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.phone,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  model.phone,
                ),
              ],
            ),
          ],
        ),
      ),
    );
