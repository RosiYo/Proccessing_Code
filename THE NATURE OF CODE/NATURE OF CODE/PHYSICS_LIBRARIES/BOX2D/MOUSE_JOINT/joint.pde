class joint {

  MouseJoint mj;

  joint() {
  }

  void update(float x, float y) {
    if (mj != null) {
      Vec2 targetPos = Box2D.coordPixelsToWorld(x, y);
      mj.setTarget(targetPos);
    }
  }

  void makeJoint(float groundX, float groundY, Box box) {
    MouseJointDef mjd = new MouseJointDef();

    mjd.bodyA = Box2D.getGroundBody();
    mjd.bodyB = box.body;

    Vec2 groundPos = Box2D.coordPixelsToWorld(groundX, groundY);
    mjd.target.set(groundPos);

    mjd.maxForce = 5000;
    mjd.frequencyHz = 5;
    mjd.dampingRatio = 0.9;

    mj = (MouseJoint) Box2D.world.createJoint(mjd);
  }

  void destroy() {
    if (mj != null) {
      Box2D.world.destroyJoint(mj);
      mj = null;
    }
  }

  void display() {
    if (mj != null) {
      Vec2 v1 = new Vec2(0, 0); // the center
      mj.getAnchorA(v1); // get body 1 center
      
      Vec2 v2 = new Vec2(0, 0);
      mj.getAnchorB(v2); // get body 2 center

      // Transform to pixels
      v1 = Box2D.coordWorldToPixels(v1);
      v2 = Box2D.coordWorldToPixels(v2);

      stroke(0);
      strokeWeight(2);
      line(v1.x, v1.y, v2.x, v2.y);
    }
  }
}
