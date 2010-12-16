
Puppet::Type.newtype(:ttys) do
	@doc = "Manages lines in /etc/ttys."

	ensurable

	newparam(:name) do
		desc "The tty to manage"
		isnamevar
	end

	newproperty(:getty) do
		desc "getty to use"
	end

	newproperty(:type) do
		desc "the type of console"
	end

	newproperty(:status) do
		desc "is this tty on or off"
	end


	newproperty(:comment) do
		desc "comment for tty"
	end	

	newproperty(:target) do
		desc "tty file to edit"

		defaultto { 
		   if @resource.class.defaultprovider.ancestors.include?(Puppet::Provider::ParsedFile)
		   	@resource.class.defaultprovider.default_target
		   else
			nil
		   end
		}
	end

end
	
