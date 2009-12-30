# @url http://matt.west.co.tt/ruby/djerb/
require 'erb'

module Djerb
	# Evaluate the file 'filename' as a Djerb template, in the context of the
	# binding 'b'
	def Djerb.run(filename, b = TOPLEVEL_BINDING)
		# initialise the 'global' definitions @_djerb_blocks, block and extends
		# (which should persist between templates), then hand off to continue
		eval <<-ENDDEFS, b
			@_djerb_blocks = {}
			def block(id, &block_proc)
				# define the block identified by 'id' if it's not already been defined
				# by a more specific template, and immediately evaluate it if this is
				# the base template (i.e. we haven't seen an 'extends' yet).
				@_djerb_blocks[id] ||= block_proc
				@_djerb_blocks[id].call if @_djerb_evaluate_blocks
			end
			def extends(filename)
				# Schedule 'filename' to be executed after we've finished
				# processing the remaining declarations in the present template
				@_djerb_next_template = filename
				@_djerb_evaluate_blocks = false
			end
		ENDDEFS
		continue(filename, b)
	end

	# Evaluate the Djerb template 'filename', inside a binding which has been
	# pre-seeded by run
	def Djerb.continue(filename, b = TOPLEVEL_BINDING)
		eval <<-ENDDEFS, b
			@_djerb_next_template = nil
			@_djerb_evaluate_blocks = true
		ENDDEFS
		ERB.new(File.read(filename)).result(b)
		eval <<-ENDRESULT, b
			# if another template has been named by 'extends', evaluate that one next,
			# otherwise _erbout is our final result
			@_djerb_next_template ? Djerb.continue(@_djerb_next_template, binding) : _erbout
		ENDRESULT
	end
end