defmodule SmartDust.App do
	defmacro __using__(id: id) when is_atom(id) do
		quote do
			# use SmartDust.System.Controller, system: 
			import SmartDust.App.Include


		end
	end

	defmodule Include do
		defmacro provide(type, do: blk) do
			name = ""
			if is_list(type) do
				[{type, name}] = type
			end
			IO.puts "SmartDust.App.provide #{type}: #{inspect name}, do: #{inspect blk}"
			quote do
				provide %SmartDust.Action{
					app: __MODULE__,
					type: unquote(type),
					name: unquote(name),
					handler: fn -> unquote(blk) end
				}
			end
		end

		defmacro provide(action) do
			quote do
				@actions [unquote(action)|@actions]
			end
		end

		defmacro show(opts) do
			IO.inspect {__MODULE__, opts}
		end
	end
end