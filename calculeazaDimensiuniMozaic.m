function params = calculeazaDimensiuniMozaic(params)
%calculeaza dimensiunile mozaicului
%obtine si imaginea de referinta redimensionata avand aceleasi dimensiuni
%ca mozaicul


%calculeaza automat numarul de piese pe verticala
[hp,mp,cp] = size(imread('.\Airplane\0001.png'));
params.numarPieseMozaicVerticala = round(size( params.imgReferinta , 1) * params.numarPieseMozaicOrizontala / (size( params.imgReferinta , 2 ))* mp/hp) ;
params.imgReferintaRedimensionata = imresize(params.imgReferinta,[ params.numarPieseMozaicVerticala * hp , params.numarPieseMozaicOrizontala * mp ]); 