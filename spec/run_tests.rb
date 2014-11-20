require 'minitest/autorun'
Dir.glob(File.join(File.dirname(__FILE__), '/unit/*_spec.rb')) { |file| require file }
