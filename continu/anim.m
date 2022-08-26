clear all
graphics_toolkit qt
set (0, "defaultlinelinewidth", 2);

h.points = rand (2, 3);         # 3 random points
h.line = [];
h.marker = [];
set (gcf, "userdata", h)

function down_fig (hsrc, evt)

  h = get (hsrc, "userdata");
  if (isempty (h.marker))
    hold on
    h.marker = plot (NA, NA, "o", "markersize", 15, "color", "green");
    hold off
  endif

  set (hsrc, "userdata", h);
  drag_fig (hsrc, evt);
endfunction

function drag_fig (hsrc, evt)

  # evt 1:left button, 2:middle button, 3:right button
  h = get (hsrc, "userdata");

  if (! isempty (h.marker))
    c = get (gca, "currentpoint")([1;3]);
    set (h.marker, "xdata", c(1));
    set (h.marker, "ydata", c(2));

    # find nearest point
    d = h.points - c;
    [~, idx] = min (hypot (d(1, :), d(2, :)));
    h.points(:, idx) = c;

  endif

  # draw / update the line
  tmp = [h.points h.points(:,1)]; # duplicate first point to close triangle
  if (isempty (h.line))
    h.line = plot (tmp(1, :), tmp(2, :), "-o");
    h.text = text (NA, NA, "", "horizontalalignment", "center");
    ## testing
    axis ([0 1 0 1])
  else
    set (h.line, "xdata", tmp(1, :));
    set (h.line, "ydata", tmp(2, :));
  endif

  # calculate the area
  A = polyarea (h.points(1, :),
                h.points(2, :));
  P = mean (h.points, 2);
  set (h.text, "position", mean (h.points, 2).');
  set (h.text, "string", sprintf ("A = %.3f", A));

  set (hsrc, "userdata", h);

endfunction

function up_fig (hsrc, evt)

  h = get (gcbf, "userdata");
  delete (h.marker);
  h.marker = [];
  set (gcbf, "userdata", h);

endfunction

set (gcf, "windowbuttondownfcn", @down_fig);
set (gcf, "windowbuttonmotionfcn", @drag_fig)
set (gcf, "windowbuttonupfcn", @up_fig)

# first update
drag_fig (gcf, [])