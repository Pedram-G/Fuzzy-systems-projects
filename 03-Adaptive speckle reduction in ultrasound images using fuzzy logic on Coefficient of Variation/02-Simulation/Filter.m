function [ o ] = Filter

    o.HF=@HF;
    o.DF=@DF;
    o.EF=@EF;

end

function [ hfi ] = HF( I,size,h_k )

    hfi=[];
    for i=1:size
        for j=1:size
            pv=0;
            for ip=-h_k:h_k
                if((i+ip)<=size && (i+ip)>=1)
                    for jp=-h_k:h_k
                        if((j+jp)<=size && (j+jp)>=1)
                            if(I(i+ip,j+jp)~=-inf && I(i+ip,j+jp)~=inf)
                                pv=pv+double(I(i+ip,j+jp));
                            end
                        end
                    end
                end
            end
            hfi(i,j)=pv/(((2*h_k)+1)^2);
        end
    end
    
end

function [ dfi ] = DF( I,size,d_k )

    dfi=[];
    for i=1:size
        for j=1:size
            pv=[];
            cc=1;
            for ip=-d_k:d_k
                if((i+ip)<=size && (i+ip)>=1)
                    for jp=-d_k:d_k
                        if((j+jp)<=size && (j+jp)>=1)
                            if(I(i+ip,j+jp)~=-inf && I(i+ip,j+jp)~=inf)
                                pv(cc)=double(I(i+ip,j+jp));
                                cc=cc+1;
                            end
                        end
                    end
                end
            end
            if(cc>1)
                pv=sort(pv);
                dfi(i,j)=pv(ceil(cc/2));
            else
                dfi(i,j)=double(I(i,j));
            end
        end
    end
    
end

function [ efi ] = EF( I,size,e_k,C )

    efi=[];
    for i=1:size
        for j=1:size
            pv=0;
            cn=1;
            for ip=-e_k:e_k
                if((i+ip)<=size && (i+ip)>=1)
                    for jp=-e_k:e_k
                        if((j+jp)<=size && (j+jp)>=1)
                            if(I(i+ip,j+jp)~=-inf && I(i+ip,j+jp)~=inf)
                                m=2.73^(-(((I(i,j)-I(i+ip,j+jp))/C)^2));
                                s=2.73^(-((ip^2+jp^2)/(((2*e_k)+1)^2)));
                                pv=pv+(double(I(i+ip,j+jp))*s*m);
                                cn=cn+(s*m);
                            end
                        end
                    end
                end
            end
            if(cn>0)
                efi(i,j)=pv/cn;
            else
                efi(i,j)=double(I(i,j));
            end
        end
    end

end