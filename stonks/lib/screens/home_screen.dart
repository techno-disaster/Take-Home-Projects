import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:fradio/fradio.dart';
import 'package:stonks/screens/chats/chat_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List durations = ["1D", "1W", "1M", "3M", "1Y", "ALL"];

  final List<double> result = <double>[
    10,
    20,
    30,
    18,
    40,
    50,
    55,
    50,
    80,
    70,
    90,
    85,
    115,
    104,
    116,
  ];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: ListView(
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatsCard(
                title: "Today",
                state: true,
                progress: 2.62,
              ),
              StatsCard(
                title: "Total %",
                state: true,
                progress: 31.14,
              ),
              StatsCard(
                title: "Total \$",
                state: true,
                progress: 330961,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 80, top: 24, bottom: 12),
            child: Container(
              width: 300.0,
              height: 150.0,
              child: Sparkline(
                lineColor: Colors.greenAccent[700],
                data: result,
                fillMode: FillMode.below,
                fillGradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.green[200],
                    Colors.white,
                  ],
                ),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  height: 30,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    separatorBuilder: (context, index) => SizedBox(
                      width: 25,
                    ),
                    itemBuilder: (context, index) => FRadio(
                      corner: FRadioCorner.all(10),
                      child: Text(
                        durations[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                      selectedColor: Colors.green,
                      selectedChild: Text(
                        durations[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      hasSpace: false,
                      width: 35,
                      value: index,
                      groupValue: selected,
                      onChanged: (value) {
                        setState(() {
                          selected = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Buying Power"),
                    Row(
                      children: [
                        Text("\$300.03"),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Portfolio",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              PortfolioListTile(
                  name: "Paypal",
                  image: "assets/images/paypal.png",
                  details: "Lorem Ipsum",
                  alerts: 5,
                  increase: true,
                  change: 3.6,
                  graphdata: result),
              PortfolioListTile(
                  name: "Twitter",
                  image: "assets/images/twitter.png",
                  details: "Lorem Ipsum",
                  alerts: 3,
                  increase: false,
                  change: 1.4,
                  graphdata: result),
              PortfolioListTile(
                  name: "Tesla",
                  image: "assets/images/tesla.png",
                  details: "Lorem Ipsum",
                  alerts: 0,
                  increase: true,
                  change: 4.1,
                  graphdata: result),
              PortfolioListTile(
                  name: "Facebook",
                  image: "assets/images/facebook.png",
                  details: "Lorem Ipsum",
                  alerts: 0,
                  increase: false,
                  change: 1.2,
                  graphdata: result),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Top Posts",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Row(
                  children: [
                    Text("Ariene McCoy"),
                    SizedBox(width: 5),
                    Text(
                      "2:35 PM",
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
                subtitle: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class StatsCard extends StatelessWidget {
  final String title;
  final bool state;
  final double progress;
  const StatsCard({Key key, this.title, this.state, this.progress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color color = state ? Colors.green : Colors.red;

    return Column(
      children: [
        Text(title),
        Row(
          children: [
            title != "Total \$"
                ? state
                    ? Icon(
                        Icons.arrow_upward,
                        color: color,
                      )
                    : Icon(
                        Icons.arrow_downward,
                        color: color,
                      )
                : Container(),
            title != "Total \$"
                ? Text(
                    "$progress%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  )
                : Text(
                    "\$$progress",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
          ],
        )
      ],
    );
  }
}

class PortfolioListTile extends StatelessWidget {
  final String image;
  final String name;
  final String details;
  final int alerts;
  final List<double> graphdata;
  final bool increase;
  final double change;
  const PortfolioListTile(
      {Key key,
      @required this.image,
      @required this.name,
      @required this.details,
      @required this.alerts,
      @required this.graphdata,
      @required this.increase,
      @required this.change})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChatScreen(
              company: name,
              change: change,
              increase: increase,
            ),
          ),
        );
      },
      leading: CircleAvatar(
        child: Image.asset(
          image,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(name),
              SizedBox(
                width: 10,
              ),
              alerts > 0
                  ? Badge(
                      badgeColor: Theme.of(context).primaryColor,
                      badgeContent: Text(
                        alerts.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  : Container(),
            ],
          ),
          Row(
            children: [
              Container(
                height: 50,
                width: 60,
                child: Sparkline(
                  lineColor: increase ? Colors.greenAccent[700] : Colors.red,
                  data: graphdata,
                  fillMode: FillMode.below,
                  fillGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      increase ? Colors.green[200] : Colors.red[200],
                      Colors.white,
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CompanyStatsBadge(
                change: change,
                increase: increase,
              ),
            ],
          ),
        ],
      ),
      subtitle: Text(details),
    );
  }
}

class CompanyStatsBadge extends StatelessWidget {
  final bool increase;
  final double change;

  const CompanyStatsBadge({Key key, this.increase, this.change}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: increase ? Colors.greenAccent[700] : Colors.red,
        border: Border.all(
          color: increase ? Colors.greenAccent[700] : Colors.red,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            7,
          ),
        ),
      ),
      width: 40,
      height: 20,
      child: Row(
        children: [
          increase
              ? Icon(
                  Icons.arrow_upward,
                  size: 10,
                  color: Colors.white,
                )
              : Icon(
                  Icons.arrow_downward,
                  size: 10,
                  color: Colors.white,
                ),
          Text(
            change.toString() + "%",
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
