function inrange(x, min, max){
    return( x >= min && x <= max);
}

function min(x,y){
    if(x < y){
        return x;
    }
    else{
        return y;
    }
}
function max(x,y){
    if(x > y){
        return x;
    }
    else{
        return y;
    }
}

function inrect(p1, p2, x0, x1, y0, y1){
    return(inrange(p1, min(x0, x1), max(x0,x1)) && inrange(p2, min(y0, y1), max(y0,y1)));
}
