import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:latlng/latlng.dart';
import 'package:map/map.dart';


class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}
MapController controller = MapController(
  location: LatLng(33.31565909545761, 44.36655837831766),
);

getLoc(){
  return controller.center;
}
class _MapViewState extends State<MapView> {


  Future _gotoDefault() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    controller.center.latitude = position.latitude;
    controller.center.longitude = position.longitude;
    print(position);
    setState(() {});
  }
  // Future<void> _gotoDefault() async {
  //   getLocation() ;
  //
  // }

  void _onDoubleTap() {
    controller.zoom += 0.5;
    setState(() {});
  }

  Offset? _dragStart;
  double _scaleStart = 1.0;
  void _onScaleStart(ScaleStartDetails details) {
    _dragStart = details.focalPoint;
    _scaleStart = 1.0;
    print(controller.center.longitude);
    print(controller.center.latitude);
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    final scaleDiff = details.scale - _scaleStart;
    _scaleStart = details.scale;

    if (scaleDiff > 0) {
      controller.zoom += 0.02;
      setState(() {});
    } else if (scaleDiff < 0) {
      controller.zoom -= 0.02;
      setState(() {});
    } else {
      final now = details.focalPoint;
      final diff = now - _dragStart!;
      _dragStart = now;
      controller.drag(diff.dx, diff.dy);
      setState(() {});
    }
  }

  Widget _buildMarkerWidget(Offset pos, Color color,
      [IconData icon = Icons.location_on]) {
    return Positioned(
      left: pos.dx - 24,
      top: pos.dy - 24,
      width: 48,
      height: 48,
      child: GestureDetector(
        child: Icon(
          icon,
          color: color,
          size: 48,
        ),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapLayoutBuilder(
        controller: controller,
        builder: (context, transformer) {
          final homeLocation =
          transformer.fromLatLngToXYCoords(LatLng(35.68, 51.42));

          final homeMarkerWidget =
          _buildMarkerWidget(homeLocation, Colors.black, Icons.home);

          final centerLocation = Offset(
              transformer.constraints.biggest.width / 2,
              transformer.constraints.biggest.height / 2);

          final centerMarkerWidget =
          _buildMarkerWidget(centerLocation, Colors.red);

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onDoubleTap: _onDoubleTap,
            onScaleStart: _onScaleStart,
            onScaleUpdate: _onScaleUpdate,
            child: Listener(
              behavior: HitTestBehavior.opaque,
              child: Stack(
                children: [
                  Map(
                    controller: controller,
                    builder: (context, x, y, z) {
                      //Legal notice: This url is only used for demo and educational purposes. You need a license key for production use.
                      //Google Maps
                      final url =
                          'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';
                      return CachedNetworkImage(
                        imageUrl: url,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  centerMarkerWidget,
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _gotoDefault,
        tooltip: 'موقعي الحالي',
        child: Icon(Icons.my_location),
      ),
    );
  }
}
