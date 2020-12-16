if ~exist('problem3_output','var')
    disp('Did not find problem_output dataset to plot results.');
    disp('Please run simulation on the problem3 model.');
elseif isa(ABS_output,'Simulink.SimulationData.Dataset')
    h = findobj(0, 'Name', 'problem3 Speeds');
    if isempty(h),
      h=figure('Position',[26   239   452   257],...
               'Name','problem3 Speeds',...
               'NumberTitle','off');
    end

    figure(h)
    set(h,'DefaultAxesFontSize',8)

    % data is logged in sldemo_absbrake_output
    % this prevents the main workspace from getting cluttered

    % plot wheel speed and car speed
    plot(problem3_output.get('yout').Values.Vs.Time, ...
         problem3_output.get('yout').Values.Vs.Data, ... 
         problem3_output.get('yout').Values.speed.Time, ...
         problem3_output.get('yout').Values.speed.Data);
    legend('Vehicle Speed \omega_v','Wheel Speed \omega_w','Location','best'); 
    title('Vehicle speed and wheel speed'); ylabel('Speed(rad/sec)'); xlabel('Time(sec)');

    h = findobj(0, 'Name', 'ABS Slip');
    if isempty(h),
      h=figure('Position',[486    239   452   257],...
               'Name','ABS Slip',...
               'NumberTitle','off');
    end

    figure(h);
    plot(problem3_output.get('slp').Values.Time, ...
         problem3_output.get('slp').Values.Data);
    title('Slip'); xlabel('Time(sec)'); ylabel('Normalized Relative Slip');

end