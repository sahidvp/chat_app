// lib/utils/screen_util.dart
import 'package:flutter/material.dart';

class ScreenUtil {
  // Private constructor to prevent instantiation
  ScreenUtil._();

  // Static instance of BuildContext
  static late BuildContext _context;

  // Initialize the context
  static void init(BuildContext context) {
    _context = context;
  }

  // Screen Size
  static Size get screenSize => MediaQuery.of(_context).size;
  static double get screenWidth => screenSize.width;
  static double get screenHeight => screenSize.height;

  // Safe Areas
  static EdgeInsets get padding => MediaQuery.of(_context).padding;
  static double get safeAreaTop => padding.top;
  static double get safeAreaBottom => padding.bottom;
  static double get safeAreaLeft => padding.left;
  static double get safeAreaRight => padding.right;

  // Device Type
  static bool get isTablet => screenWidth > 600;
  static bool get isDesktop => screenWidth > 1200;
  static bool get isMobile => !isTablet && !isDesktop;

  // Orientation
  static bool get isPortrait =>
      MediaQuery.of(_context).orientation == Orientation.portrait;
  static bool get isLandscape =>
      MediaQuery.of(_context).orientation == Orientation.landscape;

  // Text Scale
  static double get textScaleFactor => MediaQuery.of(_context).textScaleFactor;

  // Pixel Ratio
  static double get pixelRatio => MediaQuery.of(_context).devicePixelRatio;

  // Responsive Width and Height (percentage of screen)
  static double width(double percent) => screenWidth * percent;
  static double height(double percent) => screenHeight * percent;

  // Padding and Margins
  static double get defaultPadding => width(0.05); // 5% of screen width

  // Responsive Dimensions
  static double getResponsiveValue({
    required double mobile,
    
  }) {
    
    return mobile;
  }

  // Font Sizes
  static double get smallText => 12 / textScaleFactor;
  static double get mediumText => 16 / textScaleFactor;
  static double get largeText => 20 / textScaleFactor;
  static double get extraLargeText => 24 / textScaleFactor;

  // Custom Font Size
  static double fontSize(double size) => size / textScaleFactor;

  // Logo Sizes
  static double get logoSize => width(isMobile ? 0.3 : 0.15);

  // Button Sizes
  static double get buttonHeight => height(0.06);
  static double get buttonWidth => width(0.8);

  // Input Field Sizes
  static double get inputFieldHeight => height(0.07);

  // Card Sizes
  static Size get defaultCardSize => Size(width(0.9), height(0.2));

  // Custom breakpoints
  static bool isWidthLessThan(double breakpoint) => screenWidth < breakpoint;
  static bool isWidthGreaterThan(double breakpoint) => screenWidth > breakpoint;
  static bool isHeightLessThan(double breakpoint) => screenHeight < breakpoint;
  static bool isHeightGreaterThan(double breakpoint) =>
      screenHeight > breakpoint;
}
