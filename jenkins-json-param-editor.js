
/* globals editor_BA_r, editor_JSONFile */

/* Strip headers in certain JSON editor instances */
function removeSurplusHeaders(headers) {
  headers.each(function(i, x) {

    var p = jQuery(x).parent().parent().parent();
    if (p.attr('data-schematype') === 'object') {
      if (p.children(':nth-child(2)')[0].tagName === 'SELECT') {
        x.remove();
      }
    }

  });
}

/* Display title in headers */
function displayHeaders(x) {
  x.find('h3 span[style="display: none;"]').attr('style', '');
}

function rm_BA_r() {
  removeSurplusHeaders( jQuery('#editor_BA_r_holder div[data-schematype] > h3') );
  displayHeaders( jQuery('#editor_BA_r_holder') );
}
function rm_JSONFile() {
  removeSurplusHeaders( jQuery('#editor_JSONFile_holder div[data-schematype] > h3') );
  displayHeaders( jQuery('#editor_JSONFile_holder') );
}
jQuery(document)
  .on('ready', function() {
      if (typeof editor_BA_r !== 'undefined') {
        editor_BA_r.on('ready', rm_BA_r);
        editor_BA_r.on('change', rm_BA_r) ;
      }
      if (typeof editor_JSONFile !== 'undefined') {
        editor_JSONFile.on('ready', rm_JSONFile);
        editor_JSONFile.on('change', rm_JSONFile);
      }
    });

