import 'package:flutter/material.dart';
import 'package:examcellapp/views/Teacher/Setting.dart';
import 'package:examcellapp/views/Teacher/About.dart';
import 'package:examcellapp/views/Teacher/userpage.dart';

//************************************  NavigationDrawer/side navigation starts  *********************************/
class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  final name = 'Phurpa Tshering';

  final email = '02210215.cst@rub.edu.bt';

  final urlImage =
      'https://unsplash.com/photos/Kt8eGw8_S8Y/download?ixid=M3wxMjA3fDB8MXxzZWFyY2h8NXx8YW5pbWF0ZWQlMjBtYW58ZW58MHx8fHwxNjk2OTUzNTU5fDA&force=true';
  //change the photo url
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white, // Set the background color to white
      ),
      child: Material(
        color: Colors.white,
        child: ListView(
          // shrinkWrap:
          //     true, // Allow the ListView to take up only the necessary vertical space
          // padding: padding,
          children: <Widget>[
            buildHeader(
                urlImage: urlImage,
                name: name,
                email: email,
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UserPage(
                          name: name,
                          urlImage: urlImage,
                        )))),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 5), // Adjust the value to set the desired space
              child: Divider(
                color: Colors.black,
                height: 5,
              ),
            ),
            SizedBox(height: 10),
            buildMenuItem(
              text: 'Dark Mode',
              icon: Icons.dark_mode_outlined,
              // onclicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 5),
            buildMenuItem(
              text: 'About',
              icon: Icons.info_outline_rounded,
              onclicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 5),
            buildMenuItem(
              text: 'Setting',
              icon: Icons.settings_outlined,
              onclicked: () => selectedItem(context, 0),
            ),
            const SizedBox(
              height: 16,
            ),
            buildMenuItem(
              text: 'Help',
              icon: Icons.help_outline,
              //change the index
              // onclicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      16.0), // Adjust the value to set the desired space
              child: Divider(
                color: Colors.black,
                height: 5,
              ),
            ),
            const SizedBox(height: 5),
            buildMenuItem(
              text: 'Log Out',
              icon: Icons.logout,
              onclicked: () => {},
            ),
          ],
        ),
      ),
    ));
  }

  // buildheader
  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked, // to navigate to the page by when we click on photo
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 30)),
          child: Column(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(urlImage),
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 4),
              Text(
                email,
                style: const TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ),
      );

  //build MenuItem
  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onclicked,
  }) {
    final Color = Colors.black;
    final hoverColor = Colors.white70;

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
      leading: Icon(
        icon,
        color: Color,
        size: 27,
      ),
      title: Row(
        children: [
          SizedBox(width: 15.0),
          Text(text,
              style: TextStyle(
                color: Color,
                fontSize: 16,
              )),
        ],
      ),
      onTap: onclicked,
      hoverColor: hoverColor,
    );
  }

  //
  void selectedItem(BuildContext context, int index) {
    // Navigator.of(context)
    //     .pop();
    /*to automatically close the drawer after tapping back button,
        also if you want to include the navigation bar in other page simply paste drawer: NavigationDrawerWidget(), under the scaffold
        */
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UploadPage(),
        ));
        break;
      //add here if you wish//==> to navigate to other pages add here
    }
  }
}
//************************************  NavigationDrawer/side navigation ends  *********************************/
