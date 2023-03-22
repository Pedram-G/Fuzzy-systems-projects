clc;
clear;
close all;

name='I2.PNG';
size=300;
sigma_sn=0.01;
w=6;
h_k=2;
d_k=2;
e_k=4;
C=1;

Stat_obj=Stat;
Fuzzy_obj=Fuzzy;
Filter_obj=Filter;

Io=imresize(rgb2gray(imread(name)),[size,size]);
nm=input(['add noise to image? ','y',' or ','n',' : ']);
if(nm=='y')
    Ii=imnoise(Io,'speckle',sigma_sn);
else
    Ii=Io;
end
I=log(double(Ii));

[ cv,v ]=Stat_obj.CV( I,size,w );
a=max(cv);
[ gv,~ ]=Stat_obj.CV( gradient(I),size,w );
c=max(gv);
b=(a+c)/2;
if( a<1 && b<1 && c<1 )
    mmv=max(max(I));
    nmv=min(min(I));
    a=(a*(mmv-nmv))+nmv;
    b=(b*(mmv-nmv))+nmv;
    c=(c*(mmv-nmv))+nmv;
end

mu=Fuzzy_obj.MF( I,w,size,v,a,b,c );

cl=Fuzzy_obj.FCA( mu,size );

hfi=Filter_obj.HF( I,size,h_k );
dfi=Filter_obj.DF( I,size,d_k );
efi=Filter_obj.EF( I,size,e_k,C );

fi=hfi./max(max(hfi));
dfi=dfi./max(max(dfi));
efi=efi./max(max(efi));

ofi=[];
for i=1:size
    for j=1:size
        if (cl(i,j)==1)
            ofi(i,j)=efi(i,j);
        elseif (cl(i,j)==2)
            ofi(i,j)=dfi(i,j);
        else
            ofi(i,j)=hfi(i,j);
        end
    end
end

imshow(Io);
title('input image image');
if(nm=='y')
    figure();
    I=exp(I);
    Is=I./max(max(I));
    imshow(Is);
    title('noisy image');
end
figure();
ofi=exp(ofi);
ofi=ofi./max(max(ofi));
imshow(ofi);
title('denoised image');

[ ssimval, ssimmap ]=ssim(ofi,double(Io));
disp(['SSIM value is: ',num2str(ssimval)]);



