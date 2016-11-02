clear all
clc

load('dataComAguaSemNaN.mat');

bp2 = [];
bp4 = [];

bacc = 100000;
acc = 0;

dados2 = xTest(find(outClasse==0),:);
dados4 = xTest(find(outClasse==1),:);


while(true)

    p1 = rand/20+.025;

    pos2 = randperm(size(dados2,1),round(a*b*p1));
    pos4 = randperm(size(dados4,1),round((.1-p1)*a*b));

    
    Vector = [dados2(pos2,:);dados4(pos4,:)];
    V = [zeros(round(a*b*p1),1);ones(round((.1-p1)*a*b),1)];
    
    
    VectorT = xTest;
    
    VT = outClasse;
    
    save('features','Vector','V','VectorT','VT');
    
    [nTest,ind] = ag_controle();
    
    
    if(nTest<bacc)
                bacc = nTest
        save('features4','Vector','V','VectorT','VT');    

    end
    
end