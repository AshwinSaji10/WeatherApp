import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class AddLocation extends StatefulWidget {
  const AddLocation({super.key});

  @override
  State<AddLocation> createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 40, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // const SizedBox(height:10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: searchController,
            ),

            //Search list
            GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueAccent),
                child: const Center(
                  child: Text("Add City"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
