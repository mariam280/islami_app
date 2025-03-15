import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/feature/onBoardAndHomeNav/presentation/views/on_board_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _navigateToHomeView();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.imagesSplashScreen),
              fit: BoxFit.fill,
            ),
          ),
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Align(
                    alignment: Alignment.center, 
                    child: Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: Image.asset(
                        Assets.imagesIslami,
                        width: 170, 
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _initAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),   
    )..forward();

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: 1.2)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 70),
      TweenSequenceItem(
          tween: Tween(begin: 1.2, end: 1.0)
              .chain(CurveTween(curve: Curves.bounceOut)),
          weight: 30),
    ]).animate(_animationController);
  }

  void _navigateToHomeView() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoardView()),
      );
    });
  }
}

