styles = """
/*
 * "my gift for LiSimeng"💕
 * Authored by GengSiyu
 */

body {
  background-color: #1a1c24; color: #fff;
  font-size: 1.0rem; line-height: 1.4;
  -webkit-font-smoothing: subpixel-antialiased;
}

/*
 * ...
 * ...hello
 * 你生日快到了，该给你点什么呢~
 * 写一个网页给你吧，送你一颗小心心~
 * 可是~要怎么做呢~
 * 首先做一个框框来放我们的代码吧ww
 * 那么~开动啦！！
 */

pre {
  position: fixed;
  top: 30px; bottom: 30px;
  transition: left 500ms;
  overflow: auto;
  background-color: #313744; color: #a6c3d4;
  border: 1px solid rgba(0,0,0,0.2);
  padding: 24px 12px;
  box-sizing: border-box;
  border-radius: 3px;
  box-shadow: 0px 4px 0px 2px rgba(0,0,0,0.1);
}

pre em:not(.comment) { font-style: normal; }

.comment       { color: #707e84; }
.selector      { color: #c66c75; }
.selector .key { color: #c66c75; }
.key           { color: #c7ccd4; }
.value         { color: #d5927b; }

@media screen and (max-width: 768px) {
    pre { left: 6%;right: 6%;top: 50%; }
}

@media screen and (min-width: 768px) {
    pre { width: 48%;left: 50%;bottom: 30px; }
}

@media screen and (max-width: 768px) {
    #heart, #echo {
        position: fixed;
        width: 300px; height: 300px;
        margin: 30px auto;
        left: 0; right: 0;
        text-align: center;
        -webkit-transform: scale(0.95);
        transform: scale(0.95);
    }
}

@media screen and (min-width: 768px) {
    #heart, #echo {
      position: fixed;
      width: 300px; height: 300px;
      top: calc(50% - 150px); left: calc(25% - 150px);
      text-align: center;
      -webkit-transform: scale(0.95);
              transform: scale(0.95);
    }
}

#heart { z-index: 8; }
#echo  { z-index: 7; }

#heart::before, #heart::after, #echo::before, #echo::after {
    content: '';
    position: absolute;
    top: 40px;
    width: 150px; height: 240px;
    background: #c66c75;
    border-radius: 150px 150px 0 0;
    -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
    -webkit-transform-origin: 0 100%;
            transform-origin: 0 100%;
}

#heart::before, #echo::before {
  left: 150px;
}

#heart::after, #echo::after {
  left: 0;
  -webkit-transform: rotate(45deg);
          transform: rotate(45deg);
  -webkit-transform-origin: 100% 100%;
          transform-origin: 100% 100%;
}

/* 给它加上一点阴影ww */

#heart::after {
  box-shadow:
    inset -6px -6px 0px 6px rgba(255,255,255,0.1);
}

#heart::before {
  box-shadow:
    inset 6px 6px 0px 6px rgba(255,255,255,0.1);
}

#heart i::before {
  content: 'LiSimeng';
  position: absolute;
  z-index: 9;
  width: 100%;
  top: 35%; left: 0;
  font-style: normal;
  color: rgba(255,255,255,0.8);
  font-weight: 100;
  font-size: 30px;
  text-shadow: -1px -1px 0px rgba(0,0,0,0.2);
}

@-webkit-keyframes heartbeat {
  0%, 100% {
    -webkit-transform: scale(0.95);
            transform: scale(0.95);
  }
  50% {
    -webkit-transform: scale(1.00);
            transform: scale(1.00);
  }
}

@keyframes heartbeat {
  0%, 100% { transform: scale(0.95); }
  50%      { transform: scale(1.00); }
}

@-webkit-keyframes echo {
  0%   {
    opacity: 0.1;
    -webkit-transform: scale(1);
            transform: scale(1);
  }
  100% {
    opacity: 0;
    -webkit-transform: scale(1.4);
            transform: scale(1.4);
  }
}

@keyframes echo {
  0%   {
    opacity: 0.1;
    transform: scale(1);
  }
  100% {
    opacity: 0;
    transform: scale(1.4);
  }
}

/*
 * 接下来准备让它跳起来吧
 */

#heart, #echo {
  -webkit-animation-duration: 2000ms;
          animation-duration: 2000ms;
  -webkit-animation-timing-function:
    cubic-bezier(0, 0, 0, 1.74);
          animation-timing-function:
            cubic-bezier(0, 0, 0, 1.74);
  -webkit-animation-delay: 500ms;
          animation-delay: 500ms;
  -webkit-animation-iteration-count: infinite;
          animation-iteration-count: infinite;
  -webkit-animation-play-state: paused;
          animation-play-state: paused;
}

#heart {
  -webkit-animation-name: heartbeat;
          animation-name: heartbeat;
}
#echo {
  -webkit-animation-name: echo;
          animation-name: echo;
}

/*
 * 准备好了嘛~！
 */

#heart, #echo {

/*
 * ...3...
 *
 * ...2...
 *
 * ...1...
 *
 * 再等一下~略略略~
 *
 */

  -webkit-animation-play-state: running;
          animation-play-state: running;

/*
 * ...来啦!
 */

}

/*
 * 诶嘿~~
 * 生日快乐！
 *
 */

/*
 * 谨以此网页献给我的好朋友思梦💕
 * 你最可爱ww
 */
"""
finalStyle = styles
openComment = false
isOn = true

