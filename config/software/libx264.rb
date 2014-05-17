name "libx264"
version "stable"

dependency "yasm"

source :git => "git://git.videolan.org/x264.git"

relative_path "x264"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
  "PATH" => "#{install_dir}/embedded/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
}

build do
  command [ "./configure", "--prefix=#{install_dir}/embedded",
          "--enable-shared",
          ], :env => env
  command "make -j #{max_build_jobs}", :env => env
  command "make install", :env => env
  command "cp #{install_dir}/embedded/bin/x264 #{install_dir}/bin"

end
