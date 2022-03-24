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

bool checkIfARModelExist(int productID) {
  if (productsARDetails[productID] != null) {
    return true;
  } else {
    return false;
  }
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
        size = product!.xl;
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
    m: ARSizeMapping(sizingScale: 0.14, positionAdjustment: 1.0),
    l: ARSizeMapping(sizingScale: 0.16, positionAdjustment: 1.14),
    xl: ARSizeMapping(sizingScale: 0.17, positionAdjustment: 1.2),
  ),
  2: ProductARDetails(
    modelURL: 'models.scnassets/pleated-skirt.dae',
    xs: ARSizeMapping(sizingScale: 0.1, positionAdjustment: 1.8),
    s: ARSizeMapping(sizingScale: 0.12, positionAdjustment: 2.0),
    m: ARSizeMapping(sizingScale: 0.13, positionAdjustment: 2.2),
    l: ARSizeMapping(sizingScale: 0.14, positionAdjustment: 2.3),
    xl: ARSizeMapping(sizingScale: 0.16, positionAdjustment: 2.5),
  ),
  3: ProductARDetails(
    modelURL: 'models.scnassets/men-blue-striped-shirt-white-plane.dae',
    xs: ARSizeMapping(sizingScale: 0.08, positionAdjustment: 0.40),
    s: ARSizeMapping(sizingScale: 0.09, positionAdjustment: 0.45),
    m: ARSizeMapping(sizingScale: 0.10, positionAdjustment: 0.5),
    l: ARSizeMapping(sizingScale: 0.11, positionAdjustment: 0.52),
    xl: ARSizeMapping(sizingScale: 0.13, positionAdjustment: 0.6),
  ),
  4: ProductARDetails(
    modelURL: 'models.scnassets/white-office-lady-dress.dae',
    xs: ARSizeMapping(sizingScale: 0.1, positionAdjustment: 1.70),
    s: ARSizeMapping(sizingScale: 0.11, positionAdjustment: 1.85),
    m: ARSizeMapping(sizingScale: 0.12, positionAdjustment: 2.00),
    l: ARSizeMapping(sizingScale: 0.13, positionAdjustment: 2.2),
    xl: ARSizeMapping(sizingScale: 0.14, positionAdjustment: 2.33),
  ),
  5: ProductARDetails(
    modelURL: 'models.scnassets/female-blue-singlet.dae',
    xs: ARSizeMapping(sizingScale: 0.19, positionAdjustment: 1.43),
    s: ARSizeMapping(sizingScale: 0.21, positionAdjustment: 1.56),
    m: ARSizeMapping(sizingScale: 0.23, positionAdjustment: 1.7),
    l: ARSizeMapping(sizingScale: 0.25, positionAdjustment: 1.85),
    xl: ARSizeMapping(sizingScale: 0.27, positionAdjustment: 2.00),
  ),
};
