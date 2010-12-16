
Puppet::Type.newtype(:rcconf) do
	@doc = "Sets up a custom rcconf flag for daemons, other than the _enable flag."

	ensurable

	newparam(:name) do
		desc "The left side of the rcflag"
		isnamevar
	end

	newproperty(:value) do
		desc "Value assign to the name, right side of the rcflag"
	end

	newproperty(:target) do
		desc "The file in which to store the rcconf flag.  Only used by
		  those providers that write to disk."
		defaultto { 
		   if @resource.class.defaultprovider.ancestors.include?(Puppet::Provider::ParsedFile)
		   	@resource.class.defaultprovider.default_target
		   else
			nil
		   end
		}
	end

end
	
