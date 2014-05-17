name "yasm"
version "1.2.0"

#dependency "zlib"
#dependency "openssl"

source :url => "http://www.tortall.net/projects/yasm/releases/yasm-#{version}.tar.gz",
       :md5 => "4cfc0686cf5350dd1305c4d905eb55a6"

relative_path "yasm-#{version}"

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

