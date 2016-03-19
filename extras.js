var jQ = window.jQuery; // window.$ is something else

/* Reset status icon column to autowidth */
jQ('table#projectstatus th[width=1]').attr('width', '');

/* Go for table folder rows, remove the build counts labels/icons if none are available */
jQ(window.document).ready(function() {
  jQ('td img.icon-folder').parent().parent().each(function(x,y) {
    jQ('.status_success,.status_unstable,.status_failed', y).each(function(x2,statusSpan) {
      if (jQ(statusSpan).text().length === 0) {
        jQ(statusSpan).remove();
      }
    });
  });
});
