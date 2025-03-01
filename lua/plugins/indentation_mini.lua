return {
	{
		'echasnovski/mini.indentscope',
		version = '*',
		config = function()
			require('mini.indentscope').setup {
				draw = {
					delay = 0,
					animation = require('mini.indentscope').gen_animation.linear {
						duration = 10,
						unit = 'step',
					},
				},
				symbol = '│', -- Símbolo para el alcance de indentación
				options = {
					try_as_border = true, -- Intentar mostrar el alcance como un borde
				},
			}
		end,
	},
}
