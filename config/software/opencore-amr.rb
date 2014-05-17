name "opencore-amr"
version "0.1.3"


source :url => "http://downloads.sourceforge.net/project/opencore-amr/opencore-amr/opencore-amr-#{version}.tar.gz",
       :md5 => "09d2c5dfb43a9f6e9fec8b1ae678e725"

relative_path "opencore-amr-#{version}"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command ["./configure",
           "--prefix=#{install_dir}/embedded",
          "--disable-compile-c",
          ], :env => env
  command "make -j #{max_build_jobs}", :env => env
  command "make install", :env => env

end
