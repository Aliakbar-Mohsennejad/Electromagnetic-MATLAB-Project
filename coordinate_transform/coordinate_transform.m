% Coordinate System Converter
% Author: Aliakbar Mohsennejad
% Description: Convert a 3D vector between Cartesian, Cylindrical, and Spherical coordinate systems.

clc;
clear;

fprintf('--- 3D Coordinate System Converter ---\n');
fprintf('1 = Cartesian\n2 = Cylindrical\n3 = Spherical\n');

inputSys = input('Enter the number for your input coordinate system: ', 's');
outputSys = input('Enter the number for your output coordinate system: ', 's');

fprintf('---------------------------------------\n');

% Read input vector based on input coordinate system
switch inputSys
    case '1' % Cartesian
        x = input('Enter x: ');
        y = input('Enter y: ');
        z = input('Enter z: ');
        
    case '2' % Cylindrical
        r = input('Enter r: ');
        phi = input('Enter phi (in radians): ');
        z = input('Enter z: ');
        
    case '3' % Spherical
        r = input('Enter r: ');
        theta = input('Enter theta (in radians): ');
        phi = input('Enter phi (in radians): ');
        
    otherwise
        error('Invalid input coordinate system selected.');
end

fprintf('\n--- Converting...\n');

% Convert from input system to Cartesian
switch inputSys
    case '1' % Already Cartesian
        xc = x; yc = y; zc = z;
        
    case '2' % Cylindrical to Cartesian
        xc = r * cos(phi);
        yc = r * sin(phi);
        zc = z;
        
    case '3' % Spherical to Cartesian
        xc = r * sin(theta) * cos(phi);
        yc = r * sin(theta) * sin(phi);
        zc = r * cos(theta);
end

% Convert from Cartesian to desired output
switch outputSys
    case '1' % Cartesian
        xo = xc; yo = yc; zo = zc;
        fprintf('\nConverted to Cartesian:\n');
        fprintf('x = %.4f\ny = %.4f\nz = %.4f\n', xo, yo, zo);
        
    case '2' % Cylindrical
        ro = sqrt(xc^2 + yc^2);
        phio = atan2(yc, xc);
        zo = zc;
        fprintf('\nConverted to Cylindrical:\n');
        fprintf('r = %.4f\nphi = %.4f rad\nz = %.4f\n', ro, phio, zo);
        
    case '3' % Spherical
        ro = sqrt(xc^2 + yc^2 + zc^2);
        thetao = atan2(sqrt(xc^2 + yc^2), zc);
        phio = atan2(yc, xc);
        fprintf('\nConverted to Spherical:\n');
        fprintf('r = %.4f\ntheta = %.4f rad\nphi = %.4f rad\n', ro, thetao, phio);
        
    otherwise
        error('Invalid output coordinate system selected.');
end
