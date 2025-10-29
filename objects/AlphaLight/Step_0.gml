if (alpha >= max_alpha)
{
    going_up = false;
}
else if (alpha <= min_alpha)
{
    going_up = true;
}

if (going_up)
{
    alpha += alpha_inc;
}
else
{
    alpha -= alpha_inc;
}

light_set_alpha(light, alpha);