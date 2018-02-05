% Auto-generated by cameraCalibrator app on 27-Jan-2018
%-------------------------------------------------------


% Define images to process
imageFileNames = {'C:\Users\Andres\Documents\MATLAB\Calibrations\DSC_0002.JPG',...
    'C:\Users\Andres\Documents\MATLAB\Calibrations\DSC_0003.JPG',...
    'C:\Users\Andres\Documents\MATLAB\Calibrations\DSC_0005.JPG',...
    'C:\Users\Andres\Documents\MATLAB\Calibrations\DSC_0007.JPG',...
    'C:\Users\Andres\Documents\MATLAB\Calibrations\DSC_0008.JPG',...
    'C:\Users\Andres\Documents\MATLAB\Calibrations\DSC_0009.JPG',...
    'C:\Users\Andres\Documents\MATLAB\Calibrations\DSC_0010.JPG',...
    'C:\Users\Andres\Documents\MATLAB\Calibrations\DSC_0011.JPG',...
    'C:\Users\Andres\Documents\MATLAB\Calibrations\DSC_0012.JPG',...
    'C:\Users\Andres\Documents\MATLAB\Calibrations\DSC_0013.JPG',...
    'C:\Users\Andres\Documents\MATLAB\Calibrations\DSC_0014.JPG',...
    'C:\Users\Andres\Documents\MATLAB\Calibrations\DSC_0015.JPG',...
    'C:\Users\Andres\Documents\MATLAB\Calibrations\DSC_0016.JPG',...
    'C:\Users\Andres\Documents\MATLAB\Calibrations\DSC_0017.JPG',...
    'C:\Users\Andres\Documents\MATLAB\Calibrations\DSC_0018.JPG',...
    'C:\Users\Andres\Documents\MATLAB\Calibrations\DSC_0019.JPG',...
    'C:\Users\Andres\Documents\MATLAB\Calibrations\DSC_0020.JPG',...
    };

% Detect checkerboards in images
[imagePoints, boardSize, imagesUsed] = detectCheckerboardPoints(imageFileNames);
imageFileNames = imageFileNames(imagesUsed);

% Generate world coordinates of the corners of the squares
squareSize = 25;  % in units of 'mm'
worldPoints = generateCheckerboardPoints(boardSize, squareSize);

% Calibrate the camera
[cameraParams, imagesUsed, estimationErrors] = estimateCameraParameters(imagePoints, worldPoints, ...
    'EstimateSkew', false, 'EstimateTangentialDistortion', false, ...
    'NumRadialDistortionCoefficients', 2, 'WorldUnits', 'mm', ...
    'InitialIntrinsicMatrix', [], 'InitialRadialDistortion', []);

% View reprojection errors
h1=figure; showReprojectionErrors(cameraParams);

% Visualize pattern locations
h2=figure; showExtrinsics(cameraParams, 'CameraCentric');

% Display parameter estimation errors
displayErrors(estimationErrors, cameraParams);

% For example, you can use the calibration data to remove effects of lens distortion.
originalImage = imread(imageFileNames{1});
undistortedImage = undistortImage(originalImage, cameraParams);

% See additional examples of how to use the calibration data.  At the prompt type:
% showdemo('MeasuringPlanarObjectsExample')
% showdemo('StructureFromMotionExample')