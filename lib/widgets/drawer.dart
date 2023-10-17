import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Drawerpage extends StatelessWidget {
  const Drawerpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: const [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Color.fromARGB(255, 5, 195, 253)),
                margin: EdgeInsets.zero,
                accountName: Text("Sahil A Dhanwani"),
                accountEmail: Text("sahildhanwani291203@gmail.com"),
                // currentAccountPicture: Image.network("https://images.ctfassets.net/hrltx12pl8hq/5ZjPpfAhn1rZWeopnHiXb/3e1b9a709297905672a0d24eac94a873/thumb_nov22_03.jpg"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage("https://images.ctfassets.net/hrltx12pl8hq/5ZjPpfAhn1rZWeopnHiXb/3e1b9a709297905672a0d24eac94a873/thumb_nov22_03.jpg"),
                ),
              ),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white),
              title: Text(
                "Home", 
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              ),

              ListTile(
              leading: Icon(CupertinoIcons.person_fill, color: Colors.white),
              title: Text(
                "Profile", 
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              ),

              ListTile(
              leading: Icon(CupertinoIcons.info, color: Colors.white),
              title: Text(
                "About", 
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              ),
          ],
        ),
      ),
    );
  }
}
