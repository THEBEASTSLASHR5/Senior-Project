// main title
draw_set_font(fnt_Default);
draw_set_color(c_black);
draw_text_transformed(x, y, "Top-Down Roguelike Action Game", 2, 2, 0);

// draw second line just below the first
var line_gap = string_height("Top-Down Roguelike Action Game") * 2 + 10;
draw_text(x, y + line_gap, "                                          By: G-TNT Team");
