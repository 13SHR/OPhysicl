Graphics.open_graph "";;

type vector = float * float;;

let g = 0.981;;
let bounce_loss = 1.;;

let start_point = (100, 100);;
let v: vector ref = ref (2.5, 20.);;

let rec freefall unit : unit = 
    let vx, vy = !v in 
    Graphics.lineto (Graphics.current_x () + int_of_float vx) (Graphics.current_y () + int_of_float vy);
    if Graphics.current_x () >= Graphics.size_x () then (Graphics.wait_next_event [Key_pressed]; Graphics.close_graph ());
    v:= (
        if Graphics.current_y () <= 0 
            then (Graphics.moveto (Graphics.current_x ()) 1; (vx, -.vy -. bounce_loss))
            else (vx, vy -. g)
    );
    freefall ()
;;
        
let main unit : unit = 
    let x,y = start_point in Graphics.moveto x y; 
    freefall ()
;;

main ();;