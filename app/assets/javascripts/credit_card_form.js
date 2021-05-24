$(document).on('ready turbolinks:load', function() {

    var show_error, stripeResponseHandler, submitHandler;
    
    submitHandler = function (event) {
        event.preventDefault()
    
    var $form = $(event.target);
    
    $form.find("input[type=submit]").prop("disabled", true);
    var elements = stripe.elements();
   
    var cardElement = elements.create('card');
    console.log(cardElement)
    var cardElement = elements.getElement('card');
    // Stripe.createToken(cardElement).then(function(result) {
    //     console.log(result)
     
    //   });
    // if(Stripe){
    // console.log(Stripe)
    // Stripe.card.createToken($form, stripeResponseHandler);
    
    // } else {
    
    // show_error("Failed to load credit card processing functionality. Please reload this page in your browser.")
    
    // }
    
    return false;
    
    };
    
    $(".cc_form").on('submit', submitHandler);
    
    stripeResponseHandler = function (status, response) {
    
    var token, $form;
    
    $form = $('.cc_form');
    console.log(response)
    if (response.error) {
    
    console.log(response.error.message);
    
    show_error(response.error.message);
    
    $form.find("input[type=submit]").prop("disabled", false);
    
    } else {
    
    token = response.id;
    
    $form.append($("<input type=\"hidden\" name=\"payment[token]\" />").val(token));
    
    $("[data-stripe=number]").remove();
    
    $("[data-stripe=cvv]").remove();
    
    $("[data-stripe=exp-year]").remove();
    
    $("[data-stripe=exp-month]").remove();
    
    $("[data-stripe=label]").remove();
    
    $form.get(0).submit();
    
    }
    
    return false;
    
    };
    
    show_error = function (message) {
    
    if($("#flash-messages").size() < 1){
    
    $('div.container.main div:first').prepend("<div id='flash-messages'></div>")
    
    }
    
    $("#flash-messages").html('<div class="alert alert-warning"><a class="close" data-dismiss="alert">×</a><div id="flash_alert">' + message + '</div></div>');
    
    $('.alert').delay(5000).fadeOut(3000);
    
    return false;
    
    };
    
    });