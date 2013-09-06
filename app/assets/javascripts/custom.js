jQuery(document).ready(function($) {
  
  /*----------- Add clearfix to inline <ul> tags -----------*/
  $('ul.inline').each(function() {
    $(this).addClass('clearfix');
  });

  /*----------- Work Slider -----------*/
  $('#work-slider').flexslider({
    controlNav: false,
    slideshowSpeed: 3500
  });

  /*----------- Client Slider -----------*/
  $('#client-slider').flexslider({
    controlNav: false,
    slideshowSpeed: 3500
  });

  /*----------- Portfolio Slider -----------*/
  $('#portfolio-slider').flexslider({
    controlNav: false,
    slideshowSpeed: 3500
  });

  // Home Slider
  $('#home-slider').flexslider();

  // Testimonials
  $('.testimonials-wrapper .testimonial').quovolver();

  /*----------- Toggles -----------*/ 
  $('.toggles').each(function() {
    $(this).children('.target').first().show();

    $(this).children('.trigger').each(function() {
      if($(this).next('.target').is(':hidden')) {
        $(this).children('.action').html('');
      }
      if($(this).next('.target').is(':visible')) {
        $(this).children('.action').html('');
      }
    });

    $(this).children('.trigger').click(function(e) {
      $(this).next('.target').slideToggle(400, function() {
        if($(this).is(':hidden')) {
          $(this).prev('.trigger').children('.action').html('');
        }
        if($(this).is(':visible')) {
          $(this).prev('.trigger').children('.action').html('');
        }
      });
      e.preventDefault();
    });
  }); 

  /*----------- Accordions -----------*/ 
  $('.accordion').each(function() {
    $(this).children('.target').first().show();

    $(this).children('.trigger').each(function() {
      if($(this).next('.target').is(':hidden')) {
        $(this).children('.action').html('');
      }
      if($(this).next('.target').is(':visible')) {
        $(this).children('.action').html('');
      }
    });

    $(this).children('.trigger').click(function(e) {
      $(this).closest('.accordion').children('.target').each(function() {
        if($(this).is(':visible')) {
          $(this).slideUp();
          $(this).prev('.trigger').find('.action').html('');
        }
      })
      if($(this).next('.target').is(':hidden')) {
        $(this).next('.target').slideDown();
        $(this).children('.action').html('');
      }
      e.preventDefault();
    });
  }); 

  /*----------- Tabs -----------*/
  $('.tabs-wrapper').each(function() {
    // Find first tab and first tab and show it. Add active class to first link
    $(this).find('.tab').first().show();
    $(this).find('.tabs-nav li').first().addClass('active');

    // Hide and show tabs on click
    $(this).find('.tabs-nav li a').click(function(e) {
      e.preventDefault();
      target = $(this).attr('href');
      $(this).closest('.tabs-wrapper').find('.tabs-nav li').removeClass('active');
      $(this).parent('li').addClass('active');
      $(this).closest('.tabs-wrapper').find('.tab').hide();
      $(this).closest('.tabs-wrapper').find(target).fadeIn();
    })  
  });

  /*----------- Icon Lists -----------*/
  $('ul.ul-icon').each(function() {
    icon = $(this).data('icon');
    $(this).children('li').prepend('<i class="icon ' + icon + '"></i>'); 
  })

  /*----------- Skills animation -----------*/

  function skills() {
    
    $('ul.skills li').each(function() {
      docViewTop = $(window).scrollTop();
      docViewBottom = docViewTop + $(window).height();
      elemTop = $(this).offset().top;
      elemBottom = elemTop + $(this).height();
      progress = $(this).data('width') +  '%';
      if((elemBottom <= docViewBottom) && (elemTop >= docViewTop)) {
        $(this).find('.background > div').animate({
          width: progress
        }, 1000);
      }      
    })  
  }

  $('ul.skills').each(skills); 

  $(window).scroll(function() {
    $('ul.skills').each(skills);
  });

  /*----------- Pricing Highlight -----------*/
  $('.pricing ul li.highlight').append('<i class="icon icon-star highlight-icon"></i>');

   /*----------- IE Placeholders -----------*/
  $('[placeholder]').focus(function() {
    var input = $(this);
    if (input.val() == input.attr('placeholder')) {
      input.val('');
      input.removeClass('placeholder');
    }
    }).blur(function() {
      var input = $(this);
      if (input.val() == '' || input.val() == input.attr('placeholder')) {
        input.addClass('placeholder');
        input.val(input.attr('placeholder'));
      }
    }).blur().parents('form').submit(function() {
      $(this).find('[placeholder]').each(function() {
        var input = $(this);
        if (input.val() == input.attr('placeholder')) {
          input.val('');
        }
      })
  });

  /*----------- Footer Form -----------*/
  errors = new Array();
  form = $('#footerForm');
  
  form.submit(function() {
    $('#loading').fadeIn();
    $('#error, #success').hide();
    if(validate()) { 
      submission();
      $('html, body').animate({ scrollTop: $('#results').offset().top }, 'slow');
      return false;
    } else {
      $('#loading').hide();
      $('#error, #results').fadeIn();
      $('html, body').animate({ scrollTop: $('#results').offset().top }, 'slow');
      return false;
    };
  })
  
  function validate() {
    errors.length=0;

    $('.req').each(function() {
      val = $(this).val();
      id = $(this).attr('id');
      if(!val) {
        errors.push(id);
      }
    })
    
    if(errors.length === 0) {
      return true;
    } else {
      $.each(errors, function(index, value) {
        $('#' + value).addClass('error');
      });
      return false;
    }
  }
  
  function submission() {
    var name = $("input#footername").val();  
    var email = $("input#footeremail").val();  
    var comments = $("#footercomments").val();
    var dataString = 'name='+ name + '&email=' + email + '&comments=' + comments;  
    //alert (dataString);return false;  
    $.ajax({  
      type: "POST",  
      url: "footer-form.php",  
      data: dataString,  
      success: function() {  
        $('#results, #success').fadeIn();
      $('#loading').hide();
      }  
    });  
    return false;
  }

})