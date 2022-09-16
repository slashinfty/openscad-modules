/*
r = radius
ia = inner angle of sector
sa = starting angle
*/
module sector(r, ia, sa = 0) {
    rotate([0, 0, sa])
    difference() {
        circle(r = r, $fn = 200);
        
        if (ia <= 180) {
            translate([-r, -r, 0])
            square([2 * r, r]);
            
            polygon([
                [0, 0],
                [-r, 0],
                [-r, r],
                [r * cos(ia), r],
                [r * cos(ia), r * sin(ia)]
            ]);
        } else {
            polygon([
                [0, 0],
                [r, 0],
                [r, -r],
                [r * cos(ia), -r],
                [r * cos(ia), r * sin(ia)]
            ]);
        }
    }
}

/*
s = side length of triangle
*/
module isometricCircle(s) {
    m = (s * sqrt(3)) / 2;
    union() {
        translate([m / 3, 0])
        sector(m / 3, 120, -60);
        
        difference() {
            translate([0, -s / 2])
            sector(m, 60, 60);
            
            translate([-s / 8, -s / 2])
            square(s / 4);
        }
        
        translate([-m / 3, 0])
        sector(m / 3, 120, 120);
        
        difference() {
            translate([0, s / 2])
            sector(m, 60, 240);
            
            translate([-s / 8, s / 4])
            square(s / 4);
        }
    }
}
