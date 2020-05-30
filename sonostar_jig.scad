pvc_od = 48.3;
pvc_wall = 3.68;
pvc_id = pvc_od - (2 * pvc_wall);
h = 25.4;
screw_d = 5.2; //5.159375

difference() {
  union() {
    // pipe
    cylinder(h=h, r=pvc_od/2, center=true);
    
    // ears
    translate([pvc_wall/2,0,0]) {
      cube([pvc_wall, 120, h], center=true);
    }
  }
  
  // inner pipe
  cylinder(h=h+1, r=pvc_id/2, center=true);
  
  // screw jig
  rotate([0,90,0]) {
    translate([0,0,0], center=true) {
      cylinder(h=50, r=screw_d/2);
    }
  }
  
  // cut in half
  translate([-50,-100,-25], center=true) {
    cube([50, 200, 50]);
  }
  
  // ear holes
  rotate([0,90,0]) {
    translate([0,-40,0], center=true) {
      cylinder(h=50, r=screw_d/2);
    }
  }


  rotate([0,90,0]) {
    translate([0,40,0], center=true) {
      cylinder(h=50, r=screw_d/2);
    }
  }
}