type vector = float * float;;
Graphics.open_graph "";;

let g = 0.981;;
let start_point = (100, 100);;
let v: vector ref = ref (10., 20.);;

let rec step unit : unit = 
    if Graphics.current_y () <= 0 
        then (Graphics.wait_next_event [Key_pressed]; Graphics.close_graph ())
        else 
            let vx, vy = !v in 
            v := (vx, vy -. g);
            Graphics.lineto (Graphics.current_x () + int_of_float vx) (Graphics.current_y () + int_of_float vy);
            step ()
;;

let main unit : unit = let x,y = start_point in Graphics.moveto x y; step ();;

main ();;