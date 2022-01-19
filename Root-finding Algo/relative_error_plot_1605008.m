function relative_error_plot_1605008
  temp = 0;
  x = 1:1:49;
  for i = 1:1:50
    before = temp;
    temp = valueOf_ln_1605008(0.5,i);
    now = temp;
    
    if (i >= 2)
      array_of_error(i-1) = abs(now - before)*100/now;
    end
  end
  plot(x,array_of_error);
  title('Graph showing error probability');
  xlabel('values of iteration');
  ylabel('values of error');
      