require File.dirname(__FILE__) + '/test_helper.rb' 
include VideoPlayerHelper

class VideoPlayerHelperTest < ActiveSupport::TestCase 
  test "should return object when run video_player" do
    assert_equal '', video_player('1.flv')
  end
end
