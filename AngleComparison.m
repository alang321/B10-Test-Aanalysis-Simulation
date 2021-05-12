%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Loading Rigid-Body Comparison Angle of Attack Comparison
load('RigidAngleComparison/case2/xBody.mat')
load('RigidAngleComparison/case2/anglesBody.mat')
load('RigidAngleComparison/case2/anglesFlap.mat')
load('RefData/XDataReference.mat')
load('RefData/XDataReferenceFlap.mat')
load('RefData/YDataReference.mat')
load('RefData/YDataReferenceFlap.mat')

% Functions for plotting
xBody = cell2mat(xBody);
anglesBody = cell2mat(anglesBody);
plot(xBody, anglesBody, 'rx')

%initialindex = find(xBody == 1.25)
initialindex = min(find(abs(anglesBody) < 0.03));
finalindex = find(xBody == xBody(initialindex) + 2.5);

periodxBody = xBody(initialindex: finalindex);
periodanglesBody = anglesBody(initialindex:finalindex);
periodanglesFlap = anglesFlap(initialindex:finalindex);

normperiodxBody = (periodxBody-periodxBody(1))/2.5;

plot(periodxBody, periodanglesBody, 'rx')

figure

%plot(XDataReference, YDataReference, 'ko')
hold on
%xnew = (0:0.005:1)';
xnew = normperiodxBody;
ynew = interp1(XDataReference, YDataReference, xnew, 'spline');

plot(xnew, ynew, 'b-')
plot(normperiodxBody, periodanglesBody, 'rx')

%title('Reference Data Plot; Normalized Time Period Variation of Angle of Attack')
xlabel('Normalized Time Period [-]')
ylabel('Angle of Attack [deg]')
legend("True", "Observed")

stdtrue = std(ynew - periodanglesBody,1);
meantrue = mean(ynew - periodanglesBody);

figure

plot(xnew, ynew - periodanglesBody, 'bx')
hold on
yline(meantrue, 'k--')
yline(meantrue - 2*stdtrue, 'r-.')
yline(meantrue + 2*stdtrue, 'r-.')
legend("Difference between True and Observed", "Mean", "95% Confidence Interval")

figure 

plot(xnew, ynew - periodanglesBody - meantrue, 'bx')
hold on
yline(0, 'k--')
yline(0 - 2*stdtrue, 'r-.')
yline(0 + 2*stdtrue, 'r-.')
xlabel('Normalized Time Period [-]')
ylabel('Angle of Attack Difference [deg]')
legend("Difference between True and Observed", "Mean", "95% Confidence Interval")
%% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Loading Tracker Regression Comparison Angle of Attack Comparison
load('TrackerRegression/case2/time.mat')
load('TrackerRegression/case2/anglesMain.mat')
load('TrackerRegression/case2/anglesFlap.mat')


% Functions for plotting
time = time.mat;
anglesMain = anglesMain.mat;
anglesFlap = anglesFlap.mat;
plot(time, anglesBody, 'rx')

%initialindex = find(xBody == 1.25)
initialindex = min(find(abs(anglesBody) < 0.03));
finalindex = find(xBody == xBody(initialindex) + 2.5);

periodxBody = xBody(initialindex: finalindex);
periodanglesBody = anglesBody(initialindex:finalindex);
periodanglesFlap = anglesFlap(initialindex:finalindex);

normperiodxBody = (periodxBody-periodxBody(1))/2.5;

plot(periodxBody, periodanglesBody, 'rx')

figure

%plot(XDataReference, YDataReference, 'ko')
hold on
%xnew = (0:0.005:1)';
xnew = normperiodxBody;
ynew = interp1(XDataReference, YDataReference, xnew, 'spline');

plot(xnew, ynew, 'b-')
plot(normperiodxBody, periodanglesBody, 'rx')

%title('Reference Data Plot; Normalized Time Period Variation of Angle of Attack')
xlabel('Normalized Time Period [-]')
ylabel('Angle of Attack [deg]')
legend("True", "Observed")

stdtrue = std(ynew - periodanglesBody,1);
meantrue = mean(ynew - periodanglesBody);

figure

plot(xnew, ynew - periodanglesBody, 'bx')
hold on
yline(meantrue, 'k--')
yline(meantrue - 2*stdtrue, 'r-.')
yline(meantrue + 2*stdtrue, 'r-.')
legend("Difference between True and Observed", "Mean", "95% Confidence Interval")

figure 

plot(xnew, ynew - periodanglesBody - meantrue, 'bx')
hold on
yline(0, 'k--')
yline(0 - 2*stdtrue, 'r-.')
yline(0 + 2*stdtrue, 'r-.')
xlabel('Normalized Time Period [-]')
ylabel('Angle of Attack Difference [deg]')
legend("Difference between True and Observed", "Mean", "95% Confidence Interval")
