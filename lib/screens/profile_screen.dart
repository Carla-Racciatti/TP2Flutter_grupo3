import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/custom_app_bar.dart';
import 'package:flutter_app/widgets/theme_switch_widget.dart'; 
import 'package:flutter_app/widgets/form_profile.dart'; 

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Perfil de usuario',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: ThemeSwitchWidget(),  
            ),
            
            HeaderProfile(size: size),
            
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: BodyProfile(),
            ),
          ],
        ),
      ),
    );
  }
}

class BodyProfile extends StatelessWidget {
  const BodyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return FormProfile();  
  }
}

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.40,
      color: const Color(0xff2d3e4f),
      child: Center(
        child: CircleAvatar(
          radius: 100,
          child: Image.asset('assets/images/avatar.png'),
        ),
      ),
    );
  }
}
