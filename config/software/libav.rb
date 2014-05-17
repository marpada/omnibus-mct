name "libav"
version "10"

dependency "lame"
dependency "libfaac"
dependency "libogg"
dependency "libvorbis"
dependency "libtheora"
dependency "libx264"
dependency "opencore-amr"
dependency "libvpx"
dependency "yasm"
dependency "zlib"

source :url => "http://libav.org/releases/libav-#{version}.tar.gz",
       :md5 => "c74be20ef4725908d44ea02db480fd40"

relative_path "libav-#{version}"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
  "PATH" => "#{install_dir}/embedded/bin:#{ENV['PATH']}",
}

build do
  command ["./configure",
           "--prefix=#{install_dir}/embedded",
           "--enable-gpl",
           "--enable-version3",
           "--enable-nonfree",
           "--enable-shared",
           "--enable-libmp3lame",
           "--enable-libx264",
           "--enable-libfaac",
           "--enable-libvpx",
           "--enable-libvorbis",
           "--enable-libopencore-amrnb",
           "--enable-libopencore-amrwb",
           "--enable-libtheora",
          ], :env => env
  command "make -j #{max_build_jobs}", :env => env
  command "make install", :env => env
  #command "make tools/qt-faststart", :env => env
  #command "cp tools/qt-faststart #{install_dir}/embedded/bin"
  #%w{ffmpeg  ffprobe  ffserver qt-faststart}.each do |f|
    #command "cp #{install_dir}/embedded/bin/#{f} #{install_dir}/bin"
  #end

end
