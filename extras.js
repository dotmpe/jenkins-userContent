
var jQ = window.jQuery; // window.$ is something else

jQ(document).ready(function() {

  jQ('table#projectstatus th[width=1]').attr('width', '');


  /* Load JJB JSON snippets and render JSON editor */
  jQ('code.json-dict-list').each(
      function(i, el) {

        var sectionKey = jQ(el).parent().prev().text().replace(':','').toLowerCase(),
          data = {};
        /* jshint ignore:start */
        var
          json = jQ(el).text();
          console.log(json);
          var data = JSON.parse((json));
        /* jshint ignore:end */

        jQ(el).text('');

        console.debug("Prettify job-config JSON for section", sectionKey, data);
        jQ(el).JSONView(data);

        //console.log(JSON.stringify(data, null, '  '));
        //jQ(el).text(JSON.stringify(data, null, '  '));

        /* XXX: JSONEditor is unusable, since styling is wrong, and need a template to deal with arrays

        new JSONEditor(el, {
          disable_array_add :true,
          disable_array_delete: true,
          disable_array_reorder: true,
          disable_collapse: true,
          disable_properties: true,
          disable_edit_json: true,
          no_additional_properties: false,
          form_name_root: sectionKey,
          template: 'handlebars',
          schema: {},
          startval: data
        }).disable();

        */

      } );

});

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
