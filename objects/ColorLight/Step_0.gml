var color;
if (hue == next_hue)
{
    next_hue = floor(random(255));
    going_up = next_hue > hue;
}

if (going_up)
{
    hue += hue_inc;
}
else
{
    hue -= hue_inc;
}

color = make_color_hsv(hue, 255, 255);
light_set_color(light, color);