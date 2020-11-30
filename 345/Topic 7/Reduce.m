
% Read in the image
img = imread("siamese-cat.png");

% Display the original image
imshow(img);

% Make the image grayscale by just averaging the RGB values
img_gray = round(sum(img,3)/3);

% Get SVD for gray image
[U,S,V] = svd(img_gray);

show = @(M,N) {
	img_gray_reduced = U(:,M:N)*S(M:N,M:N)*V(:,M:N)';
	% For imshow you need the correct format for the integers
	imshow(uint8(img_gray));
	figure();
	imshow(uint8(round(img_gray_reduced)));
};