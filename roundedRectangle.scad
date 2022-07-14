module roundedRectangle(x, y, z, r, res = 200, center = false) {
    cx = center == true ? x / 2 : 0;
    cy = center == true ? y / 2 : 0;
    points = [ [r - cx, r - cy, 0], [x - r - cx, r - cy, 0], [r - cx, y - r - cy, 0], [x - r - cx, y - r - cy, 0] ];
    hull() {
        for (p = points) {
            translate(p)
            cylinder(r = r, h = z, $fn = res);
        }
    }
}

// Example
// roundedRectangle(x = 20, y = 15, r = 3, z = 5, center = true);