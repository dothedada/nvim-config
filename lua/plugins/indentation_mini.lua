return {
	{
		'echasnovski/mini.indentscope',
		version = '*',
		config = function()
			require('mini.indentscope').setup {
				draw = {
					animation = require('mini.indentscope').gen_animation.linear {
						duration = 1,
						unit = 'total',
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
