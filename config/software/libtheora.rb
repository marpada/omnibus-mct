name "libtheora"
version "1.1.1"

dependency "libogg"
dependency "libvorbis"

source :url => "http://downloads.xiph.org/releases/theora/libtheora-#{version}.tar.bz2",
       :md5 => "292ab65cedd5021d6b7ddd117e07cd8e"

relative_path "libtheora-#{version}"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command ["./configure",
           "--prefix=#{install_dir}/embedded",
           "--with-ogg=#{install_dir}/embedded",
           "--with-vorbis=#{install_dir}/embedded"
          ], :env => env
  command "make -j #{max_build_jobs}", :env => env
  command "make install", :env => env

end
