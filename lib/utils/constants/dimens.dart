/// Contains all the dimensions of the app, such as:
///
/// - Padding
/// - Component sizes
/// - Spacing
/// - Margin
class Dimens {
  static const DimensPadding padding = DimensPadding();
  static const Spacing spacing = Spacing();
  static const WidgetSize widgets = WidgetSize();
  static const ComponentRadius borderRadius = ComponentRadius();
}

// class for padding
class DimensPadding {
  const DimensPadding();

  /// 8
  final double small = 8;

  /// Default spacing between components.
  /// 12
  final double normal = 12;

  /// 16
  final double medium = 16;

  /// 24
  final double large = 24;

  /// 40
  final double veryLarge = 40;

  /// 60
  final double extremePadding = 60;

  /// Default padding from the top of a parent screen.
  final double screenTopPadding = 16;

  /// Padding applied to the vertical sides of a parent screen.
  final double defaultVertical = 16;

  /// Padding applied to the horizontal sides of a parent screen.
  final double defaultHorizontal = 16;
}

class Spacing {
  const Spacing();

  /// 8
  final double small = 8;

  /// Default spacing between components.
  /// 12
  final double normal = 12;

  /// 16
  final double medium = 16;

  /// 24
  final double large = 24;

  /// 40
  final double veryLarge = 40;

  /// 60
  final double extremeSpacing = 60;
}

/// Contains the sizes of the widgets.
class WidgetSize {
  final double progressIndicator = 52;
  final double largeProgressIndicator = 200;

  /// The size of the search app bar in the home page when its expanded.
  final double homeSearchBarExpanded = 160;

  /// The size of the search app bar in the home page when its collapsed.
  final double homeSearchBarCollapsed = 72;

  /// The width of the product image in the product card.
  final double productItemImageWidth = 100;

  /// The height of the product image in the product card.
  final double productItemImageHeight = 72;

  /// The width of the image in the product description page.
  final double productDescrImageWidth = 200;

  /// The height of the image in the product description page.
  final double productDescrImageHeight = 144;

  final double cartItemImageWidth = 80;
  final double cartItemImageHeight = 80;

  const WidgetSize();
}

class ComponentRadius {
  const ComponentRadius();

  /// 8
  final double small = 8;

  /// Default radius for components.
  /// 12
  final double normal = 12;

  /// 16
  final double medium = 16;

  /// 24
  final double large = 20;

  /// 40
  final double veryLarge = 28;

  /// 60
  final double extreme = 60;
}
