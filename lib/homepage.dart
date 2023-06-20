import 'package:flutter/material.dart';
import 'package:success_stories/sharestory.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'success_stories'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController editingController = TextEditingController();

  //final duplicateItems = List<String>.generate(10000, (i) => "Item $i");

  List<String> litems = [
    "Chhavi Jajoo & Yash Chanda",
    "Bhagyashree Maniar & Shubham",
    "Raghav Jhanwar & Lucky Gagrani",
    "Krishna Mundhada & Harsha Asawa",
    "Mohit Somani & Bhagyashri Bhutada"
  ];
  List<String> limages = [
    "assets/chhavi.jpg",
    "assets/bhagyashree.jpg",
    "assets/raghav.jpg",
    "assets/krishna.jpg",
    "assets/mohit .jpg"
  ];
  List<String> linfo = [
    "Checked each other's profile and our parents",
    "Good experience",
    "बेटे चि. राघव का संबंध सौ.का. लक्की सुपुत्री-शांतिलाल जी \n गगरानी मंदसौर के साथ सुनिश्चित हुआ है",
    "It was great using this website...thanks ",
    "Thank you."
  ];
  List<String> dateofmarriage = [
    " November 04, 2022",
    " August 10, 2022",
    "July 11, 2022",
    "December 11, 2021",
    "June 10, 2023",
  ];

  var items = <String>[];

  @override
  void initState() {
    items = litems;
    items = limages;
    items = linfo;
    items = dateofmarriage;
    super.initState();
  }

  void filterSearchResults(String query) {
    setState(() {
      items = litems
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Container(
                      height: 450,
                      width: 250,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffEBEDF0),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 300,
                              width: 400,
                              child: Image.asset("${limages[index]}"),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('${litems[index]}'),
                            Text(
                              '${linfo[index]}',
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            TextButton(
                                child: const Text("Read More",
                                    style: TextStyle(color: Colors.blue)),
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        //Scrolling given for content in Container()
                                        return SingleChildScrollView(
                                          child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(40.0),
                                                    topRight:
                                                        Radius.circular(40.0),
                                                  ),
                                                ),
                                                height: 500,
                                                padding: EdgeInsets.only(
                                                    bottom:
                                                        MediaQuery.of(context)
                                                            .viewInsets
                                                            .bottom),
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(),
                                                  child: Column(children: [
                                                    Row(
                                                      children: [
                                                        const Text(
                                                            "Success Story of  "),
                                                        Text('${litems[index]}',
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                            )),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 20),
                                                    Row(
                                                      children: [
                                                        const Text(
                                                            "What they say  "),
                                                        Text(
                                                          '${linfo[index]}',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 12,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    63,
                                                                    60,
                                                                    60),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 20),
                                                    Row(children: [
                                                      const Text(
                                                          "Date of Marriage "),
                                                      Text(
                                                        '${dateofmarriage[index]}',
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                          color: Color.fromARGB(
                                                              255, 63, 60, 60),
                                                        ),
                                                      ),
                                                    ]),
                                                    TextButton(
                                                        onPressed: () {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          const Sharestory()));
                                                        },
                                                        child: const Text(
                                                            "Share your succes stories",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue))),
                                                    SizedBox(
                                                      height: 300,
                                                      width: 400,
                                                      child: Image.asset(
                                                          limages[index]),
                                                    ),
                                                  ]),
                                                ),
                                              )),
                                        );
                                      });
                                })
                          ]));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
