// force certain pages to be refreshed every time.  mark such pages with
// 'data-cache="never"'
//
    jQuery('div').live('pagehide', function(event, ui){
      var page = jQuery(event.target);

      if(page.attr('data-cache') == 'never'){
        page.remove();
      };
    });

