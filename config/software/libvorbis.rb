name "libvorbis"
version "1.3.4"

dependency "yasm"

source :url => "http://downloads.xiph.org/releases/vorbis/libvorbis-#{version}.tar.gz",
       :md5 => "8851c593a52d1ef9c526d95174873852"

relative_path "libvorbis-#{version}"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command ["./configure",
           "--prefix=#{install_dir}/embedded",
	   "--with-ogg=#{install_dir}/embedded",
          ], :env => env
  command "make -j #{max_build_jobs}", :env => env
  command "make install", :env => env

end
