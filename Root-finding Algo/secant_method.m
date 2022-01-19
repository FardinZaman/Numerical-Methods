function [root1,root2,iteration] = secant_method(the_function , first_guess, second_guess, max_error, max_iteration)
  
  previous_root = first_guess;
  next_root = second_guess;
  iteration = 0;
  
  while(iteration <= max_iteration)
      former_root = previous_root;
      previous_root = next_root;
      
      value_of_function_1 = the_function(former_root);
      value_of_function_2 = the_function(previous_root);
      
      next_root = previous_root - ((previous_root - former_root)/(value_of_function_2 - value_of_function_1)) * value_of_function_2;
      
      difference = abs(next_root - previous_root)*100/next_root;
      iteration = iteration + 1;
      
      if(difference<max_error)
      break
      
    end
  end
  
  root1 = next_root;
  root2 = 90-root1;
      
     