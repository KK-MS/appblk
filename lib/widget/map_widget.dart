import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//For 'OneSequenceGestureRecognizer'
import 'package:flutter/gestures.dart';
// For 'Future' key word. it is in foundation\basic_types.dart
import 'package:flutter/foundation.dart'; // OneSequenceGestureRecognizer

//void main() => runApp(MapWidget());

class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  //------------------------------
  // App specific.
  static List<List <double>> dLatLngA7 = [
    [47.64037599 , 10.51412399 ],
    [47.653723964,10.462684277 ],
    [47.665598847,10.415646128 ],
    [47.678767606,10.373603628 ],
    [47.713190072,10.361907536 ],
    [47.744554382,10.337225568 ],
    [47.778884710,10.326934345 ],
    [47.809897182,10.302636675 ],
    //[47.80989966 , 10.3026389  ],
  ] ;

  static final LatLng mapCenter =  LatLng(dLatLngA7[0][0],dLatLngA7[0][1]);

  //------------------------------
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: mapCenter, //LatLng(37.42796133580664, -122.085749655962),
    zoom: 10.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(dLatLngA7[4][0],dLatLngA7[4][1]),//LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 10.151926040649414);
  final LatLng center = LatLng(dLatLngA7[4][0],dLatLngA7[4][1]); //32.080664, 34.9563837);

  //final LatLng center = const LatLng(32.080664, 34.9563837);
  @override
  Widget build(BuildContext context) {
    print("Build map with gesture");
    return new Scaffold(
      body: Card( child: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.normal, //MapType.hybrid,
        initialCameraPosition: _kGooglePlex,

        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        //markers: Set<Marker>.of(markers.values),

        markers:
        // TODO(iskakaushik): Remove this when collection literals makes it to stable.
        // https://github.com/flutter/flutter/issues/28312
        // ignore: prefer_collection_literals
        Set<Marker>.of(
          <Marker>[
            Marker(
              markerId: MarkerId("test_marker_id"),
              position: LatLng(
                center.latitude,
                center.longitude,
              ),
              infoWindow: const InfoWindow(
                title: 'An interesting location',
                snippet: '*',
              ),
            )
          ],
        ),

        // This map does not consume the veritical drags.
        gestureRecognizers:
        // TODO(iskakaushik): Remove this when collection literals makes it to stable.
        // https://github.com/flutter/flutter/issues/28312
        // ignore: prefer_collection_literals
        <Factory<OneSequenceGestureRecognizer>>[
          Factory<OneSequenceGestureRecognizer>(
                 // Consume all gesture
                //() => EagerGestureRecognizer(),
                // does not Consume vertical gesture
                () => ScaleGestureRecognizer(),
          ),
        ].toSet(),
      ),
      ),
      //floatingActionButton: FloatingActionButton.extended(
      //  onPressed: _goToTheLake,
      //  label: Text('To the lake!'),
      //  icon: Icon(Icons.directions_boat),
      //),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  // App specific


}