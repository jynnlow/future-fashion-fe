import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:future/pages/home/home_page.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ARFittingRoom extends StatefulWidget {
  String model = "";
  double sizingScale = 0.0;
  num positionAdjustment = 0.0;

  ARFittingRoom({
    Key? key,
    required this.model,
    required this.sizingScale,
    required this.positionAdjustment,
  }) : super(key: key);
  @override
  _ARFittingRoomState createState() => _ARFittingRoomState();
}

class _ARFittingRoomState extends State<ARFittingRoom> {
  late ARKitController arkitController;
  ARKitNode? head;

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ARKitSceneView(
        configuration: ARKitConfiguration.bodyTracking,
        onARKitViewCreated: onARKitViewCreated,
        // autoenablesDefaultLighting: true
      );

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    this.arkitController.onAddNodeForAnchor = _handleAddAnchor;
    this.arkitController.onUpdateNodeForAnchor = _handleUpdateAnchor;
  }

  void _handleAddAnchor(ARKitAnchor anchor) {
    if ((anchor is! ARKitBodyAnchor)) {
      // debugPrint("body anchor not found");
      return;
    }
    final transform =
        anchor.skeleton.modelTransformsFor(ARKitSkeletonJointName.head);
    debugPrint("body anchor is found");

    head = _createSphere(transform!);
    arkitController.add(head!, parentNodeName: anchor.nodeName);
  }

  ARKitNode _createSphere(Matrix4 transform) {
    debugPrint("sphere is created");
    // return ARKitNode(geometry: ARKitSphere(radius: 0.1), position: position);
    return ARKitReferenceNode(
      url: widget.model,
      scale: vector.Vector3.all(widget.sizingScale),
      position: _createPosition(transform),
    );
  }

  void _handleUpdateAnchor(ARKitAnchor anchor) {
    if (anchor is ARKitBodyAnchor && mounted) {
      final transform =
          anchor.skeleton.modelTransformsFor(ARKitSkeletonJointName.head)!;
      head?.position = _createPosition(transform);
      // debugPrint("anchor is update");
    }
  }

  vector.Vector3 _createPosition(Matrix4 transform) {
    return vector.Vector3(
      transform.getColumn(3).x,
      transform.getColumn(3).y - widget.positionAdjustment,
      transform.getColumn(3).z,
    );
  }
}
