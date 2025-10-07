function draw_text_shadow(x, y, text, fontsya, halign, valign, text_color, shadow_color, x_offset, y_offset, shadow_alpha) {
    
    draw_set_font(fontsya);
    draw_set_halign(halign);
    draw_set_valign(valign);

    draw_set_color(shadow_color);
    draw_set_alpha(shadow_alpha);

    draw_text(x + x_offset, y + y_offset, text);

    draw_set_color(text_color);
    draw_set_alpha(1);

    draw_text(x, y, text);

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    draw_set_alpha(1);
}