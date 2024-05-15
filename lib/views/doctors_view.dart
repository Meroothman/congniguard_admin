import 'package:flutter/material.dart';

class DoctorsViewList {
  final String name;
  final String image;
  final String bio;
  final String phone;

  const DoctorsViewList(
      {required this.name,
      required this.image,
      required this.bio,
      required this.phone});
}

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key});

  final List<DoctorsViewList> doctors = const [
    DoctorsViewList(
        name: "Dr. John Doe",
        image: "assets/images/my_photo.jpg",
        bio:
            "hello i am a dr john doe , i  am a good doctor in the field of Medicine , i can help you",
        phone: "012345678910"),
    DoctorsViewList(
        name: "Dr. John Doe",
        image: "assets/images/my_photo.jpg",
        bio:
            "hello i am a dr john doe , i  am a good doctor in the field of Medicine , i can help you",
        phone: "012345678910"),
    DoctorsViewList(
        name: "Dr. John Doe",
        image: "assets/images/my_photo.jpg",
        bio:
            "hello i am a dr john doe , i  am a good doctor in the field of Medicine , i can help you",
        phone: "012345678910"),
    DoctorsViewList(
        name: "Dr. John Doe",
        image: "assets/images/my_photo.jpg",
        bio:
            "hello i am a dr john doe , i  am a good doctor in the field of Medicine , i can help you",
        phone: "012345678910"),
    DoctorsViewList(
        name: "Dr. John Doe",
        image: "assets/images/my_photo.jpg",
        bio:
            "hello i am a dr john doe , i  am a good doctor in the field of Medicine , i can help you",
        phone: "012345678910"),
    DoctorsViewList(
        name: "Dr. John Doe",
        image: "assets/images/my_photo.jpg",
        bio:
            "hello i am a dr john doe , i  am a good doctor in the field of Medicine , i can help you",
        phone: "012345678910"),
    DoctorsViewList(
        name: "Dr. John Doe",
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
                    buildDoctorsList(doctors[index], context),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 8.0,
                    ),
                itemCount: doctors.length),
          ],
        ),
      ),
    );
  }
}
Widget buildDoctorsList(DoctorsViewList model, context) => Card(
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

