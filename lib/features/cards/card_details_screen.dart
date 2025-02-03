import 'package:flutter/material.dart';

class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text("""
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus semper arcu at mauris commodo sollicitudin. In sit amet urna ultrices, dictum orci vitae, vestibulum velit. Nulla malesuada bibendum nisl ut fringilla. Nullam congue lacus ac dui condimentum tincidunt. Nam ullamcorper enim pulvinar eros convallis, at maximus dui vehicula. Pellentesque lacus dolor, convallis eget turpis vel, aliquet posuere magna. Aliquam dolor mi, convallis quis sodales sit amet, fermentum vitae dolor. Sed ac odio vitae est ultrices tempus. Aenean mi tortor, blandit a eros iaculis, lacinia bibendum elit. Fusce pellentesque justo elit, sed blandit felis interdum sit amet. Nullam non lacinia justo. Ut ut feugiat purus. Suspendisse iaculis sem ut sapien vulputate, at bibendum nunc vehicula.
        
          Sed ac urna non urna sagittis porta a in nibh. Aliquam convallis gravida aliquam. Suspendisse cursus faucibus ligula tincidunt mattis. Aliquam erat volutpat. Nulla non euismod est. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nam accumsan, augue ut tincidunt eleifend, sapien erat dapibus massa, et consectetur erat enim vitae est. Donec pharetra a risus aliquet viverra. In finibus scelerisque sapien. Phasellus dolor ipsum, sodales ut luctus ac, vestibulum in turpis. Ut consectetur tellus purus, vel lacinia tellus euismod sit amet. Praesent sit amet posuere dolor, ac fermentum est.
        
          Sed sed odio condimentum felis congue aliquam id vitae magna. Quisque dictum lobortis mollis. Morbi a ipsum dolor. Proin molestie dui eget felis tristique, vitae fringilla odio dapibus. Nullam mauris ligula, sollicitudin a urna ac, sagittis maximus nulla. Praesent nec aliquet metus. Fusce convallis vitae lectus vitae dignissim. Curabitur ullamcorper risus quis mauris venenatis scelerisque. 
          """),
        ),
      ),
    );
  }
}
