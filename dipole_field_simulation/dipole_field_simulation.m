% Electric Field of a Dipole in 3D
% Author: Aliakbar Mohsennejad
% Description: Visualization of the electric field due to an ideal dipole using MATLAB

clc;
clear;

%% Define grid space
range = linspace(-10, 10, 12);
[X, Y, Z] = meshgrid(range, range, range);

% Initialize field components
Ex = zeros(size(X));
Ey = zeros(size(Y));
Ez = zeros(size(Z));

%% Define constants
K = 9e9;          % Coulomb's constant
P = 1e-9;         % Dipole moment (C·m)
d = 1;            % Separation between charges

%% Calculate Electric Field Components
for n = 1:numel(X)
    R1 = sqrt((X(n) - d/2).^2 + Y(n).^2 + Z(n).^2);  % Distance from +q
    R2 = sqrt((X(n) + d/2).^2 + Y(n).^2 + Z(n).^2);  % Distance from -q

    Ex(n) = K * P * ((X(n) - d/2) ./ R1.^3 - (X(n) + d/2) ./ R2.^3);
    Ey(n) = K * P * (Y(n) ./ R1.^3 - Y(n) ./ R2.^3);
    Ez(n) = K * P * (Z(n) ./ R1.^3 - Z(n) ./ R2.^3);
end

%% Normalize the vectors for visualization
E_mag = sqrt(Ex.^2 + Ey.^2 + Ez.^2);
Exn = Ex ./ E_mag;
Eyn = Ey ./ E_mag;
Ezn = Ez ./ E_mag;

% Scale for better appearance
scale = 1;
Exn = Exn * scale;
Eyn = Eyn * scale;
Ezn = Ezn * scale;

%% Refine grid for smoother arrows
[Xq, Yq, Zq] = meshgrid(linspace(-10, 10, 12));

Exq = interp3(X, Y, Z, Exn, Xq, Yq, Zq);
Eyq = interp3(X, Y, Z, Eyn, Xq, Yq, Zq);
Ezq = interp3(X, Y, Z, Ezn, Xq, Yq, Zq);

%% Plot the field vectors using quiver3
figure('Color','w');
quiver3(Xq(:), Yq(:), Zq(:), Exq(:), Eyq(:), Ezq(:), 'r', 'LineWidth', 1.5);
axis equal;
grid on;
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('3D Electric Field of an Ideal Dipole');
view(45, 30);
