//dimentions for the pi zero w
pisize = [30,65,4];

cube1 = [5.45,50.5,1.9];

//Pi mount
difference()
{

  translate([75.9,/*24.65*/0,0])
  import("F:/3d files/Auto light switch/EmachineShop/bottom for pi zero.stl");

  translate([75.9,/*31.9*/7.25,2.1])
  cube(cube1);
}
