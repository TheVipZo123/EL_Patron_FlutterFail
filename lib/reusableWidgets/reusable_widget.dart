import 'package:flutter/material.dart';
import 'package:flutter_application_el_patron/data/drawer_items.dart';
import 'package:flutter_application_el_patron/model/drawer_item.dart';
import 'package:flutter_application_el_patron/provider/navigation_provider.dart';
import 'package:flutter_application_el_patron/screens/homepage.dart';
import 'package:provider/provider.dart';

Image logoWidget(String imageName ){
return Image.asset(
  imageName,
  
  fit: BoxFit.fitWidth ,
  width: 50 ,
  height: 70,
             );
}

TextField reusable_textfield(String text, IconData icon, bool isPassswordType, 
TextEditingController controller  ) {
return TextField(
controller: controller ,
obscureText: isPassswordType,
enableSuggestions: !isPassswordType ,
autocorrect: !isPassswordType,
cursorColor: Colors.white,
style: TextStyle(color: Colors.white.withOpacity(0.9)),
decoration: InputDecoration(
  prefixIcon: Icon(
    icon,
    color: Colors.white70,
  ),

  labelText: text,
  labelStyle: TextStyle(color: Colors.white70.withOpacity(0.9)),
  filled: true,
  floatingLabelBehavior: FloatingLabelBehavior.never,
  fillColor: Colors.white.withOpacity(0.3),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
    borderSide: BorderSide(width: 0, style: BorderStyle.none)
  ),
),
keyboardType: isPassswordType
? TextInputType.visiblePassword
: TextInputType.emailAddress


);

}


Container SigninSignUpbutton(

  BuildContext context, bool isLogin, Function onTap) {
    return Container(

      width: MediaQuery.of(context).size.width,
      height: 50,
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
      child: ElevatedButton(
        onPressed:() {
          onTap();
        }, 
      
      child: Text(
        isLogin ? 'ENTRAR' : 'CADASTRE-SE',
        style: const TextStyle(
          color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states)  {
          if (states.contains(MaterialState.pressed)) {
            return Colors.black26;
          }
          return Colors.white;


        }),
      shape: MaterialStateProperty.all<RoundedRectangleBorder> (
             RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
      )) 
      ),
      );
    
  }



class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final safeArea =
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);

    final provider = Provider.of<NavigationProvider>(context);
    final isCollapsed = provider.isCollapsed;

    return Container(
      width: isCollapsed ? MediaQuery.of(context).size.width * 0.2 : null,
      child: Drawer(
        child: Container(
          color: Color(0xFF1a2f45),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 24).add(safeArea),
                width: double.infinity,
                color: Colors.white12,
                child: buildHeader(isCollapsed),
              ),
              const SizedBox(height: 24),
              buildList(items: itemsFirst, isCollapsed: isCollapsed),
              const SizedBox(height: 24),
              Divider(color: Colors.white70),
              const SizedBox(height: 24),
              buildList(
                indexOffset: itemsFirst.length,
                items: itemsSecond,
                isCollapsed: isCollapsed,
              ),
              Spacer(),
              buildCollapseIcon(context, isCollapsed),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList({
    required bool isCollapsed,
    required List<DrawerItem> items,
    int indexOffset = 0,
  }) =>
      ListView.separated(
        padding: isCollapsed ? EdgeInsets.zero : padding,
        shrinkWrap: true,
        primary: false,
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(height: 16),
        itemBuilder: (context, index) {
          final item = items[index];

          return buildMenuItem(
            isCollapsed: isCollapsed,
            text: item.title,
            icon: item.icon,
            onClicked: () => selectItem(context, indexOffset + index),
          );
        },
      );

  void selectItem(BuildContext context, int index) {
    final navigateTo = (page) => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => page,
        ));

    Navigator.of(context).pop();

    switch (index) {
      case 0:
        navigateTo(MainPage());
        break;
      case 1:
        navigateTo(MainPage());
        break;
      case 2:
        navigateTo(MainPage());
        break;
      case 3:
        navigateTo(MainPage());
        break;
      case 4:
        navigateTo(MainPage());
        break;
      
    }
  }

  Widget buildMenuItem({
    required bool isCollapsed,
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final leading = Icon(icon, color: color);

    return Material(
      color: Colors.transparent,
      child: isCollapsed
          ? ListTile(
              title: leading,
              onTap: onClicked,
            )
          : ListTile(
              leading: leading,
              title: Text(text, style: TextStyle(color: color, fontSize: 16)),
              onTap: onClicked,
            ),
    );
  }

  Widget buildCollapseIcon(BuildContext context, bool isCollapsed) {
    final double size = 52;
    final icon = isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back_ios;
    final alignment = isCollapsed ? Alignment.center : Alignment.centerRight;
    final margin = isCollapsed ? null : EdgeInsets.only(right: 16);
    final width = isCollapsed ? double.infinity : size;

    return Container(
      alignment: alignment,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            width: width,
            height: size,
            child: Icon(icon, color: Colors.white),
          ),
          onTap: () {
            final provider =
                Provider.of<NavigationProvider>(context, listen: false);

            provider.toggleIsCollapsed();
          },
        ),
      ),
    );
  }

  Widget buildHeader(bool isCollapsed) => isCollapsed
      ? logoWidget("./assets/images/Logo_Robo5.png")
      : Row(
          children: [
            const SizedBox(width: 24),
            CircleAvatar(
          radius: 25.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('./assets/images/Logo_Robo5.png'),
        ),
            const SizedBox(width: 16),
            Text(
              'EL Patron',
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
          ],
        );
}  


