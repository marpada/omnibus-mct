
name 'omnibus-mct'
maintainer 'david.pando@gmail.com'
homepage 'https://github.com/marpada/omnibus-mct'
description 'Bundles some useful media conversion tools'

replaces        'omnibus-mct'
install_path    '/opt/mct'
build_version   '0.9.0'
build_iteration 1

# creates required build directories
dependency 'preparation'

# ffmpeg dependencies/components
dependency 'ffmpeg'
dependency 'yamdi'

# version manifest file
#dependency 'tests'
dependency 'version-manifest'

exclude '\.git*'
exclude 'bundler\/git'
