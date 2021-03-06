%ACTUALIZADO 3.07PM 13/05/2020
%Primera capa %
root="C:\Users\Clon\Desktop\JELPU\CNN-COVID19-master\Non Covid\TODO"
[conteo,query]=loadImsFromFolder(root);
contix=0;
zc=ones(1,conteo);
tic
for h=1:conteo
    h
    XY=uint8(squeeze(query(h,:,:)));
    %XY=imread('corona.png');
    %imshow(XY)
    XY=imresize(XY,[128 128]);
    size(XY,[128 128]);
    %imagen=rgb2gray(XY);
    imagen=(XY);
    filtro=[0,7,0;9,9,1;1,0,0];%filtro invertido *****1
    imagenVec=reshape(imagen,1,[]);
    filtroVec=reshape(filtro,1,[]);
    [imageSize,asd]=size(imagen);
    [x,y]=size(filtro);
    rango=(imageSize-x)+1;

    %MATRIZ DE PESOS CAPA 1
    vecIndexI=1:2;
    vecIndexJ=1:2;
    vecValue=1:2;

    i=1;
    index=1;
    con=0;

    while(i<(imageSize-2)*imageSize)

        con=con+1;
        j=i+imageSize;
        k=j+imageSize;

        vecIndexI(index)=i;
        vecIndexJ(index)=con;
        vecValue(index)=filtroVec(1);

        vecIndexI(index+1)=i+1;
        vecIndexJ(index+1)=con;
        vecValue(index+1)=filtroVec(2);

        vecIndexI(index+2)=i+2;
        vecIndexJ(index+2)=con;
        vecValue(index+2)=filtroVec(3);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
        vecIndexI(index+3)=j;
        vecIndexJ(index+3)=con;
        vecValue(index+3)=filtroVec(4);

        vecIndexI(index+4)=j+1;
        vecIndexJ(index+4)=con;
        vecValue(index+4)=filtroVec(5);

        vecIndexI(index+5)=j+2;
        vecIndexJ(index+5)=con;
        vecValue(index+5)=filtroVec(6);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
        vecIndexI(index+6)=k;
        vecIndexJ(index+6)=con;
        vecValue(index+6)=filtroVec(7);

        vecIndexI(index+7)=k+1;
        vecIndexJ(index+7)=con;
        vecValue(index+7)=filtroVec(8);

        vecIndexI(index+8)=k+2;
        vecIndexJ(index+8)=con;
        vecValue(index+8)=filtroVec(9);
        index=index+9;



        if(rem(i+2,imageSize)==0)
            i=i+3;
        else
            i=i+1;
        end
    end

    z=load('w4.txt');
    row=z(:,1);
    col=z(:,2);
    v=z(:,3);
    w4=sparse(row,col,v,16384,15876); %DEFINICION DE MATRIZ DE PESOS A PARTIR DE LA CARGA
    %w4=sparse(vecIndexI,vecIndexJ,vecValue); %DEFINICIÓN MATRIZ DE PESOS
    a5=sparse(im2double(imagenVec));
    argRelu=sparse(a5*w4); %CONVOLUCION(IMAGEN,FILTRO)
    n=1; %Aumenta los valores para el input
    inputCapa2=0.30*(reshape(n*reLu(argRelu),rango,[])); %PENDIENTE EL 0.30 QUE RESALTA COSAS
    %imshow(reshape(full(inputCapa2),510,[]));


    %MATRIZ DE PESOS CAPA 2

    [imageSizeCapa2,asd]=size(inputCapa2);
    %filtro2=[-1,0,1;2,0,0;-1,-2,-1]; %El mas firme en convergencia
    filtro2=[1,-1,2;-1,1,3;-1,4,1];
    filtroVec2=reshape(filtro2,1,[]);

    [x,y]=size(filtro2);
    rango=(imageSizeCapa2-x)+1;


    vecIndexII=1:2;
    vecIndexJJ=1:2;
    vecValuee=1:2;

    i=1;
    index=1;
    con=0;

    while(i<(imageSizeCapa2-2)*imageSizeCapa2)

        con=con+1;
        j=i+imageSizeCapa2;
        k=j+imageSizeCapa2;


        vecIndexII(index)=i;
        vecIndexJJ(index)=con;
        vecValuee(index)=filtroVec2(1);

        vecIndexII(index+1)=i+1;
        vecIndexJJ(index+1)=con;
        vecValuee(index+1)=filtroVec2(2);

        vecIndexII(index+2)=i+2;
        vecIndexJJ(index+2)=con;
        vecValuee(index+2)=filtroVec2(3);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
        vecIndexII(index+3)=j;
        vecIndexJJ(index+3)=con;
        vecValuee(index+3)=filtroVec2(4);

        vecIndexII(index+4)=j+1;
        vecIndexJJ(index+4)=con;
        vecValuee(index+4)=filtroVec2(5);

        vecIndexII(index+5)=j+2;
        vecIndexJJ(index+5)=con;
        vecValuee(index+5)=filtroVec2(6);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
        vecIndexII(index+6)=k;
        vecIndexJJ(index+6)=con;
        vecValuee(index+6)=filtroVec2(7);

        vecIndexII(index+7)=k+1;
        vecIndexJJ(index+7)=con;
        vecValuee(index+7)=filtroVec2(8);

        vecIndexII(index+8)=k+2;
        vecIndexJJ(index+8)=con;
        vecValuee(index+8)=filtroVec2(9);
        index=index+9;



        if(rem(i+2,imageSizeCapa2)==0)
            i=i+3;
        else
            i=i+1;
        end
    end

    z=load('w3.txt');
    row=z(:,1);
    col=z(:,2);
    v=z(:,3);
    w3=sparse(row,col,v,15876,15376);%DEFINICION DE MATRIZ DE PESOS A PARTIR DE LA CARGA
    %w3=sparse(vecIndexII,vecIndexJJ,vecValuee); %DEFINICIÓN MATRIZ DE PESOS
    inputCapa2=reshape(inputCapa2,1,[]);
    [sizet,tt]=size(inputCapa2);
    a4=sparse(inputCapa2);

    argRelu=sparse(a4*w3); %CONVOLUCION(IMAGEN,FILTRO)
    n2=300; %Aumenta los valores para el input
    a3=reLu(argRelu);
    a3=a3*0.03;
    %a3=sparse(n*funcionAct(argRelu));
    %imshow(reshape(full(a3),rango,[]));

    %POOLING

    %toPool=reshape(a3,1,[]);
    vecValuePx=1:2;

    i=1;
    con=0;
    while(i<(rango-1)*(rango))
        con=con+1;
        j=i+rango;
        vec=[a3(i),a3(j),a3(i+1),a3(j+1)];
        vecix=[i,j,i+1,j+1];
        [m,n]=max(vec);
        for t=1:4
            if (t~=n)
                a3(vecix(t))=0;
            end
        end

        vecValuePx(con)=m;
        if rem(i+1,rango)==0
            i=i+2+rango;
        else
            i=i+2;

        end

    end
    vecIndexIP=1:con;
    %imshow(reshape(2*vecValueP,sqrt(rango*rango/4),[]));
    a2=sparse(2*vecValuePx);
    %POOLING



    %FULLY CONNECTED NN LAYER
    [x,y]=size(a2);

    z=load('w1.txt');
    row=z(:,1);
    col=z(:,2);
    v=z(:,3);
    w1=sparse(row,col,v,3844,2);%DEFINICION DE MATRIZ DE PESOS A PARTIR DE LA CARGA
    %w1=sparse(randi([-3,3],y,2));
    a1=sparse(reLu(a2*w1));
    eo=[0,1];%1,0
    lr=0.01;
    % w3=w3 - lr*(a4'*a3);
    % w4=w4 - lr*((w3*a3')*a5)';
    % ts1=taylorSigmoidD(a5,w4,2)'*a3;
    % ts2=taylorSigmoidD(a4,w3,1)';
    %w4=w4 - lr*(taylorSigmoidD(a5,w4,2)'*a3)*taylorSigmoidD(a4,w3,1)';

    %ENTRENAMIENTO




    az=a1;
    b=0;
    
    while(dot(eo-a1,eo-a1)/2>0.3)
        b=b+1;
        w1=w1 - lr*sparse(a2'*(a1-eo));

        vec1=1:2;
        for x=1:138384
            vec1(1,x)=(a4(1,vecIndexII(x))*a3(1,vecIndexJJ(x)));
        end

        w3 = w3 - lr*sparse(vecIndexII,vecIndexJJ,vec1);

        comp1=(w3*a3')';
        vec2=1:3;
        for y=1:142884
            vec2(1,y)=(comp1(1,vecIndexJ(y))*a5(1,vecIndexI(y)));
        end

        w4 = w4 - lr*sparse(vecIndexI,vecIndexJ,vec2);

        a4=reLu(a5*w4);
        a3=reLu(a4*w3);

        while(i<(rango-1)*(rango))
            con=con+1;
            j=i+rango;
            vec=[a3(i),a3(j),a3(i+1),a3(j+1)];
            vecix=[i,j,i+1,j+1];
            [m,n]=max(vec);
            for t=1:4
                if (t~=n)
                    a3(vecix(t))=0;
                end
            end

            vecValuePx(con)=m;
            if rem(i+1,rango)==0
                i=i+2+rango;
            else
                i=i+2;

            end

        end
        vecIndexIP=1:con;
        %imshow(reshape(2*vecValueP,sqrt(rango*rango/4),[]));
        a2=sparse(2*vecValuePx);
        a1=sparse(reLu(a2*w1));
        r=dot(eo-a1,eo-a1)/2;
        if b >1
            break
        end
         
        if r>1 %|| b==1
            contix=contix+1;
            zc(h)=0;
            break
        end
            
    end
    r=0;
end
toc
disp(strcat('Precision para identificar no infectados: ',contix/conteo))
figure
hist(zc);
set(xlabel('Personas infectadas := 1 <> Personas no infectadas := 0'),'fontsize',18);
set(ylabel('Cantidad de aciertos'),'fontsize',18);

% for i = 1:2322576
%     if vec(1,i)~=0
%         vec(1,i)
%     end
% end


%W4(I,J) = W4(I,J) – TS1(I,:)*TS2(:,J)

% Proceso de backpropagation anterior


%while(dot(salida,y)>0)
    %back del pooling
    %w3=w3-lr*functionActD(a3,w3,2)*functionActD(a2,w1',1)*diag(a1-y);
    
    %z= -1*(exp(a5*w4))*w4';
%     a5=sparse(a5);
%     x=a5*w4;
%     %%%%% Maraña
%     k=find(x);
%     [N,n]=size(x);
%     Yo=sparse(zeros(1,n));
%     Yo(k)=-1.*(exp(x(k)));
%     Yo=sparse(Yo);
%     Yo=Yo*w4';
%     w=(1+exp(-a5*w4))*(1+exp(-a5*w4))'; 
%     zw=sparse((Yo*(1/w)));
%     %%%%% Maraña
%     
% 
% %     %%%%% Maraña optimizar W3
%     x=a4*w3;
%     k=find(x);
%     [N,n]=size(x);
%     Yo=sparse(zeros(1,n));
%     Yo(k)=-1.*(exp(x(k))); 
%     Yo=sparse(a4'*Yo);
%     w=z./((1+exp(-a4*w3')) * (1+exp(-a4*w3'))');
% %     zf=sparse(Yo*(1/w));
% %     
% %     %zf=sparse(functionActD(a4,w3',1));
% %     %%%%% Maraña
% %     %w4=w4-lr*(zf'*zw);
% %     
% %     %w4p=sparse()
% %     %w4p=260100*262144=510*510*512*512
% %     disp('hi');
% %     %w4=w4-lr*(zf'*zw);  
% %     %dot(salida,y)
% %end
% 
% % 
% % [m,n]=size(a5)
% % S = spalloc(m,n,nnz(a5));
% % for j = 1:n
% %     ind = [max(j-1,1) j min(j+1,n)];
% %     S(:,j) = sparse(a5(:,j));
% % end
% % 
% % [m,n1]=size(Yo)
% % S1 = spalloc(m,n1,nnz(Yo));
% % for j = 1:n1
% %     ind = [max(j-1,1) j min(j+1,n1)];
% %     S1(:,j) = sparse(Yo(:,j));
% % end
% 
% Proceso de backpropagation anterior












