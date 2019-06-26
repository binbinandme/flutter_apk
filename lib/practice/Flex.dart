import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlexLayoutTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlexState();
  }
}

class FlexState extends State<FlexLayoutTestRoute> {
  var color = Colors.brown;

  void _click(){
    setState(() {
      color = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: "111",
      home: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            child: ImageIcon(AssetImage("assets/images/calendar.png")),
            onTap: () {
             _click();
            },
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //Flex的两个子widget按1：2来占据水平空间
            Flex(
              direction: Axis.horizontal,
              textDirection: TextDirection.ltr,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 20.0,
                    color: color,
                    child: Transform(
                      alignment: Alignment.topLeft,
                        transform: Matrix4.skewY(-0.2),
                      child: Container(
                        height: 10,
                        color: Colors.deepOrangeAccent,
                          child: Text("cline!"),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0,left: 30),
              child: SizedBox(
                height: 100.0,
                //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    // 拉伸布局
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 30.0,
                        color: Colors.red,
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 30.0,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: FlexLayoutTestRoute()));
}
