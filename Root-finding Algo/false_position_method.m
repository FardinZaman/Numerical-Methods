function [root1,root2,iteration] = false_position_method(the_function, first_guess, second_guess, max_error, max_iteration)
  
  previous_root = first_guess;
  next_root = second_guess;
  iteration = 0;
  temp =0;
  
  while(iteration<=max_iteration)
      
      value_of_function_1 = the_function(previous_root);
      value_of_function_2 = the_function(next_root);
      
      upcoming_root = (previous_root*value_of_function_2 - next_root*value_of_function_1)/(value_of_function_2 - value_of_function_1);
      
      if ((the_function(upcoming_root)*the_function(previous_root))<0 )
        next_root = upcoming_root;
      end
      if((the_function(upcoming_root)*the_function(previous_root))>0 )
        previous_root = upcoming_root;
      end
      
      if(temp!=0)
         difference = abs(upcoming_root - temp)*100/upcoming_root;
       end
       
       if(temp==0)
       difference = 100;
     end
     
       temp = upcoming_root;
      iteration = iteration +1;
      
      if(difference<max_error)
        break
      end
      
    end
    
    root1 = upcoming_root;
    root2 = 90-root1;