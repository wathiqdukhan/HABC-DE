function S =  spread(F)
nF = size(F,1);
N = nF-2;
FSorted = sort(F);
Fef = FSorted(1,:);
Fel = FSorted(end,:);
Ff = FSorted(2,:);
Fl = FSorted(end-1,:);

df = pdist([Ff;Fef],'euclidean');
dl = pdist([Fl;Fel],'euclidean');

Di=[];
for i = 1 :  N-1
  Di=[Di,pdist([FSorted(i+1,:);FSorted((i+2),:)],'euclidean')]  ;
end
dmean = mean(Di);
numeraor = df+dl+ sum(abs(Di-dmean));
denum = df+dl+(N-1)*dmean;
S = (numeraor/denum);%-0.10;