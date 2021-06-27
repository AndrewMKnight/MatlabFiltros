clc %Limpia la pantalla
clear all %limpia todas las variables
close all %cierra todo
warning off all %evita llamadas de atención

%variables

figure(1)
imagen = imread('truedamage.jpg');
imgg=rgb2gray(imagen);
imshow(imgg);
title('IMAGEN ORIGINAL');
[fila,columna]=size(imgg);

prompt = 'valor de ruido salt & pepper: ';
     snp = input(prompt);
     
prompt = 'valor de ruido Gaussiano 1: ';
     vgaus1 = input(prompt);
     
prompt = 'valor de ruido Gaussiano 2: ';
     vgaus2 = input(prompt);

a=imnoise(imgg,'salt & pepper',snp);
gus = imnoise(imgg,'gaussian',vgaus1,vgaus2);

figure(2)
title('Ruido Sal y Pimienta');
imshow(a)

figure(3)
title('Ruido gaussiano');
imshow(gus)
no=1;
while no == 1
 prompt = '1)Filtro de la media \n2)Filtrado de la moda \n3)Filtrado MAX \n4)Filtrado MIN \n5)Media aritmetica\n6)Media Geometrica\n7)Media armonica\n8)Media contra-armonica \n  Escoge un tipo de filtro: ';
     n = input(prompt);

 
