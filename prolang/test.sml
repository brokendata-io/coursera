fun pow(x : int, y : int) =
    if y = 0 
then 1 
else x * pow(x,y-1)

val test = pow(2,2)