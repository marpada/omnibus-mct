name "libfaac"
version "1.28"


source :url => "http://downloads.sourceforge.net/faac/faac-#{version}.tar.gz",
       :md5 => "80763728d392c7d789cde25614c878f6"

relative_path "faac-#{version}"

env = {
  "LDFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "CFLAGS" => "-L#{install_dir}/embedded/lib -I#{install_dir}/embedded/include",
  "LD_RUN_PATH" => "#{install_dir}/embedded/lib"
}

build do
  command ["./configure",
           "--prefix=#{install_dir}/embedded",
          ]
  command "sed -i -r '/^char \\*strcasestr/d' common/mp4v2/mpeg4ip.h"
  command "make -j #{max_build_jobs}", :env => env
  command "make install", :env => env
  command "cp #{install_dir}/embedded/bin/faac #{install_dir}/bin"

end