switch n
    case 1
        at=zeros(fila,columna);
 for i = 1:+1:fila
            for j = 1:+1:columna
               if(i-1<1 && j-1<1)
                   mediav=[0 0 0 0 0 a(i,j) a(i,j+1) a(i+1,j) a(i+1,j+1)];
                   media = sort(mediav); 
                   at(i,j)= media(1,5);
                elseif(i-1<1 && j+1>columna)
                   mediav=[0 0 0 a(i,j-1) a(i,j) 0 a(i+1,j-1) a(i+1,j) 0];
                   media = sort(mediav); 
                   at(i,j)= media(1,5);
                 elseif(i+1>fila && j+1>columna )
                    mediav=[a(i-1,j-1) a(i-1,j) 0 a(i,j-1) a(i,j) 0 0 0 0];
                   media = sort(mediav); 
                   at(i,j)= media(1,5);
                 elseif(j+1>columna)
                   mediav=[a(i-1,j-1) a(i-1,j) 0 a(i,j-1) a(i,j) 0 a(i+1,j-1) a(i+1,j) 0];
                   media = sort(mediav); 
                   at(i,j)= media(1,5);
                elseif(i-1<1)
                     mediav=[0 0 0 a(i,j-1) a(i,j) a(i,j+1) a(i+1,j-1) a(i+1,j) a(i+1,j+1)];
                   media = sort(mediav); 
                   at(i,j)= media(1,5);
                elseif(j-1<1 && i+1>fila)
                    mediav=[0 a(i-1,j) a(i-1,j+1) 0 a(i,j) a(i,j+1) 0 0 0];
                   media = sort(mediav); 
                   at(i,j)= media(1,5);
                 elseif(i+1>fila)
                   mediav=[a(i-1,j-1) a(i-1,j) a(i-1,j+1) a(i,j-1) a(i,j) a(i,j+1) 0 0 0];
                   media = sort(mediav); 
                   at(i,j)= media(1,5);
                  elseif(j-1<1)
                    mediav=[0 a(i-1,j) a(i-1,j+1) 0 a(i,j) a(i,j+1) 0 a(i+1,j) a(i+1,j+1)];
                   media = sort(mediav); 
                   at(i,j)= media(1,5);
                  else
                     mediav=[a(i-1,j-1) a(i-1,j) a(i-1,j+1) a(i,j-1) a(i,j) a(i,j+1) a(i+1,j-1) a(i+1,j) a(i+1,j+1)];
                   media = sort(mediav); 
                   at(i,j)= media(1,5);
               end
                
    
                  
            end
 end
 figure(4);  
 imagenew=imgg;
 for i = 1:+1:fila
            for j = 1:+1:columna
                 imagenew(i,j)=at(i,j);
                 end
 end
 imshow(imagenew);

        
    case 2
        
          ato=zeros(fila,columna);
 for i = 1:+1:fila
            for j = 1:+1:columna
               if(i-1<1 && j-1<1)
                   modav=[0 0 0 0 0 a(i,j) a(i,j+1) a(i+1,j) a(i+1,j+1)];
                   moda = modac(modav); 
                   ato(i,j)= moda;
                elseif(i-1<1 && j+1>columna)
                   modav=[0 0 0 a(i,j-1) a(i,j) 0 a(i+1,j-1) a(i+1,j) 0];
                   moda = modac(modav); 
                   ato(i,j)= moda;
                 elseif(i+1>fila && j+1>columna )
                    modav=[a(i-1,j-1) a(i-1,j) 0 a(i,j-1) a(i,j) 0 0 0 0];
                   moda = modac(modav); 
                   ato(i,j)= moda;
                 elseif(j+1>columna)
                   modav=[a(i-1,j-1) a(i-1,j) 0 a(i,j-1) a(i,j) 0 a(i+1,j-1) a(i+1,j) 0];
                   moda = modac(modav); 
                   ato(i,j)= moda;
                elseif(i-1<1)
                     modav=[0 0 0 a(i,j-1) a(i,j) a(i,j+1) a(i+1,j-1) a(i+1,j) a(i+1,j+1)];
                   moda = modac(modav); 
                   ato(i,j)= moda;
                elseif(j-1<1 && i+1>fila)
                    modav=[0 a(i-1,j) a(i-1,j+1) 0 a(i,j) a(i,j+1) 0 0 0];
                   moda = modac(modav); 
                   ato(i,j)= moda;
                 elseif(i+1>fila)
                   modav=[a(i-1,j-1) a(i-1,j) a(i-1,j+1) a(i,j-1) a(i,j) a(i,j+1) 0 0 0];
                   moda = mode(modav); 
                   ato(i,j)= moda;
                  elseif(j-1<1)
                    modav=[0 a(i-1,j) a(i-1,j+1) 0 a(i,j) a(i,j+1) 0 a(i+1,j) a(i+1,j+1)];
                   moda = modac(modav); 
                   ato(i,j)= moda;
                  else
                     modav=[a(i-1,j-1) a(i-1,j) a(i-1,j+1) a(i,j-1) a(i,j) a(i,j+1) a(i+1,j-1) a(i+1,j) a(i+1,j+1)];
                   moda = modac(modav); 
                   ato(i,j)= moda;
               end
            end
 end
 figure(4);  
 imagenew=imgg;
 for i = 1:+1:fila
            for j = 1:+1:columna
                 imagenew(i,j)=ato(i,j);
            end
 end
 imshow(imagenew);

        
    case 3
              at=zeros(fila,columna);
 for i = 1:+1:fila
            for j = 1:+1:columna
               if(i-1<1 && j-1<1)
                   mediav=[0 0 0 0 0 a(i,j) a(i,j+1) a(i+1,j) a(i+1,j+1)];
                   media = sort(mediav); 
                   at(i,j)= media(1,9);
                elseif(i-1<1 && j+1>columna)
                   mediav=[0 0 0 a(i,j-1) a(i,j) 0 a(i+1,j-1) a(i+1,j) 0];
                   media = sort(mediav); 
                   at(i,j)= media(1,9);
                 elseif(i+1>fila && j+1>columna )
                    mediav=[a(i-1,j-1) a(i-1,j) 0 a(i,j-1) a(i,j) 0 0 0 0];
                   media = sort(mediav); 
                   at(i,j)= media(1,9);
                 elseif(j+1>columna)
                   mediav=[a(i-1,j-1) a(i-1,j) 0 a(i,j-1) a(i,j) 0 a(i+1,j-1) a(i+1,j) 0];
                   media = sort(mediav); 
                   at(i,j)= media(1,9);
                elseif(i-1<1)
                     mediav=[0 0 0 a(i,j-1) a(i,j) a(i,j+1) a(i+1,j-1) a(i+1,j) a(i+1,j+1)];
                   media = sort(mediav); 
                   at(i,j)= media(1,9);
                elseif(j-1<1 && i+1>fila)
                    mediav=[0 a(i-1,j) a(i-1,j+1) 0 a(i,j) a(i,j+1) 0 0 0];
                   media = sort(mediav); 
                   at(i,j)= media(1,9);
                 elseif(i+1>fila)
                   mediav=[a(i-1,j-1) a(i-1,j) a(i-1,j+1) a(i,j-1) a(i,j) a(i,j+1) 0 0 0];
                   media = sort(mediav); 
                   at(i,j)= media(1,9);
                  elseif(j-1<1)
                    mediav=[0 a(i-1,j) a(i-1,j+1) 0 a(i,j) a(i,j+1) 0 a(i+1,j) a(i+1,j+1)];
                   media = sort(mediav); 
                   at(i,j)= media(1,9);
                  else
                     mediav=[a(i-1,j-1) a(i-1,j) a(i-1,j+1) a(i,j-1) a(i,j) a(i,j+1) a(i+1,j-1) a(i+1,j) a(i+1,j+1)];
                   media = sort(mediav); 
                   at(i,j)= media(1,9);
               end
                 
            end
 end
 figure(4);  
 imagenew=imgg;
 for i = 1:+1:fila
            for j = 1:+1:columna
                 imagenew(i,j)=at(i,j);
                 end
 end
 imshow(imagenew);
        
        
    case 4
        at=zeros(fila,columna);
 for i = 1:+1:fila
            for j = 1:+1:columna
               if(i-1<1 && j-1<1)
                   mediav=[0 0 0 0 0 a(i,j) a(i,j+1) a(i+1,j) a(i+1,j+1)];
                   media = sort(mediav); 
                   at(i,j)= media(1,1);
                elseif(i-1<1 && j+1>columna)
                   mediav=[0 0 0 a(i,j-1) a(i,j) 0 a(i+1,j-1) a(i+1,j) 0];
                   media = sort(mediav); 
                   at(i,j)= media(1,1);
                 elseif(i+1>fila && j+1>columna )
                    mediav=[a(i-1,j-1) a(i-1,j) 0 a(i,j-1) a(i,j) 0 0 0 0];
                   media = sort(mediav); 
                   at(i,j)= media(1,1);
                 elseif(j+1>columna)
                   mediav=[a(i-1,j-1) a(i-1,j) 0 a(i,j-1) a(i,j) 0 a(i+1,j-1) a(i+1,j) 0];
                   media = sort(mediav); 
                   at(i,j)= media(1,1);
                elseif(i-1<1)
                     mediav=[0 0 0 a(i,j-1) a(i,j) a(i,j+1) a(i+1,j-1) a(i+1,j) a(i+1,j+1)];
                   media = sort(mediav); 
                   at(i,j)= media(1,1);
                elseif(j-1<1 && i+1>fila)
                    mediav=[0 a(i-1,j) a(i-1,j+1) 0 a(i,j) a(i,j+1) 0 0 0];
                   media = sort(mediav); 
                   at(i,j)= media(1,1);
                 elseif(i+1>fila)
                   mediav=[a(i-1,j-1) a(i-1,j) a(i-1,j+1) a(i,j-1) a(i,j) a(i,j+1) 0 0 0];
                   media = sort(mediav); 
                   at(i,j)= media(1,1);
                  elseif(j-1<1)
                    mediav=[0 a(i-1,j) a(i-1,j+1) 0 a(i,j) a(i,j+1) 0 a(i+1,j) a(i+1,j+1)];
                   media = sort(mediav); 
                   at(i,j)= media(1,1);
                  else
                     mediav=[a(i-1,j-1) a(i-1,j) a(i-1,j+1) a(i,j-1) a(i,j) a(i,j+1) a(i+1,j-1) a(i+1,j) a(i+1,j+1)];
                   media = sort(mediav); 
                   at(i,j)= media(1,1);
               end
            end
 end
 figure(4);  
 imagenew=imgg;
 for i = 1:+1:fila
            for j = 1:+1:columna
                 imagenew(i,j)=at(i,j);
                 end
 end
 imshow(imagenew);
        
  case 5
      
       at=zeros(fila,columna);
 for i = 1:+1:fila
            for j = 1:+1:columna
               if(i-1<1 && j-1<1)
                   mediav=[0 0 0 0 0 gus(i,j) gus(i,j+1) gus(i+1,j) gus(i+1,j+1)];
                   media = sort(mediav); 
                   suma = sum(mediav);
                   tama = size(media);
                   sumaa = suma/9; 
                   at(i,j)= sumaa;
                elseif(i-1<1 && j+1>columna)
                   mediav=[0 0 0 gus(i,j-1) gus(i,j) 0 gus(i+1,j-1) gus(i+1,j) 0];
                   media = sort(mediav); 
                   suma = sum(mediav);
                   tama = size(media);
                   sumaa = suma/9; 
                   at(i,j)= sumaa;
                 elseif(i+1>fila && j+1>columna )
                   mediav=[gus(i-1,j-1) gus(i-1,j) 0 gus(i,j-1) gus(i,j) 0 0 0 0];
                   media = sort(mediav); 
                   suma = sum(mediav);
                   tama = size(media);
                   sumaa = suma/9; 
                   at(i,j)= sumaa;
                 elseif(j+1>columna)
                   mediav=[gus(i-1,j-1) gus(i-1,j) 0 gus(i,j-1) gus(i,j) 0 gus(i+1,j-1) gus(i+1,j) 0];
                   media = sort(mediav); 
                   suma = sum(mediav);
                   tama = size(media);
                   sumaa = suma/9; 
                   at(i,j)= sumaa;
                elseif(i-1<1)
                     mediav=[0 0 0 gus(i,j-1) gus(i,j) gus(i,j+1) gus(i+1,j-1) gus(i+1,j) gus(i+1,j+1)];
                   media = sort(mediav); 
                   suma = sum(mediav);
                   tama = size(media);
                   sumaa = suma/9; 
                   at(i,j)= sumaa;
                elseif(j-1<1 && i+1>fila)
                    mediav=[0 gus(i-1,j) gus(i-1,j+1) 0 gus(i,j) gus(i,j+1) 0 0 0];
                   media = sort(mediav); 
                   suma = sum(mediav);
                   tama = size(media);
                   sumaa = suma/9; 
                   at(i,j)= sumaa;
                 elseif(i+1>fila)
                   mediav=[gus(i-1,j-1) gus(i-1,j) gus(i-1,j+1) gus(i,j-1) gus(i,j) gus(i,j+1) 0 0 0];
                   media = sort(mediav); 
                   suma = sum(mediav);
                   sumaa = suma/9; 
                   at(i,j)= sumaa;
                  elseif(j-1<1)
                    mediav=[0 gus(i-1,j) gus(i-1,j+1) 0 gus(i,j) gus(i,j+1) 0 gus(i+1,j) gus(i+1,j+1)];
                   media = sort(mediav); 
                   suma = sum(mediav);
                   sumaa = suma/9; 
                   at(i,j)= sumaa;
                  else
                     mediav=[gus(i-1,j-1) gus(i-1,j) gus(i-1,j+1) gus(i,j-1) gus(i,j) gus(i,j+1) gus(i+1,j-1) gus(i+1,j) gus(i+1,j+1)];
                   media = sort(mediav); 
                   suma = sum(mediav);
                   sumaa = suma/9; 
                   at(i,j)= sumaa;
               end
                
    
                  
            end
 end
 figure(4);  
 imagenew=imgg;
 for i = 1:+1:fila
            for j = 1:+1:columna
                 imagenew(i,j)=at(i,j);
                 end
 end
 imshow(imagenew);

      
      
  case 6
      
        
       at=zeros(fila,columna);
 for i = 1:+1:fila
            for j = 1:+1:columna
               if(i-1<1 && j-1<1)
                   mediav=[0 0 0 0 0 gus(i,j) gus(i,j+1) gus(i+1,j) gus(i+1,j+1)];
                   val =(gus(i,j)*gus(i,j+1)*gus(i+1,j)*gus(i+1,j+1))^1/9;
                   at(i,j)= val;
                elseif(i-1<1 && j+1>columna)
                   mediav=[0 0 0 gus(i,j-1) gus(i,j) 0 gus(i+1,j-1) gus(i+1,j) 0];
                  val = (gus(i,j-1)*gus(i,j)*gus(i+1,j-1)*gus(i+1,j)) ^ 1/9;
                   at(i,j)= val;
                 elseif(i+1>fila && j+1>columna )
                   mediav=[gus(i-1,j-1) gus(i-1,j) 0 gus(i,j-1) gus(i,j) 0 0 0 0];
                   val = (gus(i-1,j-1)*gus(i-1,j)*gus(i,j-1)*gus(i,j)) ^ 1/9;
                   at(i,j)= val;
                 elseif(j+1>columna)
                   mediav=[gus(i-1,j-1) gus(i-1,j) 0 gus(i,j-1) gus(i,j) 0 gus(i+1,j-1) gus(i+1,j) 0];
                   val = (gus(i-1,j-1)*gus(i-1,j)*gus(i,j-1)*gus(i,j)*gus(i+1,j-1)*gus(i+1,j)) ^ 1/9;
                   at(i,j)= val;
                elseif(i-1<1)
                   mediav=[0 0 0 gus(i,j-1) gus(i,j) gus(i,j+1) gus(i+1,j-1) gus(i+1,j) gus(i+1,j+1)];
                   val = (gus(i,j-1)*gus(i,j)*gus(i,j+1)*gus(i+1,j-1)*gus(i+1,j)*gus(i+1,j+1)) ^ 1/9;
                   at(i,j)= val;
                elseif(j-1<1 && i+1>fila)
                   mediav=[0 gus(i-1,j) gus(i-1,j+1) 0 gus(i,j) gus(i,j+1) 0 0 0];
                   val = (gus(i-1,j)*gus(i-1,j+1)*gus(i,j)*gus(i,j+1)) ^ 1/9;
                   at(i,j)= val;
                 elseif(i+1>fila)
                   mediav=[gus(i-1,j-1) gus(i-1,j) gus(i-1,j+1) gus(i,j-1) gus(i,j) gus(i,j+1) 0 0 0];
                   val = (gus(i-1,j-1)*gus(i-1,j)*gus(i-1,j+1)*gus(i,j-1)*gus(i,j)*gus(i,j+1)) ^ 1/9;
                   at(i,j)= val;
                  elseif(j-1<1)
                   mediav=[0 gus(i-1,j) gus(i-1,j+1) 0 gus(i,j) gus(i,j+1) 0 gus(i+1,j) gus(i+1,j+1)];
                   val = (gus(i-1,j)*gus(i-1,j+1)*gus(i,j)*gus(i,j+1)*gus(i+1,j)*gus(i+1,j+1)) ^1/9;
                   at(i,j)= val;
               else
                   mediav=[gus(i-1,j-1) gus(i-1,j) gus(i-1,j+1) gus(i,j-1) gus(i,j) gus(i,j+1) gus(i+1,j-1) gus(i+1,j) gus(i+1,j+1)];
                   val = (gus(i-1,j-1)*gus(i-1,j)*gus(i-1,j+1)*gus(i,j-1)*gus(i,j)*gus(i,j+1)*gus(i+1,j-1)*gus(i+1,j)*gus(i+1,j+1)) ^1/9;
                   at(i,j)= val;
               end
                
    
                  
            end
 end
      
      figure(4);  
 imagenew=imgg;
 for i = 1:+1:fila
            for j = 1:+1:columna
                 imagenew(i,j)=at(i,j);
             end
 end
 imshow(imagenew);
 
   case 7
       
        at=zeros(fila,columna);
 for i = 1:+1:fila
            for j = 1:+1:columna
                
               if(i-1<1 && j-1<1)
                   mediav=[0 0 0 0 0 gus(i,j) gus(i,j+1) gus(i+1,j) gus(i+1,j+1)];
                   ggg = (1/gus(i,j)) + (1/gus(i,j+1)) + (1/gus(i+1,j)) + (1/gus(i+1,j+1));
                   at(i,j)= 9/ggg;
                   
                elseif(i-1<1 && j+1>columna)
                   mediav=[0 0 0 gus(i,j-1) gus(i,j) 0 gus(i+1,j-1) gus(i+1,j) 0];
                   ggg = (1/gus(i,j-1)) + (1/gus(i,j)) + (1/gus(i+1,j-1)) + (1/gus(i+1,j));
                   at(i,j)= 9/ggg;
                   
                 elseif(i+1>fila && j+1>columna )
                   mediav=[gus(i-1,j-1) gus(i-1,j) 0 gus(i,j-1) gus(i,j) 0 0 0 0];
                   ggg = (1/gus(i-1,j-1)) + (1/gus(i-1,j)) + (1/gus(i,j-1)) + (1/gus(i,j));
                   at(i,j)= 9/ggg;
                      
                 elseif(j+1>columna)
                   mediav=[gus(i-1,j-1) gus(i-1,j) 0 gus(i,j-1) gus(i,j) 0 gus(i+1,j-1) gus(i+1,j) 0];
                   ggg = (1/gus(i-1,j-1)) + (1/gus(i-1,j)) + (1/gus(i,j-1)) + (1/gus(i,j)) + (1/gus(i+1,j-1)) + (1/gus(i+1,j));
                   at(i,j)= 9/ggg;
                   
                elseif(i-1<1)
                     mediav=[0 0 0 gus(i,j-1) gus(i,j) gus(i,j+1) gus(i+1,j-1) gus(i+1,j) gus(i+1,j+1)];
                     ggg=(1/gus(i,j-1)) + (1/gus(i,j)) + (1/gus(i,j+1)) + (1/gus(i+1,j-1)) + (1/gus(i+1,j)) + (1/gus(i+1,j+1));
                     at(i,j)= 9/ggg;
                   
                elseif(j-1<1 && i+1>fila)
                    mediav=[0 gus(i-1,j) gus(i-1,j+1) 0 gus(i,j) gus(i,j+1) 0 0 0];
                    ggg=(1/gus(i-1,j)) + (1/gus(i-1,j+1)) + (1/gus(i,j)) + (1/gus(i,j+1));
                    at(i,j)= 9/ggg;
                   
                 elseif(i+1>fila)
                   mediav=[gus(i-1,j-1) gus(i-1,j) gus(i-1,j+1) gus(i,j-1) gus(i,j) gus(i,j+1) 0 0 0];
                   ggg=(1/gus(i-1,j-1)) + (1/gus(i-1,j)) + (1/gus(i-1,j+1)) + (1/gus(i,j-1)) + (1/gus(i,j)) + (1/gus(i,j+1));
                   at(i,j)= 9/ggg;
                   
                  elseif(j-1<1)
                    mediav=[0 gus(i-1,j) gus(i-1,j+1) 0 gus(i,j) gus(i,j+1) 0 gus(i+1,j) gus(i+1,j+1)];
                     ggg=(1/gus(i-1,j)) + (1/gus(i-1,j+1)) + (1/gus(i,j)) + (1/gus(i,j+1)) + (1/gus(i+1,j)) + (1/gus(i+1,j+1));
                     at(i,j)= 9/ggg;
                   
                  else
                     mediav=[gus(i-1,j-1) gus(i-1,j) gus(i-1,j+1) gus(i,j-1) gus(i,j) gus(i,j+1) gus(i+1,j-1) gus(i+1,j) gus(i+1,j+1)];
                      ggg= (1/gus(i-1,j-1)) + (1/gus(i-1,j)) + (1/gus(i-1,j+1)) + (1/gus(i,j-1)) + (1/gus(i,j)) + (1/gus(i,j+1)) + (1/gus(i+1,j-1)) + (1/gus(i+1,j)) + (1/gus(i+1,j+1));
                     at(i,j)= 9/ggg;
               end
                
    
                  
            end
 end
 figure(4);  
 imagenew=imgg;
 for i = 1:+1:fila
            for j = 1:+1:columna
                 imagenew(i,j)=at(i,j);
            end
 end
 imshow(imagenew);
       
       
   case 8
 
       at=zeros(fila,columna);
 for i = 1:+1:fila
            for j = 1:+1:columna
               if(i-1<1 && j-1<1)
                   mediav=[0 0 0 0 0 a(i,j) a(i,j+1) a(i+1,j) a(i+1,j+1)];
                   suma = sum(mediav);
                   at(i,j)= round(((suma^(1+snp))/9)/(suma^(snp)));
                    
                elseif(i-1<1 && j+1>columna)
                   mediav=[0 0 0 a(i,j-1) a(i,j) 0 a(i+1,j-1) a(i+1,j) 0];
                   suma = sum(mediav);
                   at(i,j)= round(((suma^(1+snp))/9)/(suma^(snp)));
                    
                 elseif(i+1>fila && j+1>columna )
                   mediav=[a(i-1,j-1) a(i-1,j) 0 a(i,j-1) a(i,j) 0 0 0 0];
                   suma = sum(mediav);
                   at(i,j)= round(((suma^(1+snp))/9)/(suma^(snp)));
                   
                 elseif(j+1>columna)
                   mediav=[a(i-1,j-1) a(i-1,j) 0 a(i,j-1) a(i,j) 0 a(i+1,j-1) a(i+1,j) 0];
                    suma = sum(mediav);
                    at(i,j)= round(((suma^(1+snp))/9)/(suma^(snp)));
                   
                elseif(i-1<1)
                     mediav=[0 0 0 a(i,j-1) a(i,j) a(i,j+1) a(i+1,j-1) a(i+1,j) a(i+1,j+1)];
                     suma = sum(mediav);
                     at(i,j)= round(((suma^(1+snp))/9)/(suma^(snp)));
                   
                elseif(j-1<1 && i+1>fila)
                    mediav=[0 a(i-1,j) a(i-1,j+1) 0 a(i,j) a(i,j+1) 0 0 0];
                    suma = sum(mediav);
                    at(i,j)= round(((suma^(1+snp))/9)/(suma^(snp)));
                   
                 elseif(i+1>fila)
                   mediav=[a(i-1,j-1) a(i-1,j) a(i-1,j+1) a(i,j-1) a(i,j) a(i,j+1) 0 0 0];
                   suma = sum(mediav);
                   at(i,j)= round(((suma^(1+snp))/9)/(suma^(snp)));
                   
                  elseif(j-1<1)
                   mediav=[0 a(i-1,j) a(i-1,j+1) 0 a(i,j) a(i,j+1) 0 a(i+1,j) a(i+1,j+1)];
                   suma = sum(mediav);
                   at(i,j)= round(((suma^(1+snp))/9)/(suma^(snp)));
                   
                  else
                   mediav=[a(i-1,j-1) a(i-1,j) a(i-1,j+1) a(i,j-1) a(i,j) a(i,j+1) a(i+1,j-1) a(i+1,j) a(i+1,j+1)];            
                   suma = sum(mediav);
                   at(i,j)= round(((suma^(1+snp))/9)/(suma^(snp)));
                   
               end
                
    
                  
            end
 end
 figure(4);  
 imagenew=imgg;
 for i = 1:+1:fila
            for j = 1:+1:columna
                 imagenew(i,j)=at(i,j);
            end
 end
 imshow(imagenew);
    otherwise
        disp('other value')
end


 prompt3 = '¿Quieres probar otro intervalo? SI=1 NO=0   ';
     no = input(prompt3);
end

%% funcion Expansion de Histograma
function pixel_ij = modac(array) 
% MYMEAN Local function that calculates mean of array.
    tama=size(array);
    m=1;
    for i = 1:tama
       s=1;
        for j = 1:tama
            if(array(i)== array(j) && i ~= j)
                s=s+1;
            end               
        end
        if(s >= m)
        m=s;
        a=i;    
        end
    end
     pixel_ij = array(a);
end 