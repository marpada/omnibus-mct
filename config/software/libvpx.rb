name "libvpx"
version "1.3.0"

dependency "yasm"

source :url => "http://webm.googlecode.com/files/libvpx-v#{version}.tar.bz2",
       :md5 => "14783a148872f2d08629ff7c694eb31f"

relative_path "libvpx-v#{version}"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib",
  "PATH" => "#{install_dir}/embedded/bin:#{ENV['PATH']}",
}

build do
  command ["./configure",
           "--prefix=#{install_dir}/embedded",
           "--enable-shared",
          ], :env => env
  command "make -j #{max_build_jobs}", :env => env
  command "make install", :env => env
  %w{vpxdec  vpxenc}.each do |f|
    command "cp #{install_dir}/embedded/bin/#{f} #{install_dir}/bin"
  end


end
