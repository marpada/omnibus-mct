name "tests"
version "0.0.1"

build do
  # Tests
  command "#{install_dir}/bin/ffmpeg -version | head -1 | grep #{version}"
  command "echo $(pwd) > /tmp/pwd.txt'"
  Dir.glob('tests/input/*').each do |input|
    base_name = input.gsub(/\.*$/,'')
    command "#{install_dir}/bin/ffmpeg -y -i #{input} -acodec libfaac -ab 128k -ar 44100 -ac 2 -vcodec libx264 -f mp4 #{base_name}.mp4"
    command "#{install_dir}/bin/qt-faststat #{base_name}.mp4 #{base_name}.mp4"
  end
end
