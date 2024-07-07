function [ y ] = benchmarks( x, number, dimension )
%UNTÝTLED2 Summary of this function goes here
%   Detailed explanation goes here

    if(number == 1)
            y1 = 0; y2 = 0;
            for i = 1 : dimension
                y1 = y1 + x(i)^2;
                y2 = y2 + cos(2 * pi * x(i));
            end
            y = 20.0 - 20.0 * exp(-0.2 * sqrt(y1 / dimension)) - exp(y2 / dimension) + exp(1);
    end
    
    if(number == 2)
            y = 0;
            for i = 1 : dimension
                y = y + abs(x(i) * sin(x(i)) + 0.1 * x(i));
            end
    end
    
    if(number == 3)
            y = 0;
            for i = 2 : dimension
                y = y + x(i)^2;
            end
            y = x(1)^2 + 10E6 * y;
    end
    
    if(number == 4)
            y = 0;
            for i = 2 : dimension
                y = y + i * (2 * x(i)^2 - x(i - 1))^2;
            end
            y = (x(1) - 1)^2 + y;
    end

    if(number == 5)
            y = 0;
            for i = 1 : dimension
                y = y + 10E6^((i - 1) / (dimension - 1)) * x(i)^2;
            end
    end
    
    if(number == 6)
            y = 0;
            for i = 1 : dimension
                y = y + x(i);
            end
            y = exp(0.5 * y);    
    end
    
    if(number == 7)
            y1 = 0; y2 = 1;
            for i = 1 : dimension
                y1 = y1 + x(i)^2;
                y2 = y2 * cos(x(i) / sqrt(i));
            end
            y = y1 / 4000.0 - y2 + 1.0;
    end
    
    if(number == 8)
            y1 = 0; y2 = 0;
            for i = 1 : dimension
                y1 = y1 + cos(5 * pi* x(i));
                y2 = y2 + x(i)^2;
            end
            y = 0.1 * dimension - (0.1 * y1 - y2);    
    end
    
    if(number == 9)
            y = 0;
            for i = 1 : dimension - 1
                y = y + (x(i)-1)^2 * (1+(sin(3*pi*x(i + 1)))^2);
            end
            y = y + (sin(3*pi*x(1)))^2 + abs(x(dimension)-1) * (1+(sin(3*pi*x(dimension)))^2); 
    end
    
    if(number == 10)
            y = 0;
            for i = 1 : dimension
                y = y + sin(x(i)) * sin((i)*x(i)^2/pi)^20;
            end
            y = dimension - y;
    end
    
    if(number == 11)
            y1 = 0; y2 = 0;
            for i = 1 : dimension - 1
                y1 = y1 + (yi(x(i))-1)^2 * (1+10*(sin(pi*yi(x(i + 1))))^2);
            end
            for i = 1 : dimension
                y2 = y2 + ui(x(i), 10.0, 100.0, 4);
            end
            y = (pi/dimension) * (10*(sin(pi*yi(x(1))))^2+y1+(yi(x(dimension))-1)^2) + y2;
    end
    
    if(number == 12)
            y1 = 0; y2 = 0;
            for i = 1 : dimension
                y1 = y1 + (x(i) - 1)^2 * (1 + sin(3 * pi * x(i) + 1)^2);
                y2 = y2 + uui(x(i), 5, 100, 4);
            end
            y = 0.1 * (sin(3*pi*x(1))^2 + y1 + (x(dimension)-1)^2 * (1+sin(2*pi*x(dimension))^2)) + y2;  
    end
    
    if(number == 13)
            y = 0;
            for i = 1 : (dimension / 4)
                y = y+((x(4*i-3)-10*x(4*i-2))^2+5*(x(4*i-1)-x(4*i))^2+(x(4*i-2)-x(4*i-1))^4+10*(x(4*i-3)-x(4*i))^2);
            end
    end
    
    if(number == 14)
            y = 0;
            for i = 1 : dimension
                y = y + x(i)^2 - 10 * cos(2 * pi * x(i));
            end
            y = 10 * dimension + y;
    end
    
    if(number == 15)
            y = 0;
            for i = 1 : dimension - 1
                y = y + (100 * (x(i + 1) - x(i)^2)^2 + (x(i) - 1)^2);
            end
    end
    
    if(number == 16)
            y = 0;
            for i = 1 : dimension
                y1 = 0;
                for j = 1 : i
                    y1 = y1 + x(j);
                end
                y = y + y1^2;
            end   
    end
    
    if(number == 17)
            y = 0;
            for i = 1 : dimension
                y = y + x(i)^2;
            end
            y = 1.0 - cos(2 * pi * sqrt(y)) + 0.1 * sqrt(y);    
    end
    
    if(number == 18)
            y = 0;
            for i = 1 : dimension
                y = y + x(i)^2;
            end
            y = 0.5 + (sin(y)^2 - 0.5) / (1 + 0.001 * y)^2;
    end
    
    if(number == 19)
            y = 0;
            for i = 1 : dimension
                y = y + x(i) * sin(sqrt(abs(x(i))));
            end
            y = 418.982887272434 * dimension - y;
    end
    
    if(number == 20)
            y = 0;
            for i = 1 : dimension
                y=y+abs(x(i));
            end
    end
    
    if(number == 21)
            if (abs(min(x)) > max(x))
                y = abs(min(x));
            else
                y = abs(max(x));
            end
    end
    
    if(number == 22)
            y1 = 0; y2 = 1;
            for i = 1 : dimension
                y1 = y1 + abs(x(i));
                y2 = y2 * abs(x(i));
            end
            y = y1 + y2;
    end
    
    if(number == 23)
            y = 0;
            for i = 1 : dimension
                y = y + x(i)^2;
            end
    end
    
    if(number == 24)            
            y = 0;
            for i = 1 : dimension
                y = y + (x(i) + 0.5)^2;
            end
    end
    
    if(number == 25)
            y = 0;
            for i = 1 : dimension
                y = y + (x(i)^4 - 16 * x(i)^2 + 5 * x(i));
            end
            y = 0.5 * y + 39.1661657037715 * dimension;
    end
    
    if(number == 26)
            y = 0;
            for i = 1 : dimension
                y = y + abs(x(i))^(i+1);
            end
    end
    
    if(number == 27)
            y = 0;
            for i = 1 : dimension
                y = y + i * x(i)^2;
            end
    end
    
    if(number == 28)
            y = 0;
            for i = 1 : dimension
                y = y + i * x(i)^4;
            end
    end
    
    if(number == 29)
            k = 20;
            if (length(x) < 20) 
                k = length(x);
            end
            y = 0;
            for i = 1 : dimension
                y1 = 0;
                for j = 0 : k
                    y1 = y1 + (0.5^j) * cos(2*pi*(3^j)*(x(i)+0.5));
                end
                y = y + y1;
            end
            y1 = 0;
            for j = 0 : k
                y1 = y1 + (0.5^j) * cos(pi * (3^j));
            end
            y = y - y1 * dimension;
    end
    
    if(number == 30)
            y1 = 0; y2 = 0;
            for i = 1 : dimension
                y1 = y1 + x(i)^2;
                y2 = y2 + 0.5 * i * x(i);
            end
            y = y1 + y2^2 + y2^4;
    end
    
end

function y = yi( value)
    y = 1.0 + (value + 1) / 4;
end

function y = ui( value, a, k, m)
    if (value > a)
        y = k * (value-a)^m;
    elseif(value < -a)
        y = k * (-value-a)^m;
    else y = 0;
    end
end

function y = uui( value, a, k, m)
    if (value > a)
        y = k * (value - a)^m;
    elseif (value < -a)
        y = k * (-value - a)^m;
    else y = 0;
    end
end

