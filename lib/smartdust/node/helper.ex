defmodule SmartDust.Node.Helper do
	basic_types = ~w[textfield text]a
	advanced_types = ~w[]a

	for type <- basic_types do
		IO.inspect {__MODULE__, type}
		def unquote(type)(opts) do
			IO.inspect {__MODULE__, unquote(type), opts}
		end
	end
end