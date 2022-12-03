import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ui_kits/colors.dart';

class TermAndConditionPage extends StatelessWidget {
  const TermAndConditionPage({Key? key}) : super(key: key);

  static Route route() =>
      MaterialPageRoute(builder: (_) => const TermAndConditionPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Điều khoản sử dụng',
          style: GoogleFonts.openSans(
              fontSize: 18, color: darkBlueColor, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            width: 24,
            height: 24,
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(
              'assets/images/arrow-left-icon.svg',
              width: 24,
              height: 24,
              color: orangeColor,
            ),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '''Bằng việc truy cập và sử dụng Toeic App, bạn đồng ý với các điều khoản này. Xin vui lòng đọc chúng một cách cẩn thận.''',
                style: GoogleFonts.openSans(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '\n\n● Thông tin bản quyền: ',
                style: GoogleFonts.openSans(
                    fontSize: 14,
                    color: darkBlueColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '''Toàn bộ nội dung của Toeic App đều thuộc sở hữu của Ung Nguyễn Trường Luân. Mọi hình thức sao chép hoặc sử dụng trái phép sẽ phải chịu trách nhiệm trước pháp luật.''',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                ),
              ),
              Text(
                '\n\n● Quyền và trách nhiệm của Toeic App: ',
                style: GoogleFonts.openSans(
                    fontSize: 14,
                    color: darkBlueColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '''\nToeic App tôn trọng quyền riêng tư của bạn. Chúng tôi chỉ sử dụng thông tin của bạn (chẳng hạn như email, tên và số điện thoại của bạn) để cung cấp trải nghiệm tốt nhất cho bạn trên Toeic App.
               * Số điện thoại sẽ được sử dụng để liên lạc với bạn trong trường hợp bạn cần bất kì hỗ trợ nào.
               * Số điệnt hoại cũng được sử dụng để đăng nhập ứng dụng.
               Chúng tôi tuyệt đối không chia sẻ thông tin của bạn với bất kỳ bên thứ ba nào khác không liên quan đến Toeic App.''',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                ),
              ),
              Text(
                '\n\n● Quyền và trách nhiệm của người sử dụng: ',
                style: GoogleFonts.openSans(
                    fontSize: 14,
                    color: darkBlueColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '''\nBạn không được phép sao chép hoặc chia sẻ nội dung của chúng tôi mà không có sự cho phép của chúng tôi bằng tài liệu.''',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                ),
              ),
              Text(
                '\n\n● Điều khoản chung: ',
                style: GoogleFonts.openSans(
                    fontSize: 14,
                    color: darkBlueColor,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '''\nĐiều khoản sử dụng được điều chỉnh bởi pháp luật Việt Nam.
                    Một điều khoản sử dụng bị vô hiệu theo quyết định của tòa án có thẩm quyền sẽ không ảnh hưởng đến tính hiệu lực của các điều khoản còn lại.
                    Toeic App luôn hoan nghênh những ý kiến/góp ý của bạn về nội dung Website. Nếu có một phần nào đó của Website này mà bạn cho rằng đã có dấu hiệu vi phạm bản quyền của bên thứ ba, vui lòng gửi liên hệ với Ban Truyền Thông của Toeic App.''',
                style: GoogleFonts.openSans(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