writeStyleChar = (which) ->
	# begin wrapping open comments
  if which == '/' && openComment == false
    openComment = true
    styles = $('#style-text').html() + which
  else if which == '/' && openComment == true
    openComment = false
    styles = $('#style-text').html().replace(/(\/[^\/]*\*)$/, '<em class="comment">$1/</em>')
  # wrap style declaration
  else if which == ':'
    styles = $('#style-text').html().replace(/([a-zA-Z- ^\n]*)$/, '<em class="key">$1</em>:')
  # wrap style value
  else if which == ';'
    styles = $('#style-text').html().replace(/([^:]*)$/, '<em class="value">$1</em>;')
  # wrap selector
  else if which == '{'
    styles = $('#style-text').html().replace(/(.*)$/, '<em class="selector">$1</em>{')
  else
    styles = $('#style-text').html() + which
  $('#style-text').html styles
  $('#style-tag').append which

writeStyles = (message, index, interval) ->
  if index < message.length
    pre = document.getElementById 'style-text'
    pre.scrollTop = pre.scrollHeight
    writeStyleChar message[index++]
    if isOn
      setTimeout (->
        writeStyles message, index, if openComment then commentTime else codeTime
      ), interval

skip = () ->
  isOn = false
  setTimeout (->
    $('#style-text').html finalStyle
    $('#style-tag').html finalStyle
    pre = document.getElementById 'style-text'
    pre.scrollTop = pre.scrollHeight
  ), 2*commentTime


# appending the tags I'll need.
$('body').append """
  <style id="style-tag"></style>
	<span id="echo"></span>
	<span id="heart"><i></i></span>
	<pre id="style-text"></pre>
  <div style = 'position: fixed;left: 30px;bottom: 10px;'>
    <a id='skipAnimation'>跳过动画</a>
    <a style='color: #fff' href='http://love.idealclover.top'>重新播放</a>
    <a style='color: #fff' target="_blank" href='https://github.com/idealclover/Love-Gift'>项目地址</a>
    <a style='color: #fff' target="_blank" href='https://www.idealclover.top/'>我的博客</a>
  </div>
"""


#  <a href='https://www.idealclover.top'>idealclover</a>


# faster typing in small iframe on codepen homepage
# time = if window.innerWidth <= 578 then 4 else 16
commentTime = 60
codeTime = 20

$(document).on 'ready page:load', ->
  $('#skipAnimation').click ->
    skip()

# starting it off
writeStyles(styles, 0, commentTime)
