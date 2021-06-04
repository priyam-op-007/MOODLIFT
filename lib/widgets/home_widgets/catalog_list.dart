import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/mood.dart';
import 'package:flutter_catalog/pages/home_detail_page.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: MoodModel.moods.length,
      itemBuilder: (context, index) {
        final catalog = MoodModel.moods[index];
        return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeDetailPage(catalog: catalog,))),
          child: CatalogItem(catalog: catalog));
      },
      
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog}) : assert(catalog != null), super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
         Hero(
           tag: Key(catalog.id.toString()),
           child: CatalogImage(image: catalog.image)),
         Expanded(child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             catalog.name.text.xl.color(MyTheme.darkBluishColor).bold.make(),
           ],
         ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}