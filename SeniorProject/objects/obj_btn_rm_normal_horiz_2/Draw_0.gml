draw_set_font(fnt_Default);
draw_text(x,y, "rm_normal_horiz_2");
var text_str = "rm_normal_horiz_2";
var text_x = x;
var text_y = y;

// measure text size
var text_w = string_width(text_str);
var text_h = string_height(text_str);

// padding around text
var pad = 4;

// --- draw black background ---
draw_set_color(c_black);
draw_rectangle(
    text_x - pad,
    text_y - pad,
    text_x + text_w + pad,
    text_y + text_h + pad,
    true   // filled box
);

// --- draw white outline ---
draw_set_color(c_white);
draw_rectangle(
    text_x - pad,
    text_y - pad,
    text_x + text_w + pad,
    text_y + text_h + pad,
    false  // outline only
);

// --- draw green text ---
draw_set_font(fnt_Default);
draw_set_color(c_lime);  // bright green (use c_green for darker tone)
draw_text(text_x, text_y, text_str);
