I1left = rgb2gray(imread('im1.jpg'));
I2right = rgb2gray(imread('im2.jpg'));
imshowpair(I1left, I2right,'montage');
title('I1 (left); I2 (right)');
figure; imshowpair(I1left,I2right,'ColorChannels','red-cyan');
title('Composite Image (Red - Left Image, Cyan - Right Image)');


blobs1 = detectSURFFeatures(I1left, 'MetricThreshold', 2000);
blobs2 = detectSURFFeatures(I2right, 'MetricThreshold', 2000);

[features1, validBlobs1] = extractFeatures(I1left, blobs1);
[features2, validBlobs2] = extractFeatures(I2right, blobs2);

indexPairs = matchFeatures(features1, features2, 'Metric', 'SAD', ...
  'MatchThreshold', 5);

matchedPoints1 = validBlobs1(indexPairs(:,1),:);
matchedPoints2 = validBlobs2(indexPairs(:,2),:);

figure; showMatchedFeatures(I1left, I2right, matchedPoints1, matchedPoints2);
legend('Putatively matched points in I1', 'Putatively matched points in I2');

[m,n]=size(matchedPoints1);


mp1loc = matchedPoints1.Location(:,1);
mp2loc = matchedPoints2.Location(:,1);
    
verticalshift = (matchedPoints1.Location(:,2) - matchedPoints2.Location(:,2));

avgshift = sum(verticalshift)/m;

shifter = vision.GeometricTranslator;
shifter.OutputSize='Same as input image';
shifter.Offset = [avgshift 0];

I2s = im2single(I2right);
shiftedI2 = step(shifter, I2s);
[imwidth, imheight] = size(shiftedI2);
modavg = abs(avgshift);
modheight = imheight - modavg;


scI2 = imcrop(shiftedI2, [0 0 modheight imwidth]);
cI1 = imcrop(I1left, [0 0 modheight imwidth]);

figure; imshowpair(I1left, shiftedI2, 'montage');
figure; imshowpair(cI1, scI2, 'montage');


