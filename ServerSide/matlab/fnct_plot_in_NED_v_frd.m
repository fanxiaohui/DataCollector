function res = fnct_plot_in_NED_v_FRD(R_ned_frd, v_frd)
    %Plot init
    fig = figure;

    %Plot NED coord frame
    ned_n = [1; 0; 0];
    ned_e = [0; 1; 0];
    ned_d = [0; 0; 1];
    starts = zeros(3,3);
    ends = [transpose(ned_n); transpose(ned_e); transpose(ned_d)];
    quiver3(starts(:,1), starts(:,2), starts(:,3), ends(:,1), ends(:,2), ends(:,3), 'black')
    hold on;

    %Plot (in NED coord frame) FRD coord frame
    frd_f = R_ned_frd*[1; 0; 0];
    frd_r = R_ned_frd*[0; 1; 0];
    frd_d = R_ned_frd*[0; 0; 1];
    %frd_f = R_frd_ned*[1; 0; 0];
    %frd_r = R_frd_ned*[0; 1; 0];
    %frd_d = R_frd_ned*[0; 0; 1];
    %checking FRD coord frame propierties
    dot_fr = dot(frd_f, frd_r)
    dot_rd = dot(frd_r, frd_d)
    dot_dr = dot(frd_d, frd_f)
    frd_f_magn = sqrt(dot(frd_f,frd_f))
    frd_r_magn = sqrt(dot(frd_r,frd_r))
    frd_d_magn = sqrt(dot(frd_d,frd_d))
    starts = zeros(3,3);
    ends = [transpose(frd_f); transpose(frd_r); transpose(frd_d)];
    quiver3(starts(:,1), starts(:,2), starts(:,3), ends(:,1), ends(:,2), ends(:,3), 'yellow')
    hold on;
    ends = [transpose(frd_f); [0, 0, 0]; [0, 0, 0]];
    quiver3(starts(:,1), starts(:,2), starts(:,3), ends(:,1), ends(:,2), ends(:,3), 'red')

    %Plot (in NED coord frame) v_ned = R_ned_frd*v_frd;
    starts = zeros(3,3);
    v_ned = R_ned_frd*v_frd;
    ends = [transpose(v_ned); [0, 0, 0]; [0, 0, 0]];
    quiver3(starts(:,1), starts(:,2), starts(:,3), ends(:,1), ends(:,2), ends(:,3), 'blue')
    hold on;

    % Plot settings
    %axis square;
    axis equal;
    %axis([-1 1 -1 1 -1 1]);
    %axis([-0.5 0.5 -0.5 0.5 -0.5 0.5]);
    title('NED (black) coord frame: FRD (x=red y,z=yellow) and v_{frd} (blue)');
    xlabel('x-axis (North)');
    ylabel('y-axis (East)');
    zlabel('z-axis (Down)');
    set(gca,'YDir','reverse');
    set(gca,'ZDir','reverse');
    %text(0.5,0,' \leftarrow sin(\pi)','FontSize',18) 
    hold off;
    
    res = 0;
end