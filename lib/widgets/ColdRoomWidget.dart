import 'package:ds_richmeat_form/model/ColdRoom.dart';
import 'package:flutter/material.dart';

class ColdRoomWidget extends StatefulWidget {
  final ColdRoom coldRoom;

  ColdRoomWidget(this.coldRoom);

  @override
  _ColdRoomWidgetState createState() => _ColdRoomWidgetState();
}

class _ColdRoomWidgetState extends State<ColdRoomWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: 130,
                child: Text(widget.coldRoom.name)),
            Checkbox(
              value: widget.coldRoom.isOn,
              onChanged: (value) {
                setState(() {
                  widget.coldRoom.isOn = !widget.coldRoom.isOn;
                });
              },
            ),
            Checkbox(
              value: widget.coldRoom.isInRange,
              onChanged: (value) {
                setState(() {
                  widget.coldRoom.isInRange = !widget.coldRoom.isInRange;
                });
              },
            ),
            Checkbox(
              value: widget.coldRoom.isReviewed,
              onChanged: (value) {
                setState(() {
                  widget.coldRoom.isReviewed = !widget.coldRoom.isReviewed;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
