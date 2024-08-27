import 'package:flutter/material.dart';
import 'package:meald/viewmodels/user_view_model.dart';
import 'package:meald/views/pages/one_article.dart';
import 'package:meald/views/login.dart';
import 'views/pages/home_page.dart';
import 'views/pages/profile_page.dart';
import 'views/ForgetPassword.dart';
import 'views/welcome_page.dart';
import 'views/pages/all_categories.dart';
import 'views/signup.dart';
import 'package:meald/viewmodels/footer_view_model.dart'; // Assurez-vous d'importer le ViewModel
import 'package:provider/provider.dart';
import '../widgets/themes/theme_provider.dart';
import 'views/pages/one_resto.dart';
import 'views/pages/one_article.dart';
import 'views/pages/restaurants_page.dart';
import 'views/pages/historique_page.dart';
import 'views/pages/localisations.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider<FooterViewModel>(
          create: (_) => FooterViewModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'meald',
          theme: themeProvider.currentTheme,
          initialRoute: '/',
          routes: {
            '/': (context) => WelcomePage(),
            '/homePageClient': (context) => HomePageClient(userViewModel: UserViewModel()),
            '/profilePage_client': (context) => ProfilePage(),
            '/Signup': (context) => Signup(),
            '/Login': (context) => Login(),
            '/categories': (context) => AllCategories(),
            '/mot_de_passe': (context) => ForgetPassword(),
            '/profile_resto': (context) => ProfileResto(), 
            '/article': (context) => OneArticle(), 
            '/restaurants': (context) => RestaurantsPage(), 
            '/historique': (context) => HistoryPage(), 
            '/localisations': (context) => LocalisationsPage(), 
            
          },
        );
      },
    );
  }
}
