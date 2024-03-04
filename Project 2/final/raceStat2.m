
function raceStats = raceStat2(X, Y, t, path)
    % Analyze race statistics
    loops = -1;
    j = 0;
    k = 0;

    Xerr = [];
    Yerr = [];
    terr = [];
    disp(X)
    prevSection = 6;
    for i = 1:length(X)-1
        section = determineSection(X(i), Y(i), path);
        
        if prevSection == 6 && section == 1
            loops = loops + 1;
            j = j + 1;
            tloops(j) = t(i);
        end
        
        prevSection = section;
        
        if ~insideTrack(X(i), Y(i), section, path)
            k = k + 1;
            Xerr(k) = X(i);
            Yerr(k) = Y(i);
            terr(k) = t(i);
        end
    end
    
    raceStats.loops = loops;
    raceStats.tloops = tloops;
    raceStats.leftTrack.X = Xerr;
    raceStats.leftTrack.Y = Yerr;
    raceStats.leftTrack.t = terr;
end

function section = determineSection(x, y, path)
    if x < path.l_straight
        if x >= 0
            section = (y < path.radius) + 3 * (y >= path.radius);
        else
            section = 5 + (y < path.radius);
        end
    else
        section = (y < path.radius) + 2 * (y >= path.radius);
    end
end

function inside = insideTrack(x, y, section, path)
    switch section
        case 1
            inside = (y < (0.0 + path.width)) && (y > (0.0 - path.width));
        case {2, 3}
            rad = sqrt((x - path.l_straight)^2 + (y - path.radius)^2);
            inside = (rad < path.radius + path.width) && (rad > path.radius - path.width);
        case 4
            inside = (y < (2 * path.radius + path.width)) && (y > (2 * path.radius - path.width));
        case {5, 6}
            rad = sqrt((x - 0.0)^2 + (y - path.radius)^2);
            inside = (rad < path.radius + path.width) && (rad > path.radius - path.width);
        otherwise
            error("Invalid section");
    end
end
