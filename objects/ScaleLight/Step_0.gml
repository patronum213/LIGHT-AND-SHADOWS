if (scale >= max_scale)
{
    going_up = false;
}
else if (scale <= min_scale)
{
    going_up = true;
}

if (going_up)
{
    scale += scale_inc;
}
else
{
    scale -= scale_inc;
}

light_set_scale(light, scale);