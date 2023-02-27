%proiect REALIZAREA IMAGINILOR MOZAIC

%citeste imaginea care va fi transformata in mozaic
params.imgReferinta = imread('volvov40.jpg');

%seteaza directorul cu imaginile folosite la realizarea mozaicului
params.numeDirector = [pwd '/airplane/'];
params.tipImagine = 'png';

%seteaza numarul de piese ale mozaciului pe orizontala
params.numarPieseMozaicOrizontala = 500;
%numarul de piese ale mozaciului pe verticala va fi dedus automat

%seteaza optiunea de afisare a pieselor mozaicului dupa citirea lor din
%director
params.afiseazaPieseMozaic = 1;

%seteaza criteriul dupa care realizeze mozaicul
%optiuni: 'aleator','distantaCuloareMedie','distantaCulori'
%params.criteriu = 'aleator';
params.criteriu = 'distantaCuloareMedie';
%params.criteriu = 'distantaCulori';

%%
%apeleaza functia principala
imgMozaic = construiesteMozaic(params);
imwrite(imgMozaic,'mozaic.jpg');
figure, imshow(imgMozaic)