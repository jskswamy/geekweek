var GeekWeek = Class.create({
  initialize: function() {
    this.domNode = $('iphone_body');
    this.attachNecessaryEvents();
  },

  attachNecessaryEvents: function() {
    this.attachNavigationLinks();
    this.attachTextBoxEvents();
    this.attachSubmit();
  },

  attachNavigationLinks: function() {
    this.domNode.select('a.navigation').each(function(link) {
      link.observe('click', this.loadContent.bindAsEventListener(this));
    }.bind(this));
  },

  attachSubmit: function() {
    this.domNode.select('a.submit').each(function(link) {
      link.observe('click', this.submitForm.bindAsEventListener(this));
    }.bind(this));
  },

  attachTextBoxEvents: function() {
    this.domNode.select('input').each(function(text) {
      text.observe('blur', this.maskTextField.bindAsEventListener(this));
      text.observe('focus', this.clearTextField.bindAsEventListener(this));
      text.value = text.value === "" ? text.readAttribute("title") : text.value;
    }.bind(this));
  },

  loadContent: function(e) {
    var url = e.element().readAttribute("data-url");
    var request = new Ajax.Request(url, {
      method: 'get',
      onSuccess: function(response) {
        this.domNode.update().update(response.responseText);
        this.attachNecessaryEvents();
      }.bind(this)
    });
  },

  clearTextField: function(e) {
    var text = e.element();
    var maskedText = text.readAttribute("title");
    text.value = (text.value == maskedText ? "" : text.value);
  },

  maskTextField: function(e) {
    var text = e.element();
    var maskedText = text.readAttribute("title");
    text.value = (text.value === "" ? maskedText : text.value);
  },

  submitForm: function(e) {
    var button = e.element();
    var form = button.up('form');
    var submitRequest = new Ajax.Request(form.action, {
      parameters: form.serialize(),
      onSuccess: function(response) {
        this.domNode.update().update(response.responseText);
        this.attachNecessaryEvents();
      }.bind(this)
    });
  }

});
