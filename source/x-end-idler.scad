// PRUSA Mendel  
// X-end with idler mount
// GNU GPL v3
// Josef Pra
// josefprusa@me.com
// prusadjs.cz
// http://www.reprap.org/wiki/Prusa_Mendel
// http://github.com/prusajr/PrusaMendel

include <configuration.scad>
corection = 1.17; 

/**
 * @id x-end-idler
 * @name X end idler
 * @category Printed
 * @using 1 m8spring
 * @using 3 m8nut
 * @using 3 m8washer
 * @using 3 m8washer-big
 * @using 2 m8x30
 */ 

module teardrop(h=10, r=5, center=false) {
	translate([0, 0, center ?(-h/2):0])
	linear_extrude(h=h)
	difference() {
		union() {
			circle(r, $fn=32);
			rotate(45) square([r, r]);
		}
		translate([-r, r]) square([r * 2, r * 2]);
	}
}

use <x-end.scad>
module xendidler(linear){
	xend(true,linear);
	translate(v = [0, 0, 12.5]){
		mirror(){
			difference(){
				union(){
					translate(v = [21, -21.5, 25.3]) cube(size = [25.5,7,4.4], center = true);
					translate(v = [21, 12.5, 25.3]) #cube(size = [25.5,5,4.4], center = true);
					translate(v = [32.5, -5, 7.5]) cube(size = [5,40,40], center = true);
				}
				translate(v = [32.5, -6, 28-3-4.7]) rotate(a=[0,90,0]) rotate([0, 0, 90]) teardrop(h = 90, r=m8_diameter/2, $fn=12, center=true);
			}
		}
	}
	//translate([-5,-30,0])scale([2,1,2]) rotate(a=[90,0,0]) linear_extrude(file = "this-way-up.dxf", layer = "r", height = 2, center = true, convexity = 10, twist = -fanrot);
}
xendidler(linear);
