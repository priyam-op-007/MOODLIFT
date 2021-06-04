import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/mood.dart';

class ItemWidget extends StatelessWidget {

  final Item item;

  const ItemWidget({Key key, @required this.item}) : assert(item !=null ), super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
          child: ListTile(
            onTap: () {
              print("${item.name} pressed");
            },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
      ),
    );
  }
}