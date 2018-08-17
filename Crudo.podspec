Pod::Spec.new do |s|
  s.name             = 'Crudo'
  s.version          = '1.0'
  s.summary          = 'A Swifty library for constructing forms.'

  s.description      = 'Building forms sucks. So maybe do it once and never again. We built Crudo to construct complex forms as quickly as possible. It is just opinionated enough but still leaves enough flexibilty to handle things like validation in whatever way you want.'

  s.homepage         = 'https://github.com/urbn/Crudo'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jason Grandelli' => 'jgrandelli@urbn.com' }
  s.source           = { :git => 'https://github.com/urbn/Crudo.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Crudo/Classes/**/*'
end
