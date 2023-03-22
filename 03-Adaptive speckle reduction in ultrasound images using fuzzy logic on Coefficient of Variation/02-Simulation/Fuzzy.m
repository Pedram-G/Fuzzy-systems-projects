function [ o ] = Fuzzy

    o.MF=@MF;
    o.FCA=@FCA;

end

function [ mu ] = MF( I,w,size,v,a,b,c )

    cc=0;
    mu=[];
    for ci=1:w:size
        for cj=1:w:size
            cc=cc+1;
            for i=0:w-1
                if(ci+i)<=size
                    for j=0:w-1
                        if(cj+j)<=size
                            if(~isnan(I(ci+i,cj+j)) && I(ci+i,cj+j)~=-inf && I(ci+i,cj+j)~=inf)
                                mu(ci+i,cj+j,1)=2.73^(-((I(ci+i,cj+j)-a)^2)/(2*v(cc)));
                                mu(ci+i,cj+j,2)=2.73^(-((I(ci+i,cj+j)-b)^2)/(2*v(cc)));
                                mu(ci+i,cj+j,3)=2.73^(-((I(ci+i,cj+j)-c)^2)/(2*v(cc)));
                            else
                                mu(ci+i,cj+j,1)=1;
                                mu(ci+i,cj+j,2)=0;
                                mu(ci+i,cj+j,3)=0;
                            end
                        end
                    end
                end
            end
        end
    end

end

function [ cl ] = FCA( mu,size )

    t1=(max(max(mu(:,:,1)))+min(min(mu(:,:,1))))/2;
    t2=(max(max(mu(:,:,2)))+min(min(mu(:,:,2))))/2;
    t3=(max(max(mu(:,:,3)))+min(min(mu(:,:,3))))/2;
    
    if( t1>0.1 && t2>0.1 && t3>0.1 )
        t1=0.5;
        t2=0.5;
        t3=0.5;
    end
    
    cl=[];
    mmv=[];
    mmv(1)=mean(mean(mu(:,:,1)))/size;
    mmv(2)=mean(mean(mu(:,:,2)))/size;
    mmv(3)=mean(mean(mu(:,:,3)))/size;
    for i=1:size
        for j=1:size
            if (mu(i,j,1)>=t1 && mu(i,j,2)<t2 && mu(i,j,3)<t3)
                cl(i,j)=1;
            elseif (mu(i,j,1)<t1 && mu(i,j,2)>=t2 && mu(i,j,3)<t3)
                cl(i,j)=2;
            elseif (mu(i,j,1)<t1 && mu(i,j,2)<t2 && mu(i,j,3)>=t3)
                cl(i,j)=3;
            elseif (mu(i,j,1)>=t1 && mu(i,j,2)>=t2 && mu(i,j,3)<t3)
                cl(i,j)=2;
            elseif (mu(i,j,1)<t1 && mu(i,j,2)>=t2 && mu(i,j,3)>=t3)
                cl(i,j)=3;
            else
                [fm_v,fm_p]=max(mu(i,j,:));
                if(fm_v>=mmv(fm_p))
                    cl(i,j)=fm_p;
                else
                    cl(i,j)=3;
                end
            end
        end
    end

end