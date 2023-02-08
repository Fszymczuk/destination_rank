import 'package:destination_rank/features/home/pages/add_record/add_record_paqe_content.dart';
import 'package:flutter/material.dart';

import '../my_account/my_account_paqe_content.dart';
import '../record/record_paqe_content.dart';
import '../search_paqe/search_paqe_content.dart';

class HomePaqe extends StatefulWidget {
  const HomePaqe({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePaqe> createState() => _HomePaqeState();
}

class _HomePaqeState extends State<HomePaqe> {
  var currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (() {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => AddRecordPaqeContent(onSave: () {
            setState(() {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => HomePaqe()));
            });
          }),
        ));
      })),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const RecordPaqeContent();
        }
        if (currentIndex == 1) {
          return const MyAccountPaqeContent();
        }
        return const SearchPaqeContent();
      }),
      appBar: AppBar(
        title: Builder(builder: (context) {
          if (currentIndex == 0) {
            return const Text('home');
          }
          if (currentIndex == 1) {
            return const Text('myaccount');
          }
          return const Text('search');
        }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'My Account'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
        ],
      ),
    );
  }
}
