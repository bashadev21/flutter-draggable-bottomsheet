import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const googleimage =
    'https://aboutreact.com/wp-content/uploads/2018/09/map_example4-1.png';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

double prcent = 0.0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
                bottom: MediaQuery.of(context).size.height * 0.3,
                child: Image.network(
                  googleimage,
                  fit: BoxFit.cover,
                )),
            Positioned(
                left: 20,
                top: 20,
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {},
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.black,
                      )),
                )),
            Positioned.fill(
              child: NotificationListener<DraggableScrollableNotification>(
                onNotification: (notify) {
                  setState(() {
                    ///  print(2 * notify.extent - 0.8);
                    prcent = 2 * notify.extent - 0.8;
                  });

                  return true;
                },
                child: DraggableScrollableSheet(
                  maxChildSize: 0.85,
                  minChildSize: 0.4,
                  builder: (_, controller) {
                    return Material(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                      elevation: 10,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding:
                                EdgeInsets.only(left: 10, top: 10, bottom: 5),
                            child: Text(
                              'Its good to see you',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                              'Where are you going?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 6),
                            child: CupertinoSearchTextField(
                              placeholder: 'Search Location',
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: 20,
                                physics: const BouncingScrollPhysics(),
                                controller: controller,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text('Address $index'),
                                    subtitle: Text('Ciyt $index'),
                                  );
                                }),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
                top: -170 * (1 - prcent),
                left: 0,
                right: 0,
                child: const SearchDestination()),
            Positioned(
                bottom: -50 * (1 - prcent),
                left: 0,
                right: 0,
                child: const PickupLocation())
          ],
        ),
      ),
    );
  }
}

class SearchDestination extends StatelessWidget {
  const SearchDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        elevation: 10,
        child: Column(
          children: [
            Row(
              children: [
                BackButton(
                  onPressed: () {
                    prcent = 0.0;
                  },
                ),
                const Text('Choose Destination',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ))
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: CupertinoSearchTextField(
                placeholder: 'Avaenue 24',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: CupertinoSearchTextField(
                placeholder: 'Search Destination',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PickupLocation extends StatelessWidget {
  const PickupLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.location_on),
            Text(' Pickup Map Location')
          ],
        ),
      ),
    );
  }
}
