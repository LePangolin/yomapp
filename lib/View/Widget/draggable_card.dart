import 'package:flutter/material.dart';

class DraggableCard extends StatefulWidget {
  const DraggableCard({super.key});

  @override
  State<DraggableCard> createState() => _DraggableCardState();
}

class _DraggableCardState extends State<DraggableCard> {
  @override
  Widget build(BuildContext context) {
    // return create swipeable card
    return Draggable(
      // create card
      child: Card(
        child: const Text('Card'),
      ),
      // create card when dragging
      feedback: Card(
        child: const Text('Card'),
      ),
      // create card when dragging
      childWhenDragging: Card(
        child: const Text('Card'),
      ),
    );
  }
}