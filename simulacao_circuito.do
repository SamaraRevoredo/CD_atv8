vsim main
add wave *
force num1(0) 1 0
force num1(1) 0 0
force num1(2) 0 0
force num1(3) 1 0 
force num2(0) 1 0
force num2(1) 1 0
force num2(2) 0 0
force num2(3) 0 0
force Enable 1 0
force clr 1 0
force clk 0 0, 1 2 -repeat 4
force lood 1 0, 0 5
force start 0 0, 1 7
run 80

