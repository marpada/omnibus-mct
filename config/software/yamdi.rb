name "yamdi"
version "1.9"

source :url => "http://downloads.sourceforge.net/project/yamdi/yamdi/#{version}/yamdi-#{version}.tar.gz",
       :md5 => "14254b2a68f88feb3fead962bca5dc03"

relative_path "yamdi-#{version}"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command "gcc yamdi.c -o yamdi -O2 -Wall", :env => env
  command "strip yamdi", :env => env
  command "cp yamdi #{install_dir}/bin/", :env => env

end
