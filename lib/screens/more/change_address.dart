import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jegoli/co_widget/round_textfield.dart';
import 'package:jegoli/common/color_extension.dart';

class ChangeAddress extends StatefulWidget {
  const ChangeAddress({super.key});

  @override
  State<ChangeAddress> createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> {
  GoogleMapController? controller; // Controller for Google Map
  final LatLng location = const LatLng(37.4243688467, -122.12345674667); // Define a single location
  late List<MarkerData> _customMarkers = [];// Use MarkerData instead of Marker
  static const CameraPosition _kLake = CameraPosition(
    bearing: 129.8334901395799,
    target: LatLng(37.4243688467, -122.12345674667),
    zoom: 15.0,
  );

  @override
  void initState() {
    super.initState();
    _initializeMarkers(); // Initialize markers in a separate method
  }

  void _initializeMarkers() {
    _customMarkers = [
      MarkerData(
        marker: Marker(
          markerId: const MarkerId('id-1'),
          position: location,
          infoWindow: InfoWindow(title: 'Everywhere is a widget'), // Title for the marker
        ),
        child: _customMarker('Everywhere\n is a widget', Colors.blue), // Custom marker child widget
      ),
    ];
  }

  Widget _customMarker(String symbol, Color color) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Image.asset(
            "assets/images/map_pin.png",
            width: 70,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 4), // Space between image and text
          Text(
            symbol,
            style: TextStyle(color: color), // Use the color parameter
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorExtension.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            "assets/images/btn_back.png",
            width: 20,
            height: 20,
          ),
        ),
        title: Text(
          "Change Address",
          style: TextStyle(
            color: ColorExtension.primaryText,
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: CustomGoogleMapMarkerBuilder(
        customMarkers: _customMarkers,
        builder: (BuildContext context, Set<Marker>? markers) {
          if (markers == null || markers.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kLake,
            compassEnabled: false,
            gestureRecognizers: Set()
              ..add(Factory<PanGestureRecognizer>(
                () => PanGestureRecognizer(),
              )),
            markers: markers,
            onMapCreated: (GoogleMapController mapController) {
              controller = mapController; // Correctly assign the controller
            },
          );
        }
      ),
      bottomNavigationBar: BottomAppBar(
        child:  SafeArea(
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 25),
              child: RoundTextfield(
                hintText: "Search Address",
                left: Icon(Icons.search,color: ColorExtension.primaryText,),
                
              )
              ),
                
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                 children: [
                  Image.asset("assets/images/fav_icon.png",width: 35,height: 35,),
                    Expanded(
                      child: Text(
                        "Choose a Saved Place",
                        style: TextStyle(
                          color: ColorExtension.primaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w800),
                      ),
                    ),
                        Image.asset("assets/images/btn_next.png",width: 35,height: 15,color: ColorExtension.primary,),
                 ]
              )
              ),
          ],
                ),
        )),),
    );
  }
}
