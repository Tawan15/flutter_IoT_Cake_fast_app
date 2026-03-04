import 'package:flutter/material.dart';
import 'package:flutter_iot_cake_fast_app/models/cakeshop.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CakeShopDetailUi extends StatefulWidget {
  //สร้างตัวแปรเพื่อรับข้อมูลร้านเค้กที่ถูกส่งมาจากหน้า CakeShopListUi
  CakeShop? cakeShopDetail;

  //เอาตัวแปรที่สร้างไว้มารับข้อมูลที่ส่งมาจากหน้า CakeShopListUi
  CakeShopDetailUi({super.key, this.cakeShopDetail});

  @override
  State<CakeShopDetailUi> createState() => _CakeShopDetailUiState();
}

class _CakeShopDetailUiState extends State<CakeShopDetailUi> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUrl(launchUri);
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  MapController? _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 0, 0),
        title: Text(
          widget.cakeShopDetail!.name,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); //ย้อนกลับไปยังหน้า CakeShopListUi
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(45),
        child: Center(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/' + widget.cakeShopDetail!.image1,
                  height: 120,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Center(
                      child: Image.asset(
                        'assets/images/' + widget.cakeShopDetail!.image2,
                        height: 120,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Center(
                      child: Image.asset(
                        'assets/images/' + widget.cakeShopDetail!.image3,
                        height: 120,
                        width: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          FontAwesomeIcons.shop,
                          color: const Color.fromARGB(255, 255, 0, 0),
                        ),
                        title: Text(widget.cakeShopDetail!.name),
                      ),
                      ListTile(
                        leading: Icon(
                          FontAwesomeIcons.locationPin,
                          color: Colors.green,
                        ),
                        title: Text(widget.cakeShopDetail!.address),
                      ),
                      ListTile(
                        onTap: () {
                          _makePhoneCall(widget.cakeShopDetail!.phone);
                        },
                        leading: Icon(
                          FontAwesomeIcons.phone,
                          color: Colors.deepOrangeAccent,
                        ),
                        title: Text(widget.cakeShopDetail!.phone),
                      ),
                      ListTile(
                        onTap: () {
                          _launchInBrowser(
                            Uri.parse(widget.cakeShopDetail!.website),
                          );
                        },
                        leading: Icon(
                          FontAwesomeIcons.globe,
                          color: const Color.fromARGB(255, 225, 104, 255),
                        ),
                        title: Text(widget.cakeShopDetail!.website),
                      ),
                      ListTile(
                        onTap: () {
                          _launchInBrowser(
                            Uri.parse(widget.cakeShopDetail!.facebook),
                          );
                        },
                        leading: Icon(
                          FontAwesomeIcons.facebook,
                          color: Colors.cyan,
                        ),
                        title: Text(widget.cakeShopDetail!.facebook),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: LatLng(
                      double.parse(widget.cakeShopDetail!.latitude),
                      double.parse(widget.cakeShopDetail!.longitude),
                    ),
                    initialZoom: 15.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    RichAttributionWidget(
                      attributions: [
                        TextSourceAttribution(
                          'OpenStreetMap contributors',
                          onTap: () {
                            launchUrl(
                              Uri.parse('https://www.openstreetmap.org'),
                            );
                          },
                        ),
                      ],
                    ),
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: LatLng(
                            double.parse(widget.cakeShopDetail!.latitude),
                            double.parse(widget.cakeShopDetail!.longitude),
                          ),
                          child: InkWell(
                            onTap: () {
                              String googleMapsUrl =
                                  'https://www.google.com/maps/search/?api=1&query=${widget.cakeShopDetail!.latitude},${widget.cakeShopDetail!.longitude}';
                              _launchInBrowser(Uri.parse(googleMapsUrl));
                            },
                            child: Icon(
                              FontAwesomeIcons.locationDot,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
