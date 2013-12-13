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
    $('#add-link').click(function () {
        $('#new-link').dialog({modal:true,dialogClass: 'fixed-dialog'});
    });
});