vsim comp_menorigual1bit
add wave *

force A 0 0, 1 5 -repeat 10
force B 0 0, 1 10 -repeat 20
force in_gt 0 0
force in_eq 1 0
run 40