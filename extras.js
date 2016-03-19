var jQ = window.jQuery; // window.$ is something else

/* Reset status icon column to autowidth */
jQ('table#projectstatus th[width=1]').attr('width', '');

/* Go for table folder rows, remove the build counts labels/icons if none are available */
jjQ(document).ready(function() {
  jQ('td img.icon-folder').parent().parent().each(function(x,y,z) {
    jQ('.status_success,.status_unstable,.status_failed', y).each(function(x,statusSpan,z) {
      if (jQ(statusSpan).text().length === 0) {
        jQuery(statusSpan).remove();
      }
    });
  })
});
