function [ xy1, xy2 ] = GetRandomPoints( p1, p2 )

    %We can assume size(p1) and size(p2) yield identical sizes
    [~,sz] = size(p1);

    rando = randperm(sz);
    
    rando = rando(1:4);
    
    xy1 = [];
    xy2 = [];
    
    for i=1:4
       pt1 = [ p1( 1, rando(i) ) ;
               p1( 2, rando(i) ) ;
               p1( 3, rando(i) )];
       pt2 = [ p2( 1, rando(i) ) ;
               p2( 2, rando(i) ) ;
               p2( 3, rando(i) )];
       xy1 = [ xy1 pt1 ];
       xy2 = [ xy2 pt2 ];
    end
end