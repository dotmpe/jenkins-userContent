
Handlebars.registerHelper("replace", function (str, a, b) {
    if(str && typeof str === "string") {
      return str.split(a).join(b);
    }
  }
);

