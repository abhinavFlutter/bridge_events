import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool SwitchOn = false;
  bool SwitchOn1 = false;
  bool SwitchOn2 = false;
  String dropdownValue = "English";

//items list out here
  var items = [
    'English',
    'Malayalam',
    'Kannada',
    'Hindi',
    'Tamil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const Center(
            child: Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            "Settings",
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w900,
                letterSpacing: 2),
          ),
        )),
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 7),
          child: ListTile(
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              // tileColor: Color.fromARGB(80, 80, 80, 80),
              leading: Icon(
                Icons.person_add_alt,
                color: Colors.black,
              ),
              title: Text(
                "Accounts",
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40, left: 40, top: 10),
          child: ListTile(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            tileColor: const Color.fromARGB(80, 80, 80, 80),
            onTap: () {},
            leading: const Icon(
              Icons.edit,
              size: 17,
              color: Colors.black,
            ),
            title: const Text("Edit Profile", style: TextStyle(fontSize: 15)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40, left: 40),
          child: ListTile(
            tileColor: const Color.fromARGB(80, 80, 80, 80),
            onTap: () {},
            leading: const Icon(
              Icons.password_sharp,
              size: 17,
              color: Colors.black,
            ),
            title:
                const Text("Change Password", style: TextStyle(fontSize: 15)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40, left: 40),
          child: ListTile(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            tileColor: const Color.fromARGB(80, 80, 80, 80),
            onTap: () {},
            leading: const Icon(
              Icons.delete_outline_rounded,
              size: 17,
              color: Colors.black,
            ),
            title: const Text("Delete Account", style: TextStyle(fontSize: 15)),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 10, left: 10, top: 7),
          child: ListTile(
              leading: Icon(
                Icons.privacy_tip,
                color: Colors.black,
              ),
              title: Text("Notification")),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40, left: 40, top: 7),
          child: ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              tileColor: const Color.fromARGB(80, 80, 80, 80),
              onTap: () {},
              leading: const Icon(
                Icons.notification_add,
                size: 17,
                color: Colors.black,
              ),
              title: const Text("Notification", style: TextStyle(fontSize: 15)),
              trailing: Switch(
                activeColor: Colors.lightGreenAccent,
                activeTrackColor: Colors.black,
                inactiveThumbColor: Colors.black54,
                inactiveTrackColor: Colors.black,
                value: SwitchOn,
                onChanged: (value) {
                  setState(() {
                    SwitchOn = !SwitchOn;
                  });
                },
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40, left: 40),
          child: ListTile(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              tileColor: const Color.fromARGB(80, 80, 80, 80),
              onTap: () {},
              leading: const Icon(
                Icons.notification_add_outlined,
                size: 17,
                color: Colors.black,
              ),
              title: const Text("App Notification",
                  style: TextStyle(fontSize: 15)),
              trailing: Switch(
                activeColor: Colors.lightGreenAccent,
                activeTrackColor: Colors.black,
                inactiveThumbColor: Colors.black54,
                inactiveTrackColor: Colors.black,
                value: SwitchOn2,
                onChanged: (value) {
                  setState(() {
                    SwitchOn2 = !SwitchOn2;
                  });
                },
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40, left: 40, top: 20),
          child: ListTile(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            tileColor: const Color.fromARGB(80, 80, 80, 80),
            onTap: () {},
            leading: const Icon(
              Icons.sunny,
              size: 17,
              color: Colors.black,
            ),
            title: const Text("Dark / Light", style: TextStyle(fontSize: 15)),
            trailing: Transform.scale(
              scale: 0.9,
              child: Switch(
                activeColor: Colors.lightGreenAccent,
                activeTrackColor: Colors.black,
                inactiveThumbColor: Colors.black54,
                inactiveTrackColor: Colors.black,
                value: SwitchOn1,
                onChanged: (value) {
                  setState(() {
                    SwitchOn1 = !SwitchOn1;
                  });
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 40, left: 40, top: 20),
          child: ListTile(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            tileColor: const Color.fromARGB(80, 80, 80, 80),
            onTap: () {},
            leading: const Icon(
              Icons.language,
              size: 17,
              color: Colors.black,
            ),
            title: const Text("Language", style: TextStyle(fontSize: 15)),
            trailing: DropdownButton(
              borderRadius: BorderRadius.circular(15),
              // dropdownColor: const Color.fromARGB(47, 47, 47, 47),
              style: const TextStyle(color: Colors.black87),
              value: dropdownValue,
              icon: const Icon(Icons.expand_circle_down_outlined,
                  size: 17, color: Colors.black54),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 20, right: 40, left: 40, bottom: 20),
          child: ListTile(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            tileColor: const Color.fromARGB(80, 80, 80, 80),
            onTap: () {},
            leading: const Icon(
              Icons.logout,
              size: 20,
              color: Colors.red,
            ),
            title: const Padding(
              padding: EdgeInsets.only(left: 33),
              child: Text("Logout",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.red,
                      fontWeight: FontWeight.w500)),
            ),
          ),
        ),
      ]),
    );
  }
}
