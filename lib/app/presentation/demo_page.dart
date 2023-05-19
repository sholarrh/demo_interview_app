import 'package:flutter/material.dart';

import '../data/models/demo_response_model.dart';
import '../data/services/demo_service.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {

  Future<List<DemoResponseModel>?> getDemoData() async {
    var response = await GetDemoDataService.getDemoData();
    return response;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDemoData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<List<DemoResponseModel>?>(
              future: getDemoData(),
              builder: (context, snapshot) {
                var data = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return  Center(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: double.infinity,
                      child: const Text(
                        'There is an error',
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                    )
                  );
                } else {
                  return Column(
                    children: [
                      const Text('Demo Data',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.black,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      const SizedBox(height: 20,),
                      ListView.builder(
                          itemCount: data!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            final demo = data[index];

                            return ListTile(
                              leading: Text(
                                demo.id!.toString(),
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                              title: Text(
                                demo.title!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w300
                                ),
                              ),
                            );
                          }),
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}
