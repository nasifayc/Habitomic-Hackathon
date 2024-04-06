import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:habitomic_app/data/repositories/repositories.authentication/widgets/smallCircleIcon.dart';
import 'package:habitomic_app/features/ANYTHING/screens/Home/widgets/afterProfile/checkhabit/checkHabits.dart';
import 'package:habitomic_app/features/personalization/controllers/user_controller.dart';

class joinCommunity extends StatefulWidget {
  final String comPicture;
  final String comname;
  final String comBio;
  final String comMembers;
  final String comHabits;
  final String rating;
  const joinCommunity({
    super.key,
    required this.comBio,
    required this.comHabits,
    required this.comMembers,
    required this.comPicture,
    required this.comname,
    required this.rating,
  });

  @override
  State<joinCommunity> createState() => _joinCommunityState();
}

bool isfollowing = false;

class _joinCommunityState extends State<joinCommunity>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(
      length: 2,
      vsync: this,
    );
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: ClipOval(
                child: Material(
                  color: Colors.grey,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: Colors.grey[200],
                expandedHeight: 380,
                flexibleSpace: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage(
                                    widget.comPicture,
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      widget.comname,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.star_border_outlined,
                                          ),
                                        ),
                                        Text(
                                          '${widget.rating} Rating',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Bio',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              widget.comBio,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.people_outline_rounded,
                                    ),
                                    Text(
                                      '${widget.comMembers} Members',
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.people_outline_rounded,
                                    ),
                                    Text(
                                      '${widget.comHabits} Habits',
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.people_outline_rounded,
                                    ),
                                    Text(
                                      '${widget.comMembers} Members',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            !isfollowing
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MaterialButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        color:
                                            Color.fromARGB(255, 139, 87, 148),
                                        height: 50,
                                        minWidth: 200,
                                        onPressed: () {
                                          setState(() {
                                            isfollowing = true;
                                          });
                                        },
                                        child: Center(
                                          child: Text(
                                            'Join Now',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      ClipOval(
                                        child: Material(
                                          color: Colors.grey,
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.share,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MaterialButton(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        color: const Color.fromARGB(
                                            255, 155, 85, 168),
                                        height: 50,
                                        minWidth: 200,
                                        onPressed: () {
                                          Get.to(
                                            CheckHabits(),
                                          );
                                        },
                                        child: Center(
                                          child: Text('Check Habits'),
                                        ),
                                      ),
                                      ClipOval(
                                        child: Material(
                                          color: Colors.yellow,
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.kitesurfing_outlined,
                                            ),
                                          ),
                                        ),
                                      ),
                                      ClipOval(
                                        child: Material(
                                          color: Colors.grey,
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.share,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                bottom: TabBar(
                  unselectedLabelStyle: TextStyle(color: Colors.grey),
                  labelColor: Colors.green,
                  overlayColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 187, 151, 193),
                  ),
                  controller: controller,
                  tabs: [
                    Tab(
                      icon: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.green,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Feed'),
                        ),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.green,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text('Habits'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: controller,
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('posts')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('post')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Exfeed(
                        username: snapshot.data!.docs[index]['username'],
                        discription: snapshot.data!.docs[index]['discription'],
                        postphotourl: snapshot.data!.docs[index]
                            ['PostphotoUrl'],
                        index: index,
                      );
                    },
                  );
                },
              ),
              Container(
                color: Colors.blue,
                height: 600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//for the feed part

class Exfeed extends StatefulWidget {
  final String username;
  final String postphotourl;
  final String discription;
  final int index;
  const Exfeed({
    super.key,
    required this.username,
    required this.discription,
    required this.postphotourl,
    required this.index,
  });

  @override
  State<Exfeed> createState() => _ExfeedState();
}

class _ExfeedState extends State<Exfeed> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        color: Colors.grey[100],
        height: 310,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage(
                        controller.user.value.profilePicture,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          controller.user.value.fullName.substring(0, 7),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '@${controller.user.value.fullName.substring(0, 7)}',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text('  2hr ago'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert_outlined,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.discription),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'more',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 150,
                  width: 2,
                  color: Colors.black54,
                ),
                Container(
                  height: 150,
                  width: 250,
                  child: Image(
                    image: NetworkImage(
                      widget.postphotourl,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    smallCircleIcon(
                      onpressed: () {},
                      icons: Icon(
                        Icons.favorite,
                        size: 20,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.grey.shade400,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    smallCircleIcon(
                        onpressed: () {
                          //  Get.to(comment());
                        },
                        icons: Icon(
                          Icons.mode_comment_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.grey.shade400),
                    SizedBox(
                      height: 10,
                    ),
                    smallCircleIcon(
                        onpressed: () {},
                        icons: Icon(
                          Icons.bookmark_add_outlined,
                          size: 20,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.grey.shade400),
                  ],
                ),
              ],
            ),
            Container(
              height: 5,
              color: Colors.grey[200],
            ),
          ],
        ),
      ),
    );
  }
}