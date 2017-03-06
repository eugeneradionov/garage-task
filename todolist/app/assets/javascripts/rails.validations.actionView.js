window.ClientSideValidations.formBuilders['ActionView::Helpers::FormBuilder'] = {
    add: function(element, settings, message) {
        $(element).parent().parent().find('.errors')
            .html('* ' + message.charAt(0).toUpperCase() + message.slice(1));
    },

    remove: function(element, settings) {
        $(element).parent().parent().find('.errors').remove();
    }
};

window.ClientSideValidations.callbacks.element.fail = function(element, message, callback) {
    callback();
    if (element.data('valid') !== false) {
        element.parent().parent().find('.errors')
            .hide().show('slide', {direction: "left", easing: "easeOutBounce"}, 700)
    }
};

window.ClientSideValidations.callbacks.element.pass = function(element, callback) {
    element.parent().parent().find('.errors')
        .hide('slide', {direction: "left"}, 500, callback);
};
