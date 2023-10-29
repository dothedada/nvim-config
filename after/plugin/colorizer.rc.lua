local status, colorizer = pcall(require, 'colorizer')
if (not status) then return end

colorizer.setup {
    '*';
    css = {
        RRGGBBAA = true;        -- #RRGGBBAA hex codes
        css      = true;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn   = true;
    }
}
