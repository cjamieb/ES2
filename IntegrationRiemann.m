function result = IntegrationRiemann(f,delX)

%I inputted SampledSine (1, 1, 0.01, 0.5) in the command window for f here

length(f);
tot = 0;
for i=1:length(f)- 1 
A(i) = f(i)*delX;
tot = tot + A(i);
end

result = tot

plot(1:length(f)-1, A);
xlabel('index');
ylabel('y value');

