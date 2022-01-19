function y_got = lag_pol(x,y,point)
  
  %plot(x,y,'o');
  %hold on
  
  n = length(x);
  L = ones(n,length(point));
  
  %for f = 1:n-1
    %temp_x = [x(f) x(f+1)];
    %temp_y = [y(f) y(f+1)];
    %plot(temp_x,temp_y);
    %hold on
  %end
  
  
  for i = 1:n
    for j = 1:n
      if i~=j
        L(i,:) = L(i,:).*((point - x(j))/(x(i) - x(j)));
      end
    end
  end
  
  y_got = 0;
  for k = 1:n
    y_got = y_got + y(k)*L(k,:);
  end
  
  
  %plot(point,y_got);