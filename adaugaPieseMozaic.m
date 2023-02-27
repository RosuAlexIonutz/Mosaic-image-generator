function imgMozaic = adaugaPieseMozaic(params)
%adaugaPieseMozaic

imgMozaic = uint8(zeros(size(params.imgReferintaRedimensionata)));
[H,W,C,N] = size(params.pieseMozaic);
[h,w,c] = size(params.imgReferintaRedimensionata);
fisiere = dir([params.numeDirector '/*.png'])
switch(params.criteriu)
    case 'aleator'
        %pune o piese aleatoare in mozaic, nu tine cont de nimic
        nrTotalPiese = params.numarPieseMozaicOrizontala * params.numarPieseMozaicVerticala;
        nrPieseAdaugate = 0;
        for i =1:params.numarPieseMozaicVerticala
            for j=1:params.numarPieseMozaicOrizontala
                %alege un indice aleator din cele N
                indice = randi(N);    
                imgMozaic((i-1)*H+1:i*H,(j-1)*W+1:j*W,:) = params.pieseMozaic(:,:,:,indice);
                nrPieseAdaugate = nrPieseAdaugate+1;
                fprintf('Construim mozaic ... %2.2f%% \n',100*nrPieseAdaugate/nrTotalPiese);
            end
        end
        
    case 'distantaCuloareMedie'
        nrTotalPiese = params.numarPieseMozaicOrizontala * params.numarPieseMozaicVerticala;
        nrPieseAdaugate = 0;
        medie = zeros(length(fisiere),3);
        for z = 1 : length ( fisiere )
            medie(z,:) = mean(mean(params.pieseMozaic(:,:,:,z)));
            pozegrey(z) = mean(mean(rgb2gray(params.pieseMozaic(:,:,:,z))));
        end
        for i =1:params.numarPieseMozaicVerticala
            for j=1:params.numarPieseMozaicOrizontala
                im = params.imgReferintaRedimensionata((i-1)*H+1:i*H,(j-1)*W+1:j*W,:) ;
                mediebloc(1,:) = mean(mean(im));
                min = intmax('int64');
                nz = 0;
                if size(mediebloc,2) > 1
                    for z = 1 : length (fisiere)
                         dist = sqrt(double((mediebloc(1) - medie(z,1)).^2 + (mediebloc(2) - medie(z,2)).^2 + (mediebloc(3) - medie(z,3)).^2 ));
                            if dist < min
                                min = dist ;
                                nz = z;
                            end
                    end
                    imgMozaic((i-1)*H+1:i*H,(j-1)*W+1:j*W,:) = params.pieseMozaic(:,:,:,nz); 
                else
                    for z = 1 : length (fisiere)
                        dist = sqrt(double((mediebloc(1) - pozegrey(z)).^2));
                            if dist < min
                                min = dist ;
                                nz = z;
                            end
                    end
                    imgMozaic((i-1)*H+1:i*H,(j-1)*W+1:j*W,:) = rgb2gray(params.pieseMozaic(:,:,:,nz)); 
                end
                nrPieseAdaugate = nrPieseAdaugate + 1 ;
                fprintf('Construim mozaic ... %2.2f%% \n',100*nrPieseAdaugate/nrTotalPiese);
            end
        end
        
        
    case 'distantaCulori'
        nrTotalPiese = params.numarPieseMozaicOrizontala * params.numarPieseMozaicVerticala;
        nrPieseAdaugate = 0;
        for z = 1 : length ( fisiere )
            pozargb(:,:,z) = rgb2gray(params.pieseMozaic(:,:,:,z)); 
            poza(:,:,:,z) = params.pieseMozaic(:,:,:,z);
        end
        for i =1:params.numarPieseMozaicVerticala
            for j=1:params.numarPieseMozaicOrizontala
                im = params.imgReferintaRedimensionata((i-1)*H+1:i*H,(j-1)*W+1:j*W,:) ;
                [~,~,c] = size(im(:,:,:));
                min = intmax('int64');
                nz = 0;
                if c == 3
                    for z = 1 : length (fisiere)
                        l = poza(:,:,:,z);
                         dist = sqrt(sum(((double(im(:)) - double(l(:))).^2)));
                            if dist < min
                                min = dist ;
                                nz = z;
                            end
                    end
                    imgMozaic((i-1)*H+1:i*H,(j-1)*W+1:j*W,:) = params.pieseMozaic(:,:,:,nz); 
                else
                    for z = 1 : length (fisiere)
                        l = pozargb(:,:,z);
                        dist = sqrt(sum((double(im(:)) - double(l(:))).^2));
                        if dist < min
                                min = dist ;
                                nz = z;
                        end
                    end
                    imgMozaic((i-1)*H+1:i*H,(j-1)*W+1:j*W,:) = pozargb(:,:,nz); 
                end
                nrPieseAdaugate = nrPieseAdaugate + 1 ;
                fprintf('Construim mozaic ... %2.2f%% \n',100*nrPieseAdaugate/nrTotalPiese);
            end
        end
    otherwise
        printf('EROARE, optiune necunoscut \n');
    
end
    
    
    
    
    
