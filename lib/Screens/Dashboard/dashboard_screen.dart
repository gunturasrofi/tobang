import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            // horizontal: defaultMargin,
            ),
        color: Colors.black,
        height: 80,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Food Market",
                  //style: blackFontStyle1,
                ),
                Text(
                  "Let's get some foods",
                  // style:
                  //     greyFontStyle.copyWith(
                  //   fontWeight: FontWeight.w300,
                  // ),
                )
              ],
            ),
            Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(
                      "assets/images/love_burger.png"), // NetworkImage(
                  //   (context.watch<UserCubit>().state as UserLoaded)
                  //       .user
                  //       .picturePath,
                  // ),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Expanded buildDivider() {
  return Expanded(
    child: Divider(
      color: Color(0xFFD9D9D9),
      height: 1.5,
    ),
  );
}
