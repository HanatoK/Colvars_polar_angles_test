# Polar angles
# Theta
namespace eval polarTheta { } 
proc calc_polarTheta { args } {

    global polarTheta::x
    global polarTheta::y
    global polarTheta::z

    set x [ lindex [ lindex $args 0 ] 0 ]
    set y [ lindex [ lindex $args 0 ] 1 ]
    set z [ lindex [ lindex $args 0 ] 2 ]

    set f  [expr 180 / 3.1415926 * acos($z)]

    return $f
}


proc calc_polarTheta_gradient { args } {

    global polarTheta::x
    global polarTheta::y
    global polarTheta::z

    set gx 0
    set gy 0
    set gz [expr 180 / 3.1415926 * (-1.0) / sqrt(1.0 - $z * $z)]

    set g "{ $gx $gy $gz }"

    return $g
}

# Phi
namespace eval polarPhi { } 
proc calc_polarPhi { args } {

    global polarPhi::x
    global polarPhi::y
    global polarPhi::z

    set x [ lindex [ lindex $args 0 ] 0 ]
    set y [ lindex [ lindex $args 0 ] 1 ]
    set z [ lindex [ lindex $args 0 ] 2 ]

    set f  [expr 180 / 3.1415926 * atan2($y, $x)]

    return $f
}


proc calc_polarPhi_gradient { args } {

    global polarPhi::x
    global polarPhi::y
    global polarPhi::z

    set gx [expr 180 / 3.1415926 * (-$y) / ($x * $x + $y * $y)]
    set gy [expr 180 / 3.1415926 * $x / ($x * $x + $y * $y)]
    set gz 0

    set g "{ $gx $gy $gz }"

    return $g
}
