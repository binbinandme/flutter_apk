
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_go/widgets/elements/Form/Button/IconButton/demo.dart';

/**
 *  导航，tab 去掉 material leading action 等默认的padding的方式。
 */
class ScTest extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return ScTestStateStack();
  }
}

class ScTestState extends State<ScTest> with SingleTickerProviderStateMixin{
  List tabNames = ["tab1","tab2"];
  TabController _ctl;

  @override
  void initState() {
    _ctl = TabController(length: tabNames.length,vsync: this);
    super.initState();
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_to_queue),
        foregroundColor: Colors.cyanAccent,
        onPressed: () => _ctl.animateTo(1),// tab可以控制跳转
      ),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        titleSpacing: 0.0,// 对title与外层间生效，不针对child
        title: Row(//不要默认的leading title等padding，因为去不掉，但是可以自己用row来实现按钮+title
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.print),// 取代leading
            IconButton(icon: Icon(Icons.access_alarms),onPressed: (){},padding: EdgeInsets.all(0.0)), // iconbutton有最小padding，设置0无效,去不掉
            Text("title"),
            Expanded( //  !!!! 嵌套的row， 内层的 size设置不生效，只会按照最小size绘制，用expand 可以让它最大
              child: Row(//取代 action
//                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
//                  IconButton(icon: Icon(Icons.access_alarms),onPressed: (){},padding: EdgeInsets.all(0.0)),
                  Icon(Icons.access_alarms)
                ],
              ),
            )
          ],
        ),
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.print),onPressed: (){},padding: EdgeInsets.all(1.0)),
//        ],
        bottom: TabBar(
          controller: _ctl,
          tabs: tabNames.map((name) => Tab(text: name,)).toList(),
        ),
      ),
    );
  }
}

class ScTestStateStack extends ScTestState{
  //用stack来实现布局的版本
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.title),
        foregroundColor: Colors.amber,
        onPressed: ()=> _ctl.animateTo(1),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: SizedBox(// stack 默认不会填充宽高
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                left: 1.0,
                child: Icon(Icons.ac_unit),
              ),
              Text("title!"),
              Positioned(
                right: 1.0,
                child: Icon(Icons.share),
              )
            ],
          ),
        ),
        bottom: TabBar(
          controller: _ctl,
          tabs: tabNames.map((name) => Tab(text: name,)).toList(),
        ),
      ),
    );
  }
}

main(){
  runApp(MaterialApp(
    home: ScTest(),
  ));
}