I=imread('cameraman.tif');
if size(I,3)==3,I=rgb2gray(I);end
[counts,~]=imhist(I);
figure;subplot(1,3,1);imshow(I);title('Original');
subplot(1,3,2);bar(counts);title('Histogram');
[~,locs]=findpeaks(double(counts));
if numel(locs)>=2
p1=locs(1);p2=locs(2);
[~,v]=min(counts(p1:p2));
T=p1+v-1;
else
T=round(mean(I(:)));
end
B=I>T;
subplot(1,3,3);imshow(B);title(['Binary T=',num2str(T)]);
