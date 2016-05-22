var init = (function(){
  function scrollToAnchor(aid){
    var aTag = $("[id='"+ aid +"']");
    $('html,body').animate({scrollTop: aTag.offset().top},'slow');
  }

  function headerLinkClick(){
    $('.go-down').on('click', function(){
      scrollToAnchor('more-info');
      return false;
    });
  }

  var currentIndex = 0;
  var messageText = ["doing good", "doing bad", "robing you"];
  var timeoutId;
  var stopTimeout = false;

  function addHeaderMessage(){
    timeoutId = setTimeout(function(){
      var current = $('.js-what-doing').html();
      var following = current.length;

      $('.js-what-doing').append(messageText[currentIndex][following]);
      clearTimeout(timeoutId);

      if(following < messageText[currentIndex].length){
        addHeaderMessage();
      } else {
        if(!stopTimeout){
          timeoutId = setTimeout(function(){
            eraseHeaderMessage();
          }, 2500);
        }
      }
    }, 100);
  }

  function eraseHeaderMessage(){
    timeoutId = setTimeout(function(){
      var what = $('.js-what-doing');
      what.html(what.html().slice(0, -1));
      
      clearTimeout(timeoutId);
      if(what.html().length > 0){
        eraseHeaderMessage();
      } else {
        timeoutId = setTimeout(function(){
          currentIndex++;
          if(currentIndex == messageText.length){
            currentIndex = 0;
            stopTimeout = true;
          }
          addHeaderMessage();
        }, 100);
      }
    }, 100);
  }

  return {
    'scrollToAnchor' : scrollToAnchor,
    'headerLinkClick' : headerLinkClick,
    'addHeaderMessage' : addHeaderMessage,
    'eraseHeaderMessage' : eraseHeaderMessage
  }
})();

var initiatives = (function(){
  var url = '/initiatives/';
  var urlPriority = '/vote_priority';
  var urlStatus = '/vote_status';

  var votePriority = function(){
    $.ajax({
      url: url + '3' + urlPriority,
      method: 'POST',
      success: function(){
        console.log('oh yeah!');
      },
      error: function(){
        console.log('moooc, errooooor');
      }
    });
  }

  var voteStatus = function(){
    $.ajax({
      url: url + '3' + urlStatus,
      method: 'POST',
      data: {
        'user_id' : '6',
        'solved' : true
      },
      success: function(){
        console.log('suuuuuuuuu');
      },
      error: function(){
        console.log('ja jaaaaaa');
      }
    });
  }

  return {
    'votePriority' : votePriority,
    'voteStatus' : voteStatus
  }
})();

$(document).on('ready', function(){
  if($('#home-page').length > 0) {
    init.headerLinkClick();
    setTimeout(function(){
      init.addHeaderMessage();
    }, 500);
  }
});