import 'package:flutter/material.dart';

class LiquidSwipePage extends StatefulWidget {
  @override
  _LiquidSwipePageState createState() => _LiquidSwipePageState();
}

class _LiquidSwipePageState extends State<LiquidSwipePage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildPage(Colors.blue, "Page 1"),
              _buildPage(Colors.red, "Page 2"),
              _buildPage(Colors.green, "Page 3"),
            ],
          ),
          _buildLiquidEffect(),
          Positioned.fill(
            child: GestureDetector(
              onPanUpdate: (details) {
                // Swipe hareketini yakala
                if (details.delta.dx > 0) {
                  _pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                } else if (details.delta.dx < 0) {
                  _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(Color color, String text) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontSize: 36, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildLiquidEffect() {
    // Sayfalar arasında geçiş yapılırken bir sıvı animasyonu etkisi oluşturun
    return Positioned.fill(
      child: CustomPaint(
        painter: LiquidPainter(_currentPage),
      ),
    );
  }
}

class LiquidPainter extends CustomPainter {
  final double currentPage;

  LiquidPainter(this.currentPage);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white.withOpacity(0.5);
    Path path = Path();

    // Geçiş sırasında sıvı şekil oluşturma
    double controlPointX = size.width * currentPage;
    double controlPointY = size.height / 2;

    path.moveTo(controlPointX, 0);
    path.quadraticBezierTo(
        controlPointX, controlPointY, controlPointX, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
