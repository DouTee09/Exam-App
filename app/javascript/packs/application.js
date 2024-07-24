// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery
//= require jquery_ujs

import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

Rails.start()
ActiveStorage.start()


$(document).ready(function() {
    function convertToParamsUrl(str) {
        return encodeURIComponent(str);
    }
    
    console.log( "document loaded" );
    $("#search-input").on("keyup", function(event) {
        const url = "/search";
        let fullURL = url + "?query=" + convertToParamsUrl(event.target.value)
        $.ajax({
            type: 'GET',
            url: fullURL,
            dataType: "script",
            success: function (data) {
                $("#content_search").css("display","block");
            }
        });
    })
});