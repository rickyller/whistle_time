import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class MenuBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 75,
        decoration: BoxDecoration(
          color: Color(0xFFF5FBF6), // Color del fondo del bottom menu
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildMenuItem('assets/icons_smartphone/menu/silbato.svg'),
            _buildMenuItem('assets/icons_smartphone/menu/reporting.svg'),
            _buildMenuItem('assets/icons_smartphone/menu/home.svg'),
            _buildMenuItem('assets/icons_smartphone/menu/schedule.svg'),
            _buildMenuItem('assets/icons_smartphone/menu/settings.svg'),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String iconPath) {
    return Container(
      width: 40,
      height: 40,
      child: SvgPicture.asset(
        iconPath,
        width: 40,
        height: 40,
      ),
    );
  }
}
