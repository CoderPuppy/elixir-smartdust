defmodule HelloApp do
	use SmartDust.App, id: :hello

	provide :launcher do
		show page: HelloPage, as: :fullscreen
	end

	defmodule HelloPage do
		use SmartDust.Page, id: :hello, view: :all

		defstruct [name: "World"]

		def init, do: %HelloPage{}

		def tick(state), do: state
		def handle(state, ev) do
			IO.puts "got #{inspect ev} in #{inspect state}"
			state
		end

		def render(state) do
			import SmartDust.Node.Helper
			[
				textfield(id: :name, value: state.name),
				text(value: "Hello #{state.name}!")
			]
		end
	end

	IO.inspect @actions
end