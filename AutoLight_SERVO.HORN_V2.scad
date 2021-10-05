// My servo horn for the Hitech HS-311 standard servo.


$fn = 250;
Servo_Point_Top_Radius_SPTR = 4.5;
Servo_Point_Top_Hight_SPTH = 7; //Cut 2 out for hight of horn
//Screw hole
Screw_Hole_Radius = 1.3;
Screw_Hole_Hight = 6;
//the ring that sits on top of the servo horn that blocks the current servo horn from sitting flush
Ring_PopOut_OnTop_Servo_Horn_Diameter = 7.60;
Ring_PopOut_OnTop_Servo_Horn_Hight = .44;
//The outter screw hold to let the lip fit in
Big_Screw_Hole_Diameter = 5.5;
Big_Screw_Hole_Hight  = 2.2;

difference()
{
  hull()
  {
    //The main base/ outside of the horn
    //added 5mm to one side to even things oute
    translate([0,28.1,0])
    cylinder(r= Servo_Point_Top_Radius_SPTR, h = Servo_Point_Top_Hight_SPTH);

    translate([0,-28.1,0])
    cylinder(r= Servo_Point_Top_Radius_SPTR, h = Servo_Point_Top_Hight_SPTH);

    translate([0,0,0])
    cylinder(r= Servo_Point_Top_Radius_SPTR+1.95, h = Servo_Point_Top_Hight_SPTH);
  }
  hull(){
    //the inside/cutout for the servo
    translate([0,17-2.2,5])
    cylinder(r= Servo_Point_Top_Radius_SPTR-2, h = Servo_Point_Top_Hight_SPTH-3);

    translate([0,-17+2.2,5])
    cylinder(r= Servo_Point_Top_Radius_SPTR-2, h = Servo_Point_Top_Hight_SPTH-3);

    translate([0,0,5])
    cylinder(r= Servo_Point_Top_Radius_SPTR-.04, h = Servo_Point_Top_Hight_SPTH-3);
  }
// smaller screw hole.
  translate([0, 0, -1])
  cylinder(r=Screw_Hole_Radius, h=Screw_Hole_Hight);

//larger screw hole
  translate([0, 0, 0])
  cylinder(d=Big_Screw_Hole_Diameter, h=Big_Screw_Hole_Hight);

//Ring from the servo horn to make the add on sit flush
translate([0,0,5- Ring_PopOut_OnTop_Servo_Horn_Hight])
#cylinder(d= Ring_PopOut_OnTop_Servo_Horn_Diameter, h= Ring_PopOut_OnTop_Servo_Horn_Hight);


// NEW STUFF

// The cuts to allow the servo to hit the light while still in the box.
translate([0,0,-5])
hull()
{
  translate([10,15,0])
  #cylinder(r=5,h=15,$fn=100);

  translate([3,33,0])
  #cylinder(r=5,h=15,$fn = 100);

}


mirror([0,1,0])
translate([0,0,-5])
hull()
{
  translate([10,15,0])
  #cylinder(r=5,h=15,$fn=100);

  translate([3,33,0])
  #cylinder(r=5,h=15,$fn = 100);

}


}
