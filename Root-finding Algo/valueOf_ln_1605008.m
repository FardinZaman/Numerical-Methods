function ln = valueOf_ln_1605008(x,n)
  
  length_of_x = length(x);
  for j = 1:1:length_of_x
    ln_temp = 0;
  for i = 1:1:n
    ln_temp = ln_temp + ((-1)^(i-1))*(x(j).^i)/i;
  end
    ln(j) = ln_temp;
  end
  
  
  disp(ln);