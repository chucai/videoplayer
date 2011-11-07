module VideoPlayerHelper
   def video_player(url_bad='',live=true,width=500, height=400)
    flash_url_bad = "http://#{request.env["HTTP_HOST"]}/player.swf"
    flash_url = flash_url_bad
    player = "<object width='#{width}' height='#{height}'>"
    player += '<param value="transparent" name="wmode"></param>'
    player +=  "<param value='#{flash_url}' name='movie'></param>"
    url = URI.escape(url_bad, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    if live
      player += "<param value='src=#{url}&streamType=live&autoRewind=true&autoPlay=true&bufferingOverlay=false&autoDynamicStreamSwitch=false&optimizeInitialIndex=false&bufferTime=0&initialBufferTime=0&expandedBufferTime=0&dynamicStreamBufferTime=0&dvrBufferTime=0&dvrDynamicStreamingBufferTime=0&liveBufferTime=0&liveDynamicStreamingBufferTime=0&minContinuousPlaybackTime=0' name='flashvars'> </param> "
    else
      player += "<param value='src=#{url}&autoRewind=true&autoPlay=true' name='flashvars'> </param>"
    end

    player += "<param value='true' name='allowFullScreen'></param>
            <param value='always' name='allowscriptaccess'></param>
            <embed width='#{width}' height='#{height}' wmode='transparent'"
    if live
      player += "flashvars='src=#{url}&streamType=live&autoRewind=true&autoPlay=true&bufferingOverlay=false&autoDynamicStreamSwitch=false&optimizeInitialIndex=false&bufferTime=0&initialBufferTime=0&expandedBufferTime=0&dynamicStreamBufferTime=0&dvrBufferTime=0&dvrDynamicStreamingBufferTime=0&liveBufferTime=0&liveDynamicStreamingBufferTime=0&minContinuousPlaybackTime=0'"
    else
      player += "flashvars='src=#{url}&autoRewind=true&autoPlay=true'"
    end

    player += " allowfullscreen='true'  allowscriptaccess='always'  type='application/x-shockwave-flash'
        src='#{flash_url}'> </embed></object>"
    return player
  end


end
