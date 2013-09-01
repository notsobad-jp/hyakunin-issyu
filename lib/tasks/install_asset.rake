namespace :HyakuninIssyu do
	desc "Copy card images to target directory"
	task :install_img, 'install_dir'
	task :install_img do |t, args|
		require 'HyakuninIssyu'

		mkdir_p "#{args['install_dir']}"
		Dir["#{HyakuninIssyu.img_path}/*.jpg"].each do |src|
			cp src, "#{args['install_dir']}/"
		end
	end
end
