// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
// import 'package:fow/localization/app_localization.dart';
// import 'package:fow/ui_kit/colors.dart';
// import 'package:fow/ui_kit/widget/view/background_view.dart';
// import 'package:fow/ui_kit/widget/view/fow_app_bar.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class TermsPage extends StatefulWidget {
// //   final term1a =
// //       'This message contains confidential information and is intended only for the individual named. If you are not the named addressee you should not disseminate, distribute or copy this email. You cannot use or forward any attachments in the email. Please notify the sender immediately by email if you have received this email by mistake and delete this email from your system. Company X, Suite# 1, Street, City, Country, www.company.com';
// //   final term1b =
// //       'Although CoinDesk provides information about investing in digital assets, its disclaimer says users should not make investments based on this information. In a turbulent industry such as cryptocurrency, it’s important for a company to fully disclaim all responsibility for decisions its users make.';
// //   final term1c =
// //       'No matter how professional your services, you should not be responsible for how your users act upon them. Investment disclaimers are just one industry example of how you can protect your specific business interests.';
// //   final term2a = '''
// // • Copyright disclaimers help protect your original content
// // • Fair use disclaimers help you avoid copyright infringement claims
// // • Confidentiality/email disclaimers help maintain the confidentiality of private information
// // • Warranty disclaimers prevent you from being bound by faults and defects
// // • No responsibility disclaimers limit your liability for damages
// // • Views expressed disclaimers allow you to distance yourself from others’ opinions
// // • Investment disclaimers state that you take no responsibility for how others act on your advice
// // • No guarantee disclaimers explain the limits of your products or services
// //   ''';
// //   final term2b = '''
// // The benefit of all disclaimers, no matter the industry, is to safeguard your business interests. If you don’t have a disclaimer, you’re potentially leaving your business vulnerable to legal trouble.
// //
// // Use our disclaimer template to get started writing your own, or create custom disclaimers in minutes using our free disclaimer generator.
// //   ''';
// //   final term3 = '''
// // Confidentiality disclaimers are commonly used in law, education, and healthcare — industries that rely on the transfer of sensitive information. For example, they’re useful in situations where a business needs to ensure attorney–client privilege, safeguard sensitive personal data, or protect private health records.
// //
// // If you send emails containing protected health information to US medical patients, a confidentiality disclaimer is required in order to comply with the Health Insurance Portability and Accountability Act (HIPAA).
// //
// // If your business sends certain confidential information by email, add a confidentiality disclaimer to all electronic communications to comply with the law, or just to ensure your messages are only seen by the intended audience.
// //   ''';
//   final String content;
//   static Route route(String content) {
//     return MaterialPageRoute<void>(
//         builder: (_) => TermsPage(
//               content: content,
//             ));
//   }
//
//   @override
//   _TermsPageState createState() => _TermsPageState();
//
//   TermsPage({required this.content});
// }
//
// class _TermsPageState extends State<TermsPage> {
//   AppLocalizationsData get labels => context.localizations;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(alignment: Alignment.center, children: [
//       BackgroundView(),
//       Scaffold(
//         backgroundColor: Colors.transparent,
//         body: SingleChildScrollView(
//           child: Column(children: [
//             FowAppBar(
//               firstImageAsset: 'assets/images/arrow-left-icon.svg',
//               firstColor: orangeColor,
//               onFirstPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Container(
//                 margin: EdgeInsets.only(top: 24, left: 24),
//                 child: Text(
//                   labels.termsandConditionText01.toUpperCase(),
//                   style: GoogleFonts.poppins(
//                     fontSize: 20,
//                     color: Color(0xFF2C269A),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(left: 24, right: 24, top: 32),
//               child: HtmlWidget(widget.content,
//                   onLoadingBuilder: (v1, v2, v3) => Container()),
//             ),
//             // Container(
//             //   margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
//             //   child: Row(
//             //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //     children: [
//             //       Expanded(
//             //         child: makeFowBorderButton(
//             //           labels.termsandConditionText02.toUpperCase(),
//             //           onPressed: () {
//             //             Navigator.pop(context, false);
//             //           },
//             //           height: 50,
//             //         ),
//             //       ),
//             //       SizedBox(width: 8),
//             //       Expanded(
//             //         child: makeFowButton(
//             //           labels.termsandConditionText03.toUpperCase(),
//             //           onTap: () {
//             //             Navigator.pop(context, true);
//             //           },
//             //           height: 50,
//             //         ),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//             Image.asset('assets/images/character-vector2.png'),
//           ]),
//         ),
//       ),
//     ]);
//   }
// }
