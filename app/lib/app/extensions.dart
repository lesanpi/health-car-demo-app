import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_car_demo_app/app/constant.dart';

extension ToBitDescription on Widget {
  Future<BitmapDescriptor> toBitmapDescriptor({
    Size? logicalSize,
    Size? imageSize,
    Duration waitToRender = const Duration(milliseconds: 300),
    TextDirection textDirection = TextDirection.ltr,
  }) async {
    final widget = RepaintBoundary(
      child: MediaQuery(
        data: const MediaQueryData(),
        child: Directionality(textDirection: TextDirection.ltr, child: this),
      ),
    );
    final pngBytes = await createImageFromWidget(
      widget,
      waitToRender: waitToRender,
      logicalSize: logicalSize,
      imageSize: imageSize,
    );
    return BitmapDescriptor.fromBytes(pngBytes);
  }
}

/// Creates an image from the given widget by first spinning up a element and render tree,
/// wait [waitToRender] to render the widget that take time like network and asset images

/// The final image will be of size [imageSize] and the the widget will be layout, ... with the given [logicalSize].
/// By default Value of  [imageSize] and [logicalSize] will be calculate from the app main window

Future<Uint8List> createImageFromWidget(
  Widget widget, {
  required Duration waitToRender,
  Size? logicalSize,
  Size? imageSize,
}) async {
  final repaintBoundary = RenderRepaintBoundary();
  final view = ui.PlatformDispatcher.instance.views.first;
  logicalSize ??= view.physicalSize / view.devicePixelRatio;
  imageSize ??= view.physicalSize;

  // assert(logicalSize.aspectRatio == imageSize.aspectRatio);

  final renderView = RenderView(
    view: view,
    child: RenderPositionedBox(
      child: repaintBoundary,
    ),
    configuration: const ViewConfiguration(
        // size: logicalSize,
        ),
  );

  final pipelineOwner = PipelineOwner();
  final buildOwner = BuildOwner(focusManager: FocusManager());

  pipelineOwner.rootNode = renderView;
  renderView.prepareInitialFrame();

  final rootElement = RenderObjectToWidgetAdapter<RenderBox>(
    container: repaintBoundary,
    child: widget,
  ).attachToRenderTree(buildOwner);

  buildOwner.buildScope(rootElement);

  await Future.delayed(waitToRender);

  buildOwner.buildScope(rootElement);
  buildOwner.finalizeTree();

  pipelineOwner.flushLayout();
  pipelineOwner.flushCompositingBits();
  pipelineOwner.flushPaint();

  final image = await repaintBoundary.toImage(
    pixelRatio: imageSize.width / logicalSize.width,
  );
  final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  return byteData!.buffer.asUint8List();
}

Future<BitmapDescriptor> getUserIcon() async {
  return CircleAvatar(
    backgroundColor: Consts.primary.withOpacity(0.4),
    radius: 30,
    child: CircleAvatar(
      radius: 20,
      backgroundColor: Consts.primary,
      child: Text(
        'You',
        style: GoogleFonts.urbanist(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    ),
  ).toBitmapDescriptor();
}

Future<BitmapDescriptor> getHomeLocation() async {
  return const Icon(
    Icons.location_on_rounded,
    color: Colors.red,
    size: 40,
  ).toBitmapDescriptor();
}
