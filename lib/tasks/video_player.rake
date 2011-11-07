# desc "Explaining what the task does"
# task :video_player do
#   # Task goes here
# end
require 'fileutils'
include FileUtils::Verbose
desc "copy player.swf to public dir"
task :copy_video_player do 
  play_swf = File.join(File.dirname(__FILE__),"player.swf")
  cp(play_swf, File.join(RAILS_ROOT, "public"))
end
