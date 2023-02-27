//-------------------------------------------------------------------------------------------
// Temp Tower PLA
//---------------------------
// Nozzle 0.4
//---------------------------
// ContinusSpeed Script
//---------------------------
// StartTempTower       : 220 
// Incremental Temp     : -5
//---------------------------
// Layer = 0.16 (First layer 0.2)
// Layer Change         : 52
// Offset Layer         : 5
//---------------------------
// Based on a design proposed by stoempie https://www.thingiverse.com/thing:2493504
// Freely adapted by 5@xes  2020
//-------------------------------------------------------------------------------------------
// Modification 01/2022 increase the wall thickness to 4 Line_Width
//-------------------------------------------------------------------------------------------

$fn=50;
font = "Arial:style=Bold";

Hc=0.2; // Layer Height
Line_Width = 0.4; // line Width

Height = 200*Hc;
letter_size = 0.30*Height;
letter_height = Line_Width;

Base();


module Base() {
  translate([-60, -40, 0]) difference() {  
    minkowski() {
        union() {
            translate([0, 0, 0]) cube([10,80,Height], center = false);
            translate([0, 0, 0]) cube([110,0.1,Height], center = false);
            translate([0, 40, 0]) cube([110,0.1,Height], center = false);
            translate([0, 80, 0]) cube([110,0.1,Height], center = false);
        }
      cylinder(r=10,h=1, center = false);
    }
    translate([20, 20, 0]) cylinder(h = Height*2, r1 = 10.05, r2 = 10.05, center = false);
    translate([20, 60, 0]) cylinder(h = Height*2, r1 = 10.05, r2 = 10.05, center = false);
  }
}

module letter(Txt) {
  color("Yellow")
  linear_extrude(height = letter_height) {
    text(Txt, size = letter_size, font = font, halign = "center", valign = "center");
  }
}



