% W for peterson graph. MaxCut = 12. Value found = 12.5

W = [ 0 0 1 1 0 1 0 0 0 0;
      0 0 0 1 1 0 1 0 0 0;
      1 0 0 0 1 0 0 1 0 0;
      1 1 0 0 0 0 0 0 1 0;
      0 1 1 0 0 0 0 0 0 1;
      1 0 0 0 0 0 1 0 0 1;
      0 1 0 0 0 1 0 1 0 0;
      0 0 1 0 0 0 1 0 1 0;
      0 0 0 1 0 0 0 1 0 1;
      0 0 0 0 1 1 0 0 1 0]
  
  
MaxCut(W);
      
%Square Clique . MaxCut recovered exactly
W = [0 1 1.414 1;
     1 0 1 1.414;
     1.414 1 0 1;
     1 1.414 1 0]
 
 MaxCut(W);
 
 
 % 2 Adjacent Squares. Actual MaxCut is 4. Discovered Value = 7.5
 
 W = [ 0 1 0 1 0 0;
       1 0 1 0 1 0;
       0 1 0 0 0 1;
       1 0 0 0 1 0;
       0 1 0 1 0 1;
       0 0 1 0 1 0]
   
   MaxCut(W);
 
 

      
