import 'package:flutter/material.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Resouces',
        ),
        actions: const [
          // IconButton(
          //   padding: const EdgeInsets.only(right: 2),
          //   icon: const Icon(Icons.notifications),
          //   onPressed: () {},
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height + 300,
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: const [
                    Text(
                      'Details:-',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 250,
                    width: 1300,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://www.oxfordlearning.com/wp-content/uploads/2017/04/AdobeStock_132869690-1024x683.jpeg'),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'All India Institute Of Medical Science ',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                // Container(
                //   margin: const EdgeInsets.only(right: 300),
                //   child: const Text(
                //     'Delhi\n4.5',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(fontSize: 18),
                //   ),
                // ),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         const Text(
                //           'Amount . 1000',
                //           style: TextStyle(
                //               fontSize: 20,
                //               fontWeight: FontWeight.bold,
                //               color: Colors.red),
                //         ),
                //         ElevatedButton(
                //             style: const ButtonStyle(
                //                 iconSize: MaterialStatePropertyAll(30)),
                //             onPressed: () {
                //               Navigator.push(
                //                   context,
                //                   MaterialPageRoute(
                //                       builder: ((context) =>
                //                           const MyCourses())));
                //             },
                //             child: const Text(
                //               'Buy Now',
                //               style: TextStyle(fontSize: 18),
                //             ))
                //       ]),
                // ),

                const SizedBox(
                  height: 15,
                ),
                // listOfRank("Rank", "2555"),
                // listOfRank("Bond", "--"),
                // listOfRank("Private/Government", "Private"),
                // listOfRank("Institute Fee/Hostel Fee", "2 Lakh"),
                // const SizedBox(
                //   height: 20,
                // ),
                // const Padding(
                //   padding: EdgeInsets.only(right: 210),
                //   child: Row(
                //     children: Text(
                //       'Description :-',
                //       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: const [
                    Text(
                      'Description :-',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    )
                  ]),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Mihi duco adfero, puer pasco homo aduro missa. Tametsi esse pia illa, renuo uter. Premo picea. Loci letum demum abbas ceterum puteus suus metuo. Suus autus abeo queso > putus faenum. Corrigo lenio. Illa quris aurum sequi utrum taceo, pyropus quantum. Frequentatio immineo lacrima opportunitatus. Cum spes, fas vado ruris pudeo relictus > promulgatio scivi. Mane, senis illi sicut sano fleo formica.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      wordSpacing: 5,
                      fontSize: 17,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: const [
                    Text(
                      'For Qustions',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Type Here...",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 10,
                    decoration: InputDecoration(
                        hintText: "Type Here...",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
