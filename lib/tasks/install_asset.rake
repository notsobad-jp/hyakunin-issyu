namespace :HyakuninIssyu do
	desc "Copy card images to target directory"
	task :install_img, 'install_dir'
	task :install_img do |t, args|
		require 'HyakuninIssyu'
		Gem::Specification.name = 'HyakuninIssyu'

		mkdir_p "#{args['install_dir']}/hyakunin-issyu"
		Dir["#{HyakuninIssyu.img_path}/*.jpg"].each do |src|
			cp src, "#{args['install_dir']}/hyakunin-issyu/"
		end
	end
end
