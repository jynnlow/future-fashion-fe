class ARSizeMapping {
  double sizingScale;
  double positionAdjustment;

  ARSizeMapping({required this.sizingScale, required this.positionAdjustment});
}

class ProductARDetails {
  String modelURL;
  ARSizeMapping xs;
  ARSizeMapping s;
  ARSizeMapping m;
  ARSizeMapping l;
  ARSizeMapping xl;

  ProductARDetails({
    required this.modelURL,
    required this.xs,
    required this.s,
    required this.m,
    required this.l,
    required this.xl,
  });
}

class SelectedDetail {
  String modelURL;
  ARSizeMapping size;

  SelectedDetail({required this.modelURL, required this.size});
}

SelectedDetail getARDetailsByProductID(int productID, String sizing) {
  var product = productsARDetails[productID];
  ARSizeMapping size;

  switch (sizing) {
    case 'XS':
      {
        size = product!.xs;
      }
      break;

    case 'S':
      {
        size = product!.s;
      }
      break;

    case 'M':
      {
        size = product!.m;
      }
      break;

    case 'L':
      {
        size = product!.l;
      }
      break;

    case 'XL':
      {
        size = product!.xl;
      }
      break;

    default:
      {
        size = product!.m;
      }
      break;
  }

  return SelectedDetail(modelURL: product.modelURL, size: size);
}

Map<int, ProductARDetails> productsARDetails = {
  1: ProductARDetails(
    modelURL: 'models.scnassets/classic-grey-t.dae',
    xs: ARSizeMapping(sizingScale: 0.1, positionAdjustment: 0.73),
    s: ARSizeMapping(sizingScale: 0.12, positionAdjustment: 0.85),
    m: ARSizeMapping(sizingScale: 0.14, positionAdjustment: 0.95),
    l: ARSizeMapping(sizingScale: 0.16, positionAdjustment: 1.14),
    xl: ARSizeMapping(sizingScale: 0.17, positionAdjustment: 1.2),
  ),
  3: ProductARDetails(
    modelURL: 'models.scnassets/aloha-blue-shirt.dae',
    xs: ARSizeMapping(sizingScale: 0.0, positionAdjustment: 0.73),
    s: ARSizeMapping(sizingScale: 0.12, positionAdjustment: 0.85),
    m: ARSizeMapping(sizingScale: 0.14, positionAdjustment: 0.95),
    l: ARSizeMapping(sizingScale: 0.16, positionAdjustment: 1.14),
    xl: ARSizeMapping(sizingScale: 0.18, positionAdjustment: 1.2),
  )
};
