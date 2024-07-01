module hexWall(x, y, z, s, t) {
    xCount = ceil((2 * x) / ((3 * s) + (t * sqrt(3))));
    yCount = ceil(y / (t + s * sqrt(3)));
    
    union() {
        difference() {
            cube([x, y, z]);
            
            for(ix = [0 : xCount - 1]) {
                for(iy = [0 : yCount - 1]) {
                    translate([
                        (ix / 2) * (3 * s + t * sqrt(3)) + t,
                        iy * (t + s * sqrt(3)) + ((ix % 2) / 2) * (t + s * sqrt(3)) + t,
                        -0.01
                    ])
                    cylinder(h = z + 0.02, r = s, $fn = 6);
                }
            }
        }
        
        difference() {
            cube([x, y, z]);
            
            translate([t, t, -0.01])
            cube([x - 2 * t, y - 2 * t, z + 0.02]);
        }
    }
}

// Example
// hexWall(52, 100, 5, 6, 2);