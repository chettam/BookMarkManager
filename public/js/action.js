/**
 * Created by jbblanc on 12/12/13.
 */
$(document).ready(function () {
    $('#sign-in').click(function () {
        $('#user_sign_in').dialog({modal:true,dialogClass: 'fixed-dialog'});
    });
    $('#sign-up').click(function () {
        $('#add-user').dialog({modal:true,dialogClass: 'fixed-dialog'});
    });
});


function prepareNewLinkHandler() {
    $('.add-link, .add_user, .add_session').click(function(event) {
        $.get($(this).attr("href"), function(data) {
            $('.ui-dialog-titlebar-close').trigger('click');
            var $dialog = $("<div class='current_link form'></div>").html(data).dialog();
            $dialog.dialog({
                dialogClass:'dialog'
            })
        });
        /* prevents the browser from sending a GET request */
        event.preventDefault();
    });
}

function prepareFormHandler() {
    var form = $('.current_link form');
    form.submit(function(event) {
        var addLink = function(data) {
            $('#links').prepend(data);
        }
        var data = form.serialize();
        $.post(form.attr('action'), data, addLink);
        event.preventDefault();
    })
}

$(function() {
    prepareNewLinkHandler();
    prepareFormHandler()
})

