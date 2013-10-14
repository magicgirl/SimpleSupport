$(document).ready ->
  $("#ticket-text-editor").ace_wysiwyg(
    toolbar: [
      "font",
      null,
      "fontSize",
      null,
    {
      name: "bold"
      className: "btn-info"
    },
    {
      name: "italic"
      className: "btn-info"
    },
    {
      name: "underline"
      className: "btn-info"
    },
      null,
    {
      name: "insertunorderedlist"
      className: "btn-success"
    },
    {
      name: "insertorderedlist"
      className: "btn-success"
    },
    {
      name: "outdent"
      className: "btn-purple"
    },
    {
      name: "indent"
      className: "btn-purple"
    },
      null,
    {
      name: "justifyleft"
      className: "btn-primary"
    },
    {
      name: "justifycenter"
      className: "btn-primary"
    },
    {
      name: "justifyright"
      className: "btn-primary"
    },
    {
      name: "justifyfull"
      className: "btn-inverse"
    },
      null,
    {
      name: "createLink"
      className: "btn-pink"
    },
    {
      name: "unlink"
      className: "btn-pink"
    },
      null,
    {
      name: "insertImage"
      className: "btn-success"
    },
      null,
      "foreColor",
      null,
    {
      name: "undo"
      className: "btn-grey"
    },
    {
      name: "redo"
      className: "btn-grey"
    }
    ],
    speech_button : false
  ).prev().addClass "wysiwyg-style2"

  $('#ticket-text-editor').html($('#ticket_message').val())

  $('#new_ticket').focusout ->
    $('#ticket_message').val($('#ticket-text-editor').cleanHtml())