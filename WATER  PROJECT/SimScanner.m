function scandata = SimScanner(nxr, nxc, dx, sigma)

b = 6;
m1 = 1.2;
m2 = 0.8;

%d(xr, xc) = b + m1*xr + m2*xc

for i=1:nxr
    for j=1:nxc
        %Computing noise term to promote a normal distribution
        n = sigma * randn(1);
        %calculating distance from scanner
        d(i,j) = b + m1*i + m2*j;
        %travel time
        scandata(i,j) = 2000 .* (d(i,j)./i) + n;
    end
end