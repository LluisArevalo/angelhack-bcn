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

  function priorityVoteClick(){
    $('.priority-tabs div').on('click', votePriority);
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
  var activeClass = "active";

  var init = function(){
    var initiativeId = $('#js-initiative-id').val();
    var userId = $('#js-user-id').val();

    $('.js-priority-tabs').find('div').on('click', function(){
      var priorityId = $(this).data('priority-id');
      votePriority(initiativeId, priorityId, userId);
    });

    $('.js-status-tabs').find('div').on('click', function(){
      var statusId = $(this).data('status') == 'yes';
      voteStatus(initiativeId, userId, statusId);
    });
  }

  var votePriority = function(initiativeId, priorityId, userId){
    $.ajax({
      url: url + initiativeId + urlPriority,
      method: 'POST',
      data: {
        'user_id' : userId,
        'priority_id' : priorityId
      },
      success: function(){
        $('.js-priority-tabs').find('div').removeClass(activeClass);
        $('.js-priority-tabs').find('*[data-priority-id="' + priorityId + '"]').addClass(activeClass);
      },
      error: function(){
        console.log('Error voting the priority of the Initiative');
      }
    });
  }

  var voteStatus = function(initiativeId, userId, solved){
    $.ajax({
      url: url + initiativeId + urlStatus,
      method: 'POST',
      data: {
        'user_id' : userId,
        'solved' : solved
      },
      success: function(){
        var solvedStatus = solved ? "yes" : "no";
        $('.js-status-tabs').find('div').removeClass(activeClass);
        $('.js-status-tabs').find('[data-status="' + solvedStatus + '"]').addClass(activeClass);
      },
      error: function(){
        console.log('Error voting the status of the Initiative');
      }
    });
  }

  return {
    'init' : init,
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
  } else if ($('#initiative-information').length > 0){
    initiatives.init();
  }
  init.priorityVoteClick();
});