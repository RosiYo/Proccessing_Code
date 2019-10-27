class Bridge {

  int bridgeLength;
  int numPoints;
  PVector dir;

  ArrayList <BridgeSegment> segment;

  Bridge(int l, int n, float h) {
    bridgeLength = l;
    numPoints = n;

    segment = new ArrayList <BridgeSegment>();

    int len = bridgeLength / numPoints;

    for (int i = 0; i < numPoints + 1; i++) {
      BridgeSegment bs = null;

      if (i == 0 || i == numPoints) bs = new BridgeSegment(i * len, h, 20, 2, true);
      else bs = new BridgeSegment(i * len, h, 20, 2, false);

      segment.add(bs);

      if (i > 0) {
        DistanceJointDef djd = new DistanceJointDef();
        BridgeSegment lastSegment = segment.get(i - 1);

        djd.bodyA = lastSegment.body;
        djd.bodyB = bs.body;

        djd.length = Box2D.scalarPixelsToWorld(len);
        djd.frequencyHz = 0;
        djd.dampingRatio = 0;

        DistanceJoint dj = (DistanceJoint) Box2D.world.createJoint(djd);
      }
    }
  }

  void display() {
    for (BridgeSegment bs : segment) {
      bs.display();
    }
  }
}
