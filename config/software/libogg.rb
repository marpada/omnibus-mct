name "libogg"
version "1.3.1"

dependency "yasm"

source :url => "http://downloads.xiph.org/releases/ogg/libogg-1.3.1.tar.gz",
       :md5 => "ba526cd8f4403a5d351a9efaa8608fbc"

relative_path "libogg-#{version}"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command ["./configure",
           "--prefix=#{install_dir}/embedded",
          ]
  command "make -j #{max_build_jobs}", :env => env
  command "make install", :env => env

end
