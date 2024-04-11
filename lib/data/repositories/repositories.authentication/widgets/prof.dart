import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:habitomic_app/features/ANYTHING/screens/video/controller/profile_controller.dart';

class ProfileUtil extends StatefulWidget {
  final String username;
  final String fullname;
  final DateFormat date;
  final bool isuserprofile;

  ProfileUtil({
    Key? key,
    required this.username,
    required this.fullname,
    required this.date,
    required this.isuserprofile,
  }) : super(key: key);

  @override
  State<ProfileUtil> createState() => _ProfileUtilState();
}

class _ProfileUtilState extends State<ProfileUtil> {
  final ProfileController profileController = Get.find<ProfileController>();
  TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(() => (Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          height: 380,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            profileController.user['ProfilePicture'] ?? '',
                          ),
                          radius: 40,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.fullname,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.username,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey[500],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.av_timer_rounded),
                              Text(
                                'Member since ${widget.date.format(DateTime.now())}',
                              ),
                            ],
                          ),
                          widget.isuserprofile
                              ? profileController.user["isFollowing"]
                                  ? MaterialButton(
                                      height: 50,
                                      minWidth: 150,
                                      color: Colors.grey,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      onPressed: () {},
                                      child: Text(
                                        'Followed',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    )
                                  : MaterialButton(
                                      height: 50,
                                      minWidth: 150,
                                      color: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      onPressed: () =>
                                          profileController.followUser(),
                                      child: Text(
                                        'Follow',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    )
                              : Container()
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Bio',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BioDescription(),
                      ),
                    );
                  },
                  child: bioController.text.isEmpty
                      ? Text(
                          'No Bio',
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        )
                      : Text(
                          bioController.text,
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    rowColumn('Community', '2'),
                    rowColumn('Habits', '3'),
                    rowColumn('Rating', "${profileController.user["rating"]}"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          profileController.user['Following'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Following',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 5),
                    Column(
                      children: [
                        Text(
                          profileController.user['Follower'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Followers',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )));
  }

  Widget rowColumn(String title, String howMuch) {
    return Row(
      children: [
        Column(
          children: [
            Icon(
              Icons.people_alt_outlined,
              size: 40,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(howMuch),
          ],
        ),
      ],
    );
  }
}

class BioDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController bioController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.check,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: bioController,
                decoration: InputDecoration(
                  labelText: 'Bio',
                ),
                onChanged: (value) {
                  bioController.text = value;
                },
              ),
              Text(
                'Write some description about yourself',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
