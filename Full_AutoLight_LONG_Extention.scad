//holes for the screws to go into
screwR = 1.6;
screwH = 14.3;

//switch plate dimentions are 115.9,114.3,4 ----- Adding 10mm to the y axis to match new base plate --------- 165.1 is for the full thing for x. its adding 50.8

walls_Outter = [166.7,124.3,33];
// its minus 12 so all sides can have a 6mm wall.
walls_Inner =[walls_Outter.x-12,walls_Outter.y-12,39];

// middle peice. Translate half the x to left (minus half x)
middle = [12.6,75.2,10.5];

//platform for holding pi pi
piSuspender = [30,65,5.5];

//the supports for the lid
supportR = 3;
supportH = 6;

//dimentions for the lid
lid = [103.9,102.4,4];

//dimentions for the pi zero w
pisize = [30,65,4];
//supports to hold pi mounting plate. The screw hole radius is 1.5
outter_circle_R = 4;
inner_screw_circle_R = 1.5;
inner_screw_circle_H = 13;
//hole for the micro usb cable to enter and power the pi
powerhole = [7,14,7.8];

//hole for manual button
cherry = [13.995,6,13.995];
//outer ring for the cherryMX switch
outerC = [19.995,4.5+6,19.995];

//support for the switch to indent more
Switch_Indent = [outerC.x+4,outerC.y-6+1.5,outerC.z+9];
// slants for the posts that hold the lid in. The diagnal cuts will at to clean looks and print structure.
supportC = [10,10,5];

//cut out of the bottom/back wall to beable to pop the lid off.
openR = 6.45;

//posts to hold servo in place, also where it screws into, z is = to 20.2 before change
servoholder = [12.6,8.6,Switch_Indent.z-middle.z+5];

//Servo guard box
Servo_Guard_Box = [35.4,middle.y,middle.z+servoholder.z];

// this module is the cylinders for the cutout in the lid. 37 mm till first cut in Autolight_V2 while the first iteration is 41 mm
module Open_Cut(x1,x2)
{
  hull()
  {
// Bottom Right
    translate([x1,0,37])
      rotate([90,0,0])
    cylinder(r=openR,h=10,$fn=150);
// Bottom Left
    translate([x2,0,37])
      rotate([90,0,0])
    cylinder(r=openR,h=10,$fn=150);
  }
}



union()
{

  // The baseplate that everything sits on.
  color("grey")
  translate([0,0,1])
  import("G:/3d files/Auto light switch/Final new/Add ons/BasePlateLightCover.stl");

//making the whole box fit the 4mm base plate insead of the 5mm


  //adding back in the middle
  color("Cyan")
  translate([51.65,17.4,5])
  cube([middle.x,middle.y,middle.z-5]);




//The servo guard box, it helps with cable mannagement and lid support.

translate([0,0,0])
 difference()
  {

      color("Green")
      translate([16.25,17.4,1])
      cube([Servo_Guard_Box.x,Servo_Guard_Box.y,Servo_Guard_Box.z-1]);

      color("Blue")
      translate([18.25,19.4,0])

    cube([Servo_Guard_Box.x-4,Servo_Guard_Box.y-4,Servo_Guard_Box.z+1]);

      color("Black")
      translate([40,17.4+2,middle.z])
      cube([middle.x,39.8+(servoholder.y*2)-4,5+servoholder.z]);
  }





  //adding the walls
  difference()
  {
    difference()
        {
          //subtracting 5mm to the y axis so that the wall lines up with the base plate
          translate([0,-5,5])
          cube(walls_Outter);

          translate([6,6-5,0])
          cube(walls_Inner);
        }

        //the cut out for the usb cable to power
        color("Black")
        translate([109.9+50.8,85.65-17.5/*amount of room needed.*/,23])
        cube(powerhole);

        //support for the switch to indent more into the container
        translate([47.952,109.8,12.5])
        cube(outerC);


        // Divit that the 2 cylinders make inorder to open the lid
        for (x1=23.4,x2=0)
        {
          translate([47.025,8-5,0])
          Open_Cut(x1,.2);
        }

    }

  translate([0,5,0])
  difference()
  {
    //outer cut so the switch top can fit and press down
    translate([45.952,108.3-Switch_Indent.y,5])
    cube(Switch_Indent);

    // cut out for the switch
    translate([50.952,108.3-7,15.5])
    cube(cherry);

  //support for the switch to indent more
  translate([47.952,109.8-6,12.5])
  cube(outerC);


  }






// supports for the lid of the container

  difference()
  {
    for(x=[8:99.7+50.8:107.7+50.8],y=[3:98.3+10:106.3+10])
    {
        color("Purple")
        translate([x,y,29-1])
        cylinder(r = supportR, h = supportH);
    }

  //cut out for the underside of the supports
      union()
      {
        //bottom left
          translate([8,7-5,24-1])
          rotate([32,-32,0])
          cube(supportC);
        //top left
          translate([6,98.9+5,29-1])
          rotate([-32,-32,0])
          cube(supportC);
        //top Right
          translate([102+50.8,99.5+5,33.5-1])
          rotate([-32,32,0])
          cube(supportC);
        //bottom right
          translate([99.9+50.8,6-5,28.5-1])
          rotate([32,32,0])
          cube(supportC);
      }
  }



	//support for pi mount witht the screw holes added inorder for the pi to screw into.

 difference()
  {
    translate([105.4+50.8,27.65,5])
    cylinder(r=outter_circle_R,h=inner_screw_circle_H,$fn=150);

    translate([105.4+50.8,27.65,5])
    cylinder(r=inner_screw_circle_R,h=inner_screw_circle_H,$fn=100);
  }
// top ring thing that holds the screw
difference()
{
    translate([105.4+50.8,85.65,5])
    cylinder(r=outter_circle_R,h=inner_screw_circle_H,$fn=150);

     translate([105.4+50.8,85.65,5])
    cylinder(r=inner_screw_circle_R,h=inner_screw_circle_H,$fn=100);
}





/*
//Pi mount
translate([75.9,24.65,15])
import("C:/Users/Aaron/Desktop/3d printing disigns/bottom for pi zero.stl");






// front/top lid for enclosure
color("Red")
translate([6,6,34])
cube(lid);
*/






// Needed to ad 23.7 to the y axis becuase I need to acount for the base y

//servo holder

    for( y= [65.8,17.4])
    {
        difference()
        {
          //servo holder
          color("Yellow")
          translate([51.65,y,11.5-1])
          cube(servoholder);

          //adding the screw holes z
          for(z=[16.1:10.14:26.25], y = [21.6:46.5:68.6]) // 4.10 from bottom for first screw, z
          {
            translate([50.7,y+1,z-.75])
            rotate([90,0,90])
            cylinder(r = screwR,h = screwH, $fn = 20);
          }
        }
    }
}
