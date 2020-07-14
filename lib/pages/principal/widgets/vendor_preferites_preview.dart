import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../../../pages/widgets/circular_image.dart';
import '../../../pages/vendor/vendor_page.dart';
import '../../../model/Vendor.dart';

class PreferitesPreview extends StatelessWidget {
  final Vendor selectedVendor;

  const PreferitesPreview({this.selectedVendor});

  Widget _buildStatItem(String label, IconData icon) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Roboto',
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatContainer() {
    return Center(
      child: Container(
        height: 50.0,
        margin: EdgeInsets.only(top: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
          color: Colors.redAccent,
          //color: Color(0xFF353E4C) ,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildStatItem(selectedVendor.adress, Icons.place),
          ],
        ),
      ),
    );
  }

  Widget _profileServiceItem(String img, Color color) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(img)),
            border: Border.all(
              color: color,
              width: 0,
            ),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget _buildProfileServices() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        SizedBox(
          width: 5,
        ),
        _profileServiceItem('assets/service_man.jpg', Colors.black),
        SizedBox(
          width: 5,
        ),
        _profileServiceItem('assets/service_girl.png', Colors.black),
        SizedBox(
          width: 5,
        ),
        _profileServiceItem('assets/health.jpg', Colors.black),
        SizedBox(
          width: 5,
        ),
        _profileServiceItem('assets/nail.jpg', Colors.black),
      ],
    );
  }

  Widget _buildProfilePreview(Size screenSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularImage(
              NetworkImage(selectedVendor.url),
              width: screenSize.height * 0.15,
              height: screenSize.height * 0.15,
              border: true,
            ),
            SizedBox(
              height: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  selectedVendor.name,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  selectedVendor.adress,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    color: Colors.grey,
                    fontSize: 7,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                _buildProfileServices()
              ],
            ),
          ],
        ),
        Container(
          height: 30,
          width: 150,
          child: MaterialButton(
            height: 50,
            child: Text(
              'Prenota',
              style: TextStyle(color: Colors.white),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.red,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VendorPage(selectedVendor: selectedVendor),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(30),
            border: Border.all()
          ),
          child: _buildProfilePreview(screenSize),
        ),
      ),
    );
  }
}
