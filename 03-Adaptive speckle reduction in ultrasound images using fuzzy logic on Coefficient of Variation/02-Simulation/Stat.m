function [ o ] = Stat

    o.CV=@CV;

end

function [ ov,v ] = CV (I,size,w)
    xbar=[];
    ov=[];
    v=[];
    cc=0;
    for ci=1:w:size
        for cj=1:w:size
            cc=cc+1;
            xbar(cc)=0;
            ov(cc)=0;
            cn=0;
            for i=0:w-1
                if(ci+i)<=size
                    for j=0:w-1
                        if(cj+j)<=size
                            if(~isnan(I(ci+i,cj+j)) && I(ci+i,cj+j)~=-inf && I(ci+i,cj+j)~=inf)
                                xbar(cc)=xbar(cc)+I(ci+i,cj+j);
                                cn=cn+1;
                            end
                        end
                    end
                end
            end
            if(cn>0)
                xbar(cc)=xbar(cc)/cn;
            else
                xbar(cc)=0;
            end
            for i=0:w-1
                if(ci+i)<=size
                    for j=0:w-1
                        if(cj+j)<=size
                            if(~isnan(I(ci+i,cj+j)) && I(ci+i,cj+j)~=-inf && I(ci+i,cj+j)~=inf)
                                ov(cc)=ov(cc)+((double(I(ci+i,cj+j))-xbar(cc))^2);
                            end
                        end
                    end
                end
            end
            if(cn>1)
                v(cc)=ov(cc)/(cn-1);
                ov(cc)=sqrt(ov(cc)/(cn-1))/(xbar(cc)+1);
            else
                v(cc)=1;
                ov(cc)=0;
            end
        end
    end
end

