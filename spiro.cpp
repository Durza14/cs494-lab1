#include <iostream>
#define _USE_MATH_DEFINES
#include <cmath>
#include <string>
#include <sstream>
#include <numeric>



using namespace std;

int main(int argc, char* argv[]) {

    double red, blue, green;
    int wheel_teeth;
    double start_pos;
    double pen_radius;
    double wheel_radius;
    if (argc != 3) {
        cerr << "Usage: " << argv[0] << " <ring_teeth> <ring_radius>" << endl;
        return 1;
    }

    int ring_teeth = 0;
    double ring_radius = 0;

    stringstream(argv[1]) >> ring_teeth;
    stringstream(argv[2]) >> ring_radius;

    double plotSize = ring_radius * 1.5;
    double negPlotSize = -plotSize;

    cout << "newgraph" << endl;
    cout << "xaxis min " << negPlotSize << " max " << plotSize << " nodraw" << endl;
    cout << "yaxis min " << negPlotSize << " max " << plotSize << " nodraw" << endl;


    while (cin >> red >> green >> blue >> wheel_teeth >> start_pos >> pen_radius) {
        cerr << "Drawing parameters:" << endl;
        cerr << "  Color: (" << red << ", " << green << ", " << blue << ")" << endl;
        cerr << "  Wheel teeth: " << wheel_teeth << endl;
        cerr << "  Start position: " << start_pos << endl;
        cerr << "  Hole distance: " << pen_radius << endl;

        // gear ratio is used to find wheel radius
        wheel_radius = ring_radius * (wheel_teeth / (double)ring_teeth);

        cout << "newcurve marktype none linetype solid color ";
        cout << red << " " << green << " " << blue << " pts" << endl;

        double step = 0.01;
        int rotations_needed = lcm(ring_teeth, wheel_teeth) / wheel_teeth;
        double max_rotation_pi = 2 * M_PI * rotations_needed;
        double R = ring_radius;       
        double r = wheel_radius;      
        double p = pen_radius;


        for (double rotation = 0; rotation < max_rotation_pi; rotation += step) {
            // calculate point location at each step

            double x = (R - r) * cos(rotation + start_pos) + p * cos(((R - r) * rotation) / r + start_pos);
            double y = (R - r) * sin(rotation + start_pos) - p * sin(((R - r) * rotation) / r + start_pos);


            cout << "  " << x << " " << y << endl;
        }
    }

    return 0;
}

