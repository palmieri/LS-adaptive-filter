hw = waitbar(0, 'Cancellation of direct signal, Please wait ...');
K=1;
s=zeros(N,1);
for i=0:Nslice-1
     waitbar(i/(Nslice-1),hw)
     if i==0
       xi=x(1:Ns);
       di=sr(1:Ns);
     else 
      xi=x(i*Ns:(i+1)*Ns-1);
      di=sr(i*Ns:(i+1)*Ns-1);
     end

[rd, cd]=size(di);
D=zeros(rd,K);
     for j=1:K
        D(:,j)=circshift(di,[0 j-1]);
     end
        w=pinv(D)*xi;
     si=xi-conv(di,w,'same');
     s(i*Ns+1:i*Ns+Ns)=si;
end
close(hw)
