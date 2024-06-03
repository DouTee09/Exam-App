// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// function reloadPage() {
//     location.reload();
// }
document.addEventListener("DOMContentLoaded", (event) => {
    document.getElementById('add-question').addEventListener('click', function( ) {
        var template = document.getElementById('question-template').content;
        document.body.appendChild(template);
    });

    // document.getElementById('questions-container').addEventListener('click', function(event) {
    //     if (event.target && event.target.matches('.delete-button')) {
    //         event.preventDefault();
    //         event.target.closest('.ques-fea').remove();
    //     }
    // });
    // document.getElementById('add-answer').addEventListener('click', function(event) {
    //         event.preventDefault();
    //         var tem = document.getElementById('answer-template').content.cloneNode(true);
    //         document.getElementById('form-check').appendChild(tem);
    // });
    function addNewAnswer() {
        
    }
});